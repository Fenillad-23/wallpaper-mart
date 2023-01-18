import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaper_mart/imgPreview.dart';
import 'package:wallpaper_mart/networkHelper.dart';
import 'package:wallpaper_mart/reusable_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List wallpapers;
  int i = 1;
  bool dataLoaded = false;
  bool imgloaded = false;

  int ImagesToLoad = 200;

  @override
  void initState() {
    super.initState();
    fetchWallpapers();
  }

  fetchWallpapers() async {
    dynamic response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=79&page=$i"),
        headers: {"Authorization": API_KEY});
    if (response.statusCode == 200 || response.statusCode == "200") {
      Map<String, dynamic> mappedData = json.decode(response.body);
      wallpapers = mappedData['photos'];
      wallpapers.shuffle();
      dataLoaded = true;
      setState(() {
        i++;
      });
      print('\x1b[93m --- $wallpapers');
    }
  }

  TextEditingController searchbarController = TextEditingController();

  String API_KEY = "563492ad6f917000010000014df6eddfa02143fd9ceb352dc4e9ffa2";
  // static final customCacheManager = CacheManager(confi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white.withOpacity(1),
      body: dataLoaded
          ? RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(milliseconds: 1500), () {
                  setState(() {
                    fetchWallpapers();
                  });
                });
              },
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: textField(
                          Icons.search, "Search", searchbarController),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Flexible(
                      child: GridView.builder(
                        itemCount: 79,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: ((context, index) {
                          return SizedBox(
                            height: 300,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => ImagePreview(
                                        url: wallpapers[index]['src']
                                            ['portrait'],
                                        photographer: wallpapers[index]
                                            ['photographer'])),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: wallpapers[index]['src']['original'],
                                child: Card(
                                  child: CachedNetworkImage(
                                    imageUrl: wallpapers[index]['src']
                                            ['portrait']
                                        .toString(),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: GFLoader(
                                        type: GFLoaderType.ios,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: GFLoader(
                type: GFLoaderType.ios,
              ),
            ),
    );
  }
}
