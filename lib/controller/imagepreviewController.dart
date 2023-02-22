import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//ca-app-pub-1031613441046261~2328085138 app id
//ca-app-pub-1031613441046261/5838001025 unit id
class ImagePreviewController extends GetxController {
  var result;
  RxString wallpaper_set = 'not set'.obs;
  var msg;
  var url = Get.arguments;
  RxString Url = ''.obs;
  @override
  void onInit() {
    super.onInit();
    Url.value = url;
    print('image url----------------------');
    print(Url.value);
  }
  var home = AsyncWallpaper.HOME_SCREEN;
  var lock = AsyncWallpaper.LOCK_SCREEN;
  var both = AsyncWallpaper.BOTH_SCREENS;
  @override
  void onClose() {

    super.onClose();
    ImagePreviewController().dispose();
    Url.value = '';


  }
  void setWallpaper(String imgUrl, int screen) async {
    wallpaper_set.update((val) {
      wallpaper_set = 'loading'.obs;
    });
    try {
      var imgFile = await DefaultCacheManager().getSingleFile(imgUrl);
      var filePath = imgFile.path;
      result = await AsyncWallpaper.setWallpaperFromFile(
          filePath: filePath, wallpaperLocation: screen, goToHome: true);

      // set = print(set);
      wallpaper_set.update((val) {
        wallpaper_set = 'done'.obs;
      });

      if (screen == 1) {
        msg = 'Home Screen';
      } else if (screen == 2) {
        msg = 'Lock Screen';
      } else if (screen == 3) {
        msg = 'Both Screen';
      }

      Fluttertoast.showToast(msg: 'wallpaper has been set to $msg');
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went wrong');
    }
  }
}
