import 'dart:js';

import'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}
Widget makeimagegrid(){
  return StaggeredGridView.countBuilder(crossAxisCount: 4, itemBuilder:( context,i){
    return
        
  },
      staggeredTileBuilder: (i) =>
      new StaggeredTile.count(2, i.isEven ? 2 : 3),
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
  );
}
class _WallpaperState extends State<Wallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
