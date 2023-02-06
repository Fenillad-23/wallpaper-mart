import 'dart:async';
import 'dart:convert';

import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaper_mart/imgPreview.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'model/images.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  wallpapers? wallpaper;
  int i = 1;
  bool dataLoaded = false;
  bool imgloaded = false;
  String query = '';
  int ImagesToLoad = 200;
  String API_KEY = "563492ad6f917000010000014df6eddfa02143fd9ceb352dc4e9ffa2";
  TextEditingController searchQuery = TextEditingController();
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
      wallpaper = wallpapers.fromJson(json.decode(response.body));
      dataLoaded = true;
      setState(() {
        i++;
      });
      print('\x1b[93m --- $wallpaper');
    }
  }

  fetchCategoryWallpapers() async {
    dataLoaded = false;
    dynamic response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=79"),
        headers: {"Authorization": API_KEY});
    if (response.statusCode == 200 || response.statusCode == "200") {
      wallpaper = wallpapers.fromJson(json.decode(response.body));
      dataLoaded = true;
      setState(() {
        i++;
      });
      // print('\x1b[93m --- $wallpapers');
    }
  }

  TextEditingController searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white.withOpacity(1),
      body: ConnectivityWidgetWrapper(
        child: dataLoaded
            ? RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(milliseconds: 2), () {
                    setState(() {
                      fetchWallpapers();
                      query = '';
                    });
                  });
                },
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('category',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    query = 'person';
                                  });
                                  fetchCategoryWallpapers();
                                  print(query);
                                },
                                child: SizedBox(
                                  height: 90,
                                  width: 140,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          'assets/images/person.jpg',
                                          fit: BoxFit.cover,
                                          height: 90,
                                          width: double.infinity),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    query = 'programming';
                                  });
                                  fetchCategoryWallpapers();

                                  print(query);
                                },
                                child: SizedBox(
                                  height: 95,
                                  width: 140,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          'assets/images/programming.jpg',
                                          fit: BoxFit.cover,
                                          height: 90,
                                          width: double.infinity),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    query = 'nature';
                                  });
                                  fetchCategoryWallpapers();
                                  print(query);
                                },
                                child: SizedBox(
                                  height: 95,
                                  width: 140,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/nature.jpg',
                                        fit: BoxFit.cover,
                                        height: 90,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    query = 'cars';
                                  });
                                  fetchCategoryWallpapers();
                                  print(query);
                                },
                                child: SizedBox(
                                  height: 95,
                                  width: 140,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          'assets/images/cars.jpg',
                                          fit: BoxFit.cover,
                                          height: 90,
                                          width: double.infinity),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    query = ' indian god';
                                  });
                                  fetchCategoryWallpapers();
                                  print(query);
                                },
                                child: SizedBox(
                                  height: 95,
                                  width: 140,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          'assets/images/god.jpg',
                                          fit: BoxFit.cover,
                                          height: 90,
                                          width: double.infinity),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$query wallpapers',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        )
                      ]),
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
                                          url: wallpaper!
                                              .photos![index].src!.portrait
                                              .toString(),
                                          photographer: wallpaper!
                                              .photos![index].photographer
                                              .toString())),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: wallpaper!.photos![index].src!.portrait
                                      .toString(),
                                  child: Card(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        imageUrl: wallpaper!
                                            .photos![index].src!.portrait
                                            .toString(),
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: GFLoader(
                                            type: GFLoaderType.ios,
                                          ),
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
      ),
    );
  }
}
