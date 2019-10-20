import 'package:flutter/gestures.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'bride.dart';
import 'haircare.dart';
import 'skin care.dart';
import 'spa.dart';
import 'package:chameleonstyling/wallpaper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget imageSlider = new Container(
      height: 250.0,
      child:
      new Carousel(

        boxFit: BoxFit.fill,
        images: [
          NetworkImage('https://static.wixstatic.com/media/ecbf25_2cd84d2a33a345b0a74ea28bb63fe461~mv2_d_4786_3191_s_4_2.jpg/v1/fill/w_505,h_313,al_c,q_80,usm_0.66_1.00_0.01/ecbf25_2cd84d2a33a345b0a74ea28bb63fe461~mv2_d_4786_3191_s_4_2.jpg'),
          AssetImage('assets/menuPics/gold.jpg'),
          NetworkImage('https://static.wixstatic.com/media/ecbf25_da9541f2d3e6400cb779abc9d57c2959~mv2.jpg/v1/fill/w_398,h_393,al_c,q_80,usm_0.66_1.00_0.01/Offer%20logo.webp'),
          AssetImage('assets/menuPics/offer.jpg'),
          NetworkImage('https://static.wixstatic.com/media/ecbf25_76b4944c618147b39767f79f46fc2aa7~mv2.jpg/v1/fill/w_505,h_313,al_c,q_80,usm_0.66_1.00_0.01/ecbf25_76b4944c618147b39767f79f46fc2aa7~mv2.jpg'),

        ],
        autoplay: true,
        showIndicator: false,
        autoplayDuration: Duration(seconds:8),

      ),
    );
    return Scaffold(
      backgroundColor:Colors.pink[900],
                   //Appbar
      appBar: AppBar(
        elevation:20 ,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
            //side: BorderSide(color: Colors.yellow[300],width:2.0)
        ),
        iconTheme: IconThemeData(color: Colors.white,size: 80),
       backgroundColor: Colors.pink[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('C',
                style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'
              ),),
              Text('hameleon',
                style: TextStyle(color: Colors.white,fontSize: 26.0,fontWeight: FontWeight.w400,letterSpacing: 2,
              ),),
              Text('S',
                style: TextStyle(color: Colors.white,fontSize: 40.0,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'
              ),),
              Text('tyling',
                style: TextStyle(color: Colors.white,fontSize: 26.0,fontWeight: FontWeight.w400,letterSpacing:2),),
            ],
          ),
         actions: <Widget>[
           IconButton(icon: Icon(Icons.photo), color: Colors.white,iconSize: 40,
             onPressed: ()=> Navigator.push(context,new  MaterialPageRoute(builder: (context) => WallScreen()),),),

           IconButton(icon: Icon(Icons.search), color: Colors.white,iconSize: 40,onPressed: ()=>{})
         ],

        ),
        drawer:
        new Drawer(
          child:
          Container(
            color: Colors.white30,
            child: new ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                new ListTile(
                  title: Text("Gallery", style: new TextStyle(fontSize: 35,color: Colors.pink ,fontWeight: FontWeight.w400, ),),
                  trailing: new Icon(Icons.photo,color: Colors.pink,size:35,),
                  onTap: ()=> Navigator.push(context,new  MaterialPageRoute(builder: (context) => WallScreen()),),
                ),
              ],
            ),
          ),
        ),
                                      //GridView
      body: ListView(
        children: <Widget>[
          imageSlider,
          Container(
            height: 580,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio:0.90,

              children: <Widget>[

              /*  Container(
                  child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/facial.jpeg'),fit: BoxFit.cover,))
                ),
                Container(
                    child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/haircut.jpg'),fit: BoxFit.cover,))
                ),*/
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    //  side: BorderSide(color: Colors.yellow[300],width:5)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Scaffold(
                    body: Column(

                      children: <Widget>[
                        Container(
                            height:230,
                            width: 300,
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
                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('HAIR CARE',style: TextStyle(color: Colors.grey[900],fontSize:28,fontWeight: FontWeight.w600,fontFamily:'Cinzel'),textAlign: TextAlign.center,),
                         // Padding(padding: EdgeInsets.all(20)),
                        //  Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900,fontFamily:'Cinzel'),textAlign: TextAlign.center,),

                          ],
                          ),
                                              )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    //  side: BorderSide(color: Colors.yellow[300],width:5)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Scaffold(
                    body: Column(

                      children: <Widget>[
                        Container(
                            height:230,
                            width: 300,
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
                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('SKIN CARE',style: TextStyle(color: Colors.black,fontSize:28,fontWeight: FontWeight.w600,fontFamily:'Cinzel'),textAlign: TextAlign.center,),
                              // Padding(padding: EdgeInsets.all(20)),
                            //  Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900,fontFamily:'Cinzel'),textAlign: TextAlign.center,),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    //  side: BorderSide(color: Colors.yellow[300],width:5)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Scaffold(
                    body: Column(

                      children: <Widget>[
                        Container(
                            height:230,
                            width: 300,
                            decoration: BoxDecoration(image:DecorationImage(
                              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                              image: AssetImage('assets/menuPics/spa.jpg'),fit: BoxFit.cover,
                            )),
                            child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new  spa()))},
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
                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('HANDS & FEET AND SPA',style: TextStyle(color: Colors.black,fontSize:25,fontWeight: FontWeight.w600,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                             // Text('AND SPA',style: TextStyle(color: Colors.black,fontSize:10,fontWeight: FontWeight.w600,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                         //     Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    //  side: BorderSide(color: Colors.yellow[300],width:5)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Scaffold(
                    body: Column(

                      children: <Widget>[
                        Container(
                            height:230,
                            width: 300,
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
                          height: 80,
                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('BRIDE-GROOM AND PARTY MAKEUP',style: TextStyle(color: Colors.black,fontSize:25,fontWeight: FontWeight.w600,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                          //    Text('AND',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w500,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                            //  Text('PARTY MAKEUP',style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w600,fontFamily: 'Cinzel'),textAlign: TextAlign.center,)
                             // Text('EXPLORE',style: TextStyle(color: Colors.black,fontSize:18.9,fontWeight: FontWeight.w900,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),

                            ],
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
        ],
      ),


      );

  }
}
