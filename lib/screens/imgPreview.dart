
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:WallyMart/controller/imagepreviewController.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagePreviewController>(
      init: ImagePreviewController(),
      builder: (_) {
        return Scaffold(
            body: Obx(()=>
               Stack(children: [
          Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child:  CachedNetworkImage(
                      imageUrl: _.Url.value,
                      fit: BoxFit.fill,

                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      fadeInCurve: Curves.easeIn,
                      fadeInDuration: Duration(milliseconds: 1500),
                      placeholder: (context, url) => Center(
                        child: Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
          Positioned(
                top: 800,
                left: 100,
                right: 100,
                bottom: 5,
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(124, 46, 32, 199),
                              Color.fromARGB(168, 72, 224, 216)
                            ],
                            tileMode: TileMode.clamp,
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 10,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              )),
                              context: context,
                              builder: (BuildContext contexr) {
                                return SizedBox(
                                    height: 200,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  child: Divider(
                                                      height: 10,
                                                      thickness: 4,
                                                      color: Colors.grey))),
                                          Column(children: [
                                            GestureDetector(
                                                onTap: () {
                                                  _.setWallpaper(
                                                      _.Url.value,
                                                      _.home);
                                                  Navigator.pop(context);
                                                },
                                                child: ListTile(
                                                    leading: Icon(
                                                      Icons.home_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                        'set to home screen'))),
                                            GestureDetector(
                                                onTap: () {
                                                  _.setWallpaper(
                                                      _.Url.value,
                                                      _.lock);
                                                  Navigator.pop(context);
                                                },
                                                child: ListTile(
                                                    leading: Icon(
                                                      Icons.lock_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                        'set to lock screen'))),
                                            GestureDetector(
                                                onTap: () {
                                                  _.setWallpaper(
                                                      _.Url.value,
                                                      _.both);
                                                  Navigator.pop(context);
                                                },
                                                child: ListTile(
                                                    leading: Icon(
                                                        Icons.wallpaper_outlined,
                                                        color: Colors.black),
                                                    title: Text(
                                                        'set to both screen')))
                                          ])
                                        ])));
                              });
                        },
                        child: Icon(
                          Icons.download,
                          size: 30,
                          color: Colors.white,
                        ))))
        ]),
            ));
      },
    );
  }
}
