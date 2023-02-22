import 'dart:async';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:WallyMart/controller/homeController.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homePageController>(
      init: homePageController(),
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white.withOpacity(1),
          body: ConnectivityWidgetWrapper(
            child: Obx(
              (() => _.dataLoaded.value
                  ? RefreshIndicator(
                      onRefresh: () {
                        return Future.delayed(Duration(milliseconds: 2), () {
                          _.resetCall();
                          // setState(() {
                          //   controller.fetchWallpapers();
                          //   controller.query = ''.obs;
                          // });
                        });
                      },
                      child: SafeArea(
                        child: Column(
                          children: [
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('category',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                              )
                            ]),
                            SizedBox(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(children: [
                                      GestureDetector(
                                          onTap: () {
                                            _.setQuery('person');
                                            // setState(() {
                                            //   controller.query = 'person'.obs;
                                            // });
                                            // controller.fetchCategoryWallpapers();
                                            // print(controller.query);
                                          },
                                          child: SizedBox(
                                              height: 90,
                                              width: 140,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.asset(
                                                          'assets/images/person.jpg',
                                                          fit: BoxFit.cover,
                                                          height: 90,
                                                          width: double
                                                              .infinity))))),
                                      GestureDetector(
                                          onTap: () {
                                            _.setQuery('programming');
                                            // setState(() {
                                            //   controller.query = 'programming'.obs;
                                            // });
                                            // controller.fetchCategoryWallpapers();
                                            //
                                            // print(controller.query);
                                          },
                                          child: SizedBox(
                                              height: 95,
                                              width: 140,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.asset(
                                                          'assets/images/programming.jpg',
                                                          fit: BoxFit.cover,
                                                          height: 90,
                                                          width: double
                                                              .infinity))))),
                                      GestureDetector(
                                          onTap: () {
                                            _.setQuery('nature');
                                            // setState(() {
                                            //   controller.query = 'nature'.obs;
                                            // });
                                            // controller.fetchCategoryWallpapers();
                                          },
                                          child: SizedBox(
                                              height: 95,
                                              width: 140,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.asset(
                                                          'assets/images/nature.jpg',
                                                          fit: BoxFit.cover,
                                                          height: 90,
                                                          width: double
                                                              .infinity))))),
                                      GestureDetector(
                                          onTap: () {
                                            _.setQuery('cars');
                                            // setState(() {
                                            //   controller.query = 'cars'.obs;
                                            // });
                                            // controller.fetchCategoryWallpapers();
                                          },
                                          child: SizedBox(
                                              height: 95,
                                              width: 140,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.asset(
                                                          'assets/images/cars.jpg',
                                                          fit: BoxFit.cover,
                                                          height: 90,
                                                          width: double
                                                              .infinity))))),
                                      GestureDetector(
                                          onTap: () {
                                            _.setQuery('indian god');
                                            // setState(() {
                                            //   controller.query = 'indian god'.obs;
                                            // });
                                            // controller.fetchCategoryWallpapers();
                                            // print(controller.query);
                                          },
                                          child: SizedBox(
                                              height: 95,
                                              width: 140,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.asset(
                                                          'assets/images/god.jpg',
                                                          fit: BoxFit.cover,
                                                          height: 90,
                                                          width: double
                                                              .infinity)))))
                                    ]))),
                            SizedBox(height: 2),
                            Row(children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${_.query} wallpapers',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)))
                            ]),
                            Flexible(
                              child: GridView.builder(
                                itemCount: 79,
                                physics: BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7),
                                itemBuilder: ((context, index) {
                                  return SizedBox(
                                    height: 300,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Get.to(
                                        //   ImagePreview(),
                                        //   curve: Curves.easeInExpo,
                                        //   duration: Duration(seconds: 1),
                                        //   arguments: [
                                        //     controller.wallpaper!.photos![index]
                                        //         .src!.portrait
                                        //         .toString()
                                        //   ],
                                        // );
                                        _.redirect_to(_.wallpaper!
                                            .photos![index].src!.portrait
                                            .toString());
                                      },
                                      child: Card(
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            memCacheHeight: 500,
                                            memCacheWidth: 500,
                                            fadeInCurve: Curves.easeInCubic,
                                            fadeInDuration: const Duration(
                                                milliseconds: 1500),
                                            filterQuality: FilterQuality.high,
                                            imageUrl: _.wallpaper!
                                                .photos![index].src!.portrait
                                                .toString(),
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: Image.asset(
                                                  'assets/images/placeholder.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: GFLoader(
                        type: GFLoaderType.square,
                      ),
                    )),
            ),
          ),
          bottomNavigationBar: Obx(() => homePageController().ad()),
        );
      },
    );
  }
}
