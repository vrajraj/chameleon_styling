import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'bride.dart';
import 'haircare.dart';
import 'skin care.dart';
import 'spa.dart';
import 'package:chameleonstyling/wallpaper.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white70,
                   //Appbar
      appBar: AppBar(
        elevation:20 ,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0),side: BorderSide(color: Colors.yellow[300],width:2.0) ),
        iconTheme: IconThemeData(color: Colors.black,size: 80),
       backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('C',
                style: TextStyle(color: Colors.black,fontSize: 40.0,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'
              ),),
              Text('hameleon',
                style: TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.w400,letterSpacing: 2,
              ),),
              Text('S',
                style: TextStyle(color: Colors.black,fontSize: 40.0,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'
              ),),
              Text('tyling',
                style: TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.w400,letterSpacing:2),),
            ],
          ),
         actions: <Widget>[
           IconButton(icon: Icon(Icons.search), color: Colors.black,iconSize: 40,onPressed: ()=>{})
         ],

        ),
        drawer:
        new Drawer(
          child:
          new ListView(
            children: <Widget>[
              new ListTile(
                title: Text("Gallery", style: new TextStyle(fontSize: 20,color: Colors.black ),),
                trailing: new Icon(Icons.photo,color: Colors.green,size: 20,),
                onTap: ()=> Navigator.pushReplacement(context,new  MaterialPageRoute(builder: (context) => WallScreen()),),
              ),
              Divider(
                color: Colors.white,
                height:50.0,
              ),
              new ListTile(
                title: Text("Blogs", style: new TextStyle(fontSize: 16,color: Colors.white ),),
                trailing: new Icon(Icons.assignment),
                onTap: ()=> Navigator.pushReplacement(context,new  MaterialPageRoute(builder: (context) => new bride())),
              ),
              Divider(color: Colors.white,
                height:50.0,),
            ],
          ),
        ),
                                      //GridView
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        childAspectRatio: 0.70,

        children: <Widget>[

        /*  Container(
            child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/facial.jpeg'),fit: BoxFit.cover,))
          ),
          Container(
              child: InkWell(onTap: ()=>{},child: Image(image: AssetImage('assets/menuPics/haircut.jpg'),fit: BoxFit.cover,))
          ),*/
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.yellow[300],width:5)),
            clipBehavior: Clip.hardEdge,
            child: Container(

                decoration: BoxDecoration(image:DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: AssetImage('assets/menuPics/haircut.jpg'),fit: BoxFit.cover,
                )),
                child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new haircare()))},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HAIR CARE',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600,fontFamily:'Cinzel'),textAlign: TextAlign.center,),
                        Padding(padding: EdgeInsets.all(20)),
                        Text('EXPLORE',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900,fontFamily:'Cinzel'),textAlign: TextAlign.center,),
                      ],
                    )
                )
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.yellow[300],width:5)),
            clipBehavior: Clip.hardEdge,
            child: Container(
                decoration: BoxDecoration(image:DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: AssetImage('assets/menuPics/facial.jpeg'),fit: BoxFit.cover,
                )),
                child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new skincare()))},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('SKIN CARE',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w700,fontFamily:'Cinzel'),textAlign: TextAlign.center,),
                        Padding(padding: EdgeInsets.all(20)),
                        Text('EXPLORE',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily:'Cinzel'),textAlign: TextAlign.center,),
                      ],
                    )
                )
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.yellow[300],width:5)),
            clipBehavior: Clip.hardEdge,
            child: Container(
                decoration: BoxDecoration(image:DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: AssetImage('assets/menuPics/spa.jpg'),fit: BoxFit.cover,
                )),
                child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new spa()))},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HANDS & FEET',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w500,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                        Text('AND SPA',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w500,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                        Padding(padding: EdgeInsets.all(40)),
                        Text('EXPLORE',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                      ],
                    )
                )
            ),
          ),

          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.yellow[300],width:5)),
            clipBehavior: Clip.hardEdge,
            child: Container(
                decoration: BoxDecoration(image:DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: AssetImage('assets/menuPics/bride.jpg'),fit: BoxFit.cover,
                )),
                child: InkWell(onTap: ()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => new bride()))},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('BRIDE-GROOM',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w500,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                        Text('AND',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w500,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                        Text('PARTY MAKEUP',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w500,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                        Padding(padding: EdgeInsets.all(20)),
                        Text('EXPLORE',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: 'Cinzel'),textAlign: TextAlign.center,),
                      ],
                    )
                )
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


      );

  }
}
