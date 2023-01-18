import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:wallpaper/wallpaper.dart';

class ImagePreview extends StatefulWidget {
  final String url, photographer;
  const ImagePreview(
      {super.key, required this.photographer, required this.url});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Hero(
          tag: widget.url,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: widget.url,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                                      child: GFLoader(
                                        type: GFLoaderType.ios,
                                      ),
                                    ),
            ),
          ),
        ),
        Positioned(
          top: 800,
          left: 100,
          right: 100,
          bottom: 3,
          child: GestureDetector(
            onTap: () {
              print('set');
              Wallpaper.homeScreen().then((value) => print("wallpaper has been set!"));
            },
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(199, 210, 77, 175),
                        Color.fromARGB(197, 203, 50, 8),
                      ]),
                ),
                child: const Center(
                    child: Text(
                  "set wallpaper",
                  style: TextStyle(color: Colors.white),
                ))),
          ),
        )
      ],
    ));
  }
}
