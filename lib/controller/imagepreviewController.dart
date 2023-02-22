import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImagePreviewController extends GetxController {
  var result;
  RxString wallpaper_set = 'not set'.obs;

  void setWallpaper(String imgUrl) async {
    wallpaper_set.update((val) {
      wallpaper_set = 'loading'.obs;
    });
    try {
      var imgFile = await DefaultCacheManager().getSingleFile(imgUrl);
      var filePath = imgFile.path;
      result = await AsyncWallpaper.setWallpaperFromFile(
          filePath: filePath,
          wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
          goToHome: true);

      // set = print(set);
      wallpaper_set.update((val) {
        wallpaper_set = 'done'.obs;
      });
      Fluttertoast.showToast(msg: 'wallpaper has been set to home screen');
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went wrong');
    }
  }

  void setlockscreenWallpaper(String imgUrl) async {
    wallpaper_set.update((val) {
      wallpaper_set = 'loading'.obs;
    });
    try {
      var imgFile = await DefaultCacheManager().getSingleFile(imgUrl);
      var filePath = imgFile.path;
      result = await AsyncWallpaper.setWallpaperFromFile(
          filePath: filePath,
          wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
          goToHome: true);

      // set = print(set);
      wallpaper_set.update((val) {
        wallpaper_set = 'done'.obs;
      });
      Fluttertoast.showToast(msg: 'wallpaper has been set to lock screen');
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went wrong');
    }
  }

  void setbothscreenWallpaper(String imgUrl) async {
    wallpaper_set.update((val) {
      wallpaper_set = 'loading'.obs;
    });
    try {
      var imgFile = await DefaultCacheManager().getSingleFile(imgUrl);
      var filePath = imgFile.path;
      result = await AsyncWallpaper.setWallpaperFromFile(
          filePath: filePath,
          wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
          goToHome: true);

      // set = print(set);
      wallpaper_set.update((val) {
        wallpaper_set = 'done'.obs;
      });
      Fluttertoast.showToast(msg: 'wallpaper has been set to both screen');
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went wrong');
    }
  }
}
