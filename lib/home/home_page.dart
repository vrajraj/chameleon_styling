import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'bride.dart';
import 'haircare.dart';
import 'skin care.dart';
import 'spa.dart';
import 'package:chameleonstyling/wallpaper.dart';
import './image slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './clipper_home.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return
      SafeArea(
        child: Scaffold(

        backgroundColor:Colors.white,
                     //Appbar
//        appBar: AppBar(
//
//          elevation:20 ,
//
//          shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
//              //side: BorderSide(color: Colors.yellow[300],width:2.0)
//          ),
//          iconTheme: IconThemeData(color: Colors.white,size: 80),
//         backgroundColor:Colors.pink,
//          title: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('C',
//                  style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'
//                ),),
//                Text('hameleon',
//                  style: TextStyle(color: Colors.white,fontSize: 26.0,fontWeight: FontWeight.w400,letterSpacing: 2,
//                ),),
//                Text('S',
//                  style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'
//                ),),
//                Text('tyling',
//                  style: TextStyle(color: Colors.white,fontSize: 26.0,fontWeight: FontWeight.w400,letterSpacing:2),),
//              ],
//            ),
//           actions: <Widget>[
//             IconButton(icon: Icon(Icons.photo), color: Colors.white,iconSize: 40,
//               onPressed: ()=> Navigator.push(context,new  MaterialPageRoute(builder: (context) => WallScreen()),),),
//
//             IconButton(icon: Icon(Icons.search), color: Colors.white,iconSize: 40,onPressed: ()=>{})
//           ],
//
//          ),
//          drawer: new Drawer(
//            child:
//            Container(
//              color: Colors.white30,
//              child: new ListView(
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.only(top: 15),
//                  ),
//                  new ListTile(
//                    title: Text("Gallery", style: new TextStyle(fontSize: 35,color: Colors.pink ,fontWeight: FontWeight.w400, ),),
//                    trailing: new Icon(Icons.photo,color: Colors.pink,size:35,),
//                    onTap: ()=> Navigator.push(context,new  MaterialPageRoute(builder: (context) => WallScreen()),),
//                  ),
//                ],
//              ),
//            ),
//          ),
                                        //GridView
        body: Column(
          children: <Widget>[
            Clipper_home(),
            Container(
                height: 250,
                child: Image_slider()),
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30))),
                //color: Colors.purple[400],
                child: Container(
                  height: 530,
                  decoration:
                  BoxDecoration(gradient: RadialGradient(tileMode: TileMode.repeated,colors:[Colors.blueGrey[900],Colors.blue[800]
                  ,  Colors.blueGrey[900]
                  ])),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    childAspectRatio:1.12,

                    children: <Widget>[

                      /*  Container(
                              child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/facial.jpeg'),fit: BoxFit.cover,))
                            ),
                            Container(
                                child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/haircut.jpg'),fit: BoxFit.cover,))
                            ),*/
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          //  side: BorderSide(color: Colors.yellow[300],width:5)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Scaffold(
                          body: Column(

                            children: <Widget>[
                              Container(
                                  height:165,
                                  width: 280,
                                  decoration: BoxDecoration(image:DecorationImage(
                                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                                    image: AssetImage('assets/menuPics/haircut.jpg'),fit: BoxFit.cover,
                                  )),
                                  child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new haircare()))},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                        ],
                                      )
                                  )
                              ),
                              Container(
                                width: 350,
                                height: 80,
                                child:   InkWell(
                                  onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new haircare()))},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Hair Care',style: TextStyle(color: Colors.blueGrey[900],fontSize:30,fontWeight: FontWeight.w600,fontFamily:'Raleway'),textAlign: TextAlign.center,),
                                      // Padding(padding: EdgeInsets.all(20)),
                                      //  Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900,fontFamily:'Cinzel'),textAlign: TextAlign.center,),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          //  side: BorderSide(color: Colors.yellow[300],width:5)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Scaffold(
                          body: Column(

                            children: <Widget>[
                              Container(
                                  height:165,
                                  width: 280,
                                  decoration: BoxDecoration(image:DecorationImage(
                                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                                    image: AssetImage('assets/menuPics/facial.jpeg'),fit: BoxFit.cover,
                                  )),
                                  child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new  skincare()))},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                        ],
                                      )
                                  )
                              ),
                              Container(
                                width: 350,
                                height: 80,
                                child:   InkWell(
                                  onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new  skincare()))},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Skin Care',style: TextStyle(color: Colors.blueGrey[900],fontSize:30,fontWeight: FontWeight.w600,fontFamily:'Raleway'),textAlign: TextAlign.center,),
                                      // Padding(padding: EdgeInsets.all(20)),
                                      //  Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900,fontFamily:'Cinzel'),textAlign: TextAlign.center,),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          //  side: BorderSide(color: Colors.yellow[300],width:5)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Scaffold(
                          body: Column(

                            children: <Widget>[
                              Container(
                                  height:165,
                                  width: 280,
                                  decoration: BoxDecoration(image:DecorationImage(
                                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                                    image: AssetImage('assets/menuPics/spa.jpg'),fit: BoxFit.cover,
                                  )),
                                  child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new  Spa()))},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                        ],
                                      )
                                  )
                              ),
                              Container(
                                width: 350,
                                height: 80,
                                child:   InkWell(
                                  onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new Spa()))},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Hands & Feet And Spa',style: TextStyle(color: Colors.blueGrey[900],fontSize:28,fontWeight: FontWeight.w600,fontFamily: 'Raleway'),textAlign: TextAlign.center,),
                                      // Text('AND SPA',style: TextStyle(color: Colors.black,fontSize:10,fontWeight: FontWeight.w600,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                                      //     Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          //  side: BorderSide(color: Colors.yellow[300],width:5)
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Scaffold(
                          body: Column(

                            children: <Widget>[
                              Container(
                                  height:165,
                                  width: 280,
                                  decoration: BoxDecoration(image:DecorationImage(
                                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                                    image: AssetImage('assets/menuPics/bride.jpg'),fit: BoxFit.cover,
                                  )),
                                  child: InkWell(
                                      onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new bride()))},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                        ],
                                      )
                                  )
                              ),
                              Container(
                                width: 350,
                                height:80,
                                child:   InkWell(
                                  onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new bride()))},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Bride-Groom And Party Makeup',style: TextStyle(color: Colors.black,fontSize:28,fontWeight: FontWeight.w600,fontFamily: 'Raleway'),textAlign: TextAlign.center,),
                                      //    Text('AND',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w500,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                                      //  Text('PARTY MAKEUP',style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w600,fontFamily: 'Cinzel'),textAlign: TextAlign.center,)
                                      // Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize:18.9,fontWeight: FontWeight.w900,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),


                      /*Container(
                                child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/bride.jpg'),fit: BoxFit.cover,))
                            ),
                            Container(
                                child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/spa.jpg'),fit: BoxFit.cover,))
                            ),*/

                    ],
                  ),
                ),
              ),
          ],
        ),


        ),
      );

  }
}
