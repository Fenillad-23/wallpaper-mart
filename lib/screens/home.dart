import 'dart:async';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:WallyMart/controller/homeController.dart';
import 'package:WallyMart/screens/imgPreview.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  homePageController controller = Get.put(homePageController());
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white.withOpacity(1),
        body: ConnectivityWidgetWrapper(
            child: Obx((() => controller.dataLoaded.value
                ? RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(milliseconds: 2), () {
                        setState(() {
                          controller.fetchWallpapers();
                          controller.query = ''.obs;
                        });
                      });
                    },
                    child: SafeArea(
                        child: Column(children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('category',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
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
                                      setState(() {
                                        controller.query = 'person'.obs;
                                      });
                                      controller.fetchCategoryWallpapers();
                                      print(controller.query);
                                    },
                                    child: SizedBox(
                                        height: 90,
                                        width: 140,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                    'assets/images/person.jpg',
                                                    fit: BoxFit.cover,
                                                    height: 90,
                                                    width: double.infinity))))),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controller.query = 'programming'.obs;
                                      });
                                      controller.fetchCategoryWallpapers();

                                      print(controller.query);
                                    },
                                    child: SizedBox(
                                        height: 95,
                                        width: 140,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                    'assets/images/programming.jpg',
                                                    fit: BoxFit.cover,
                                                    height: 90,
                                                    width: double.infinity))))),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controller.query = 'nature'.obs;
                                      });
                                      controller.fetchCategoryWallpapers();
                                    },
                                    child: SizedBox(
                                        height: 95,
                                        width: 140,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                    'assets/images/nature.jpg',
                                                    fit: BoxFit.cover,
                                                    height: 90,
                                                    width: double.infinity))))),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controller.query = 'cars'.obs;
                                      });
                                      controller.fetchCategoryWallpapers();
                                    },
                                    child: SizedBox(
                                        height: 95,
                                        width: 140,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                    'assets/images/cars.jpg',
                                                    fit: BoxFit.cover,
                                                    height: 90,
                                                    width: double.infinity))))),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controller.query = 'indian god'.obs;
                                      });
                                      controller.fetchCategoryWallpapers();
                                      print(controller.query);
                                    },
                                    child: SizedBox(
                                        height: 95,
                                        width: 140,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                    'assets/images/god.jpg',
                                                    fit: BoxFit.cover,
                                                    height: 90,
                                                    width: double.infinity)))))
                              ]))),
                      SizedBox(height: 2),
                      Row(children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${controller.query} wallpapers',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)))
                      ]),
                      Flexible(
                          child: GridView.builder(
                              itemCount: 79,
                              physics: BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.7),
                              itemBuilder: ((context, index) {
                                return SizedBox(
                                    height: 300,
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(ImagePreview(),
                                              curve: Curves.easeInExpo,
                                              duration: Duration(seconds: 3),
                                              arguments: [
                                                controller
                                                    .wallpaper!
                                                    .photos![index]
                                                    .src!
                                                    .portrait
                                                    .toString()
                                              ]);
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
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    imageUrl: controller
                                                        .wallpaper!
                                                        .photos![index]
                                                        .src!
                                                        .portrait
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child: GFLoader(
                                                                type: GFLoaderType
                                                                    .ios)))))));
                              })))
                    ])))
                : const Center(
                    child: GFLoader(
                    type: GFLoaderType.ios,
                  ))))));
  }
}
