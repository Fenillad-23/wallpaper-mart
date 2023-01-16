import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaper_mart/reusable_widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map<String, dynamic> wallpapers;
  bool dataLoaded = false;
  bool imgloaded = false;
  // ignore: non_constant_identifier_names
  int ImagesToLoad = 200;
  // late String wallpaperUrl, photographerName, photographerUrl;

  @override
  void initState() {
    super.initState();
    fetchWallpapers();
  }

  fetchWallpapers() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?per_page=$ImagesToLoad&page=1"),
        headers: {"Authorization": API_KEY}).then((value) {
      wallpapers = jsonDecode(value.body);
      dataLoaded = true;
      setState(() {});
    });
    print('\x1b[93m --- $wallpapers');
  }

  TextEditingController searchbarController = new TextEditingController();

  String API_KEY = "563492ad6f917000010000014df6eddfa02143fd9ceb352dc4e9ffa2";
  // static final customCacheManager = CacheManager(confi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
            child:
                text("wallymart", 24, Colors.deepOrange, FontWeight.w700, 1)),
      ),
      backgroundColor: Colors.white,
      body: dataLoaded
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textField(Icons.search, "Search", searchbarController),
                ),
                Flexible(
                  child: GridView.builder(
                    // itemCount: wallpapers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: ((context, index) {
                      return Card(
                        child: Image.network(
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              imgloaded = true;
                              return child;
                            } else {
                              imgloaded = false;
                              return const Center(child: Text('Loading...'));
                            }
                          },
                          wallpapers['photos'][index]['src']['original']
                              .toString(),
                          fit: BoxFit.fill,
                        ),
                        // child: CachedNetworkImage(
                        //   imageUrl: wallpapers['photos'][index]['src']
                        //           ['original']
                        //       .toString(),
                        //   key: UniqueKey(),
                        // ),
                      );
                    }),
                  ),
                )
              ],
            )
          : const Center(
              child: GFLoader(
                type: GFLoaderType.ios,
              ),
            ),
    );
  }
}
