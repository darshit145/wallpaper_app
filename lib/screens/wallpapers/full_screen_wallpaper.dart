import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class FullScreenWallpaper extends StatefulWidget {
  final url;
  FullScreenWallpaper({super.key, required this.url});

  @override
  State<FullScreenWallpaper> createState() =>
      _FullScreenWallpaperState(url: url);
}

class _FullScreenWallpaperState extends State<FullScreenWallpaper> {
  final url;
  bool loager = false;
  _FullScreenWallpaperState({required this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            loager = true;
          });
          int location = WallpaperManager.BOTH_SCREEN;
          var file = await DefaultCacheManager().getSingleFile(url);
          String result =
              (await WallpaperManager.setWallpaperFromFile(file.path, location))
                  as String;

        },
        child: Icon(
          Icons.download_rounded,
          size: 35,
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                url,
                fit: BoxFit.fitHeight,
              )),
          if (loager)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
