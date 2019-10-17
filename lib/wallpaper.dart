import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const String testDevice = '';

class WallScreen extends StatefulWidget {

  @override
  _WallScreenState createState() => new _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {


  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpapersList;
  final CollectionReference collectionReference = Firestore.instance.collection("wallpapers") ;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = collectionReference.orderBy('url', descending: true).snapshots().listen((datasnapshot) {
      setState(() {
        wallpapersList = datasnapshot.documents;
      });
    });

    // _currentScreen();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.pink,
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Colors.pink),
          bottomOpacity: 20,

          shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15), ), ),
          backgroundColor: Colors.white70,
          title: Center(child: new Text("Gallery Lounge",style: TextStyle(color: Colors.pink,fontSize: 40,fontFamily: 'Cinzel',fontWeight: FontWeight.w600),)),
        ),
        body: wallpapersList != null
            ? new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: wallpapersList.length,
          itemBuilder: (context, i) {
            String imgPath = wallpapersList[i].data['url'];
            return new Material(
              elevation: 8.0,
              borderRadius:
              new BorderRadius.all(new Radius.circular(8.0)),
              child: new InkWell(
                onTap: () {


//                  Navigator.push(
//                      context,
//                      new MaterialPageRoute(
//                          builder: (context) =>
//                          //new FullScreenImagePage(imgPath))
//                      ) );
                },
                child: new Hero(
                  tag: imgPath,
                  child: new FadeInImage(
                    image: new NetworkImage(imgPath),
                    fit: BoxFit.cover,
                    placeholder: new AssetImage("assets/logo/Logo Chameleon.png"),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (i) =>
          new StaggeredTile.count(2, i.isEven ? 2 : 3),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        )
            : new Center(
          child: new CircularProgressIndicator(),
        ));
  }
}