import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:getwidget/getwidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImagePreview extends StatefulWidget {
  final String url, photographer;
  const ImagePreview(
      {super.key, required this.photographer, required this.url});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  void initState() {
    super.initState();
  }

  var result;
  String wallpaper_set = 'not set';

  void setWallpaper(String imgUrl) async {
    setState(() {
      wallpaper_set = 'loading';
    });
    try {
      var imgFile = await DefaultCacheManager().getSingleFile(widget.url);
      var filePath = imgFile.path;
      result = await AsyncWallpaper.setWallpaperFromFile(
          filePath: filePath,
          wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
          goToHome: true);
      if (!mounted) {
        return;
      } else {
        setState(() {
          // set = print(set);
          wallpaper_set = "done";
          Fluttertoast.showToast(msg: 'wallpaper has been set to home screen');
        });
      }
    } on PlatformException {
      Fluttertoast.showToast(msg: "WALLPAPER SET FAILED");
    }
  }

  void setlockscreenWallpaper(String imgUrl) async {
    setState(() {
      wallpaper_set = 'loading';
    });
    try {
      var imgFile = await DefaultCacheManager().getSingleFile(widget.url);
      var filePath = imgFile.path;
      result = await AsyncWallpaper.setWallpaperFromFile(
          filePath: filePath,
          wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
          goToHome: true);
      if (!mounted) {
        return;
      } else {
        setState(() {
          // set = print(set);
          wallpaper_set = "done";
          Fluttertoast.showToast(msg: 'wallpaper has been set to lock screen');
        });
      }
    } on PlatformException {
      Fluttertoast.showToast(msg: "WALLPAPER SET FAILED");
    }
  }

  void setbothscreenWallpaper(String imgUrl) async {
    setState(() {
      wallpaper_set = 'loading';
    });
    try {
      var imgFile = await DefaultCacheManager().getSingleFile(widget.url);
      var filePath = imgFile.path;
      result = await AsyncWallpaper.setWallpaperFromFile(
          filePath: filePath,
          wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
          goToHome: true);
      if (!mounted) {
        return;
      } else {
        setState(() {
          // set = print(set);
          wallpaper_set = "done";
          Fluttertoast.showToast(msg: 'wallpaper has been set to both screen');
        });
      }
    } on PlatformException {
      Fluttertoast.showToast(msg: "WALLPAPER SET FAILED");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.url,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.url,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: GFLoader(
                        type: GFLoaderType.ios,
                      ),
                    ),
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
            child: SizedBox(
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Color.fromARGB(179, 0, 0, 0),
                      // elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                      context: context,
                      builder: (BuildContext contexr) {
                        return SizedBox(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.0),
                                    onPressed: () {
                                      setWallpaper(widget.url.toString());
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.wallpaper,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'set to home',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )),
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.0),
                                    onPressed: () {
                                      setlockscreenWallpaper(
                                          widget.url.toString());
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'set to Lock',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )),
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.0),
                                    onPressed: () {
                                      setbothscreenWallpaper(
                                          widget.url.toString());
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.send_to_mobile_sharp,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'set to Both',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Icon(
                  Icons.download,
                  size: 30,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            // child: GestureDetector(
            //   onTap: () {
            //     setWallpaper(widget.url.toString());
            //   },
            //   child: Container(
            //       height: 50,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         gradient: const LinearGradient(
            //             begin: Alignment.topRight,
            //             end: Alignment.bottomLeft,
            //             colors: [
            //               Color.fromARGB(199, 210, 77, 175),
            //               Color.fromARGB(197, 203, 50, 8),
            //             ]),
            //       ),
            //       child: const Center(
            //           child: Text(
            //         "set wallpaper",
            //         style: TextStyle(color: Colors.white),
            //       ))),
            // ),
          )
        ],
      ),
    );
  }
}
