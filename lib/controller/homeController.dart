import 'dart:convert';
import 'package:get/get.dart';
import '../model/images.dart';
import 'package:http/http.dart' as http;

class homePageController extends GetxController {
  wallpapers? wallpaper;
  RxInt i = 1.obs;
  RxString query = ''.obs;
  RxBool dataLoaded = false.obs;
  RxBool imgloaded = false.obs;
  int ImagesToLoad = 200;
  String API_KEY = "563492ad6f917000010000014df6eddfa02143fd9ceb352dc4e9ffa2";
  @override
  void onInit() {
    fetchWallpapers();
    super.onInit();
  }

  fetchWallpapers() async {
    dynamic response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=79&page=$i"),
        headers: {"Authorization": API_KEY});

    if (response.statusCode == 200 || response.statusCode == "200") {
      wallpaper = wallpapers.fromJson(json.decode(response.body));
      dataLoaded.update((val) {
        dataLoaded = true.obs;
      });
      i.update(((val) => i.value++));
      print('\x1b[93m --- ${response.body}');
    }
  }

  fetchCategoryWallpapers() async {
    dataLoaded.update((val) {
      dataLoaded = false.obs;
    });
    dynamic response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=79"),
        headers: {"Authorization": API_KEY});
    if (response.statusCode == 200 || response.statusCode == "200") {
      wallpaper = wallpapers.fromJson(json.decode(response.body));
      dataLoaded.update((val) {
        dataLoaded = true.obs;
      });
      i.update(((val) => i.value++));
      print('\x1b[93m --- ${response.body}');
    }
  }
}
