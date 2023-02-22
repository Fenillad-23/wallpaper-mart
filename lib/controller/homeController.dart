import 'dart:convert';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../model/images.dart';
import 'package:http/http.dart' as http;

import '../screens/imgPreview.dart';

class homePageController extends GetxController {
  wallpapers? wallpaper;
  RxInt i = 1.obs;
  RxString query = ''.obs;
  RxBool dataLoaded = false.obs;
  RxBool imgloaded = false.obs;
  RxBool loaded = false.obs;
  int ImagesToLoad = 200;
  BannerAd _bannerAd = BannerAd(
    size: AdSize.banner,
    adUnitId: "ca-app-pub-1031613441046261/5838001025",
    listener: BannerAdListener(),
    request: AdRequest(),
  );

  String API_KEY = "563492ad6f917000010000014df6eddfa02143fd9ceb352dc4e9ffa2";

  @override
  void onInit() {
    fetchWallpapers();
    super.onInit();
    loadad();
  }

  loadad() async {
    await _bannerAd.load().then((value) => loaded.value = true);
  }

  Widget ad() {
    return loaded.value
        ? Container(
            width: 320,
            height: 50,
            child: AdWidget(
              ad: _bannerAd,
            ),
          )
        : SizedBox();
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

  redirect_to(String url) {
    Get.to(() => ImagePreview(),
        curve: Curves.easeInExpo,
        duration: Duration(seconds: 1),
        arguments: url);
  }

  setQuery(String Query) {
    query.value = Query;
    fetchCategoryWallpapers();
    print(query);
  }

  resetCall() async {
    fetchWallpapers();
    query = ''.obs;
  }
}
