import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import './icon.dart';
import 'clipper.dart';
import 'clipper2.dart';
import 'makeup.dart';
class haircare extends StatefulWidget {
  @override
  _haircareState createState() => _haircareState();
}

class _haircareState extends State<haircare> {
  int currentpage=0;
  PageController _pageController = PageController(
      initialPage: 0,viewportFraction: 0.8
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 65), (Timer timer) {
      if (currentpage < 2) {
        currentpage++;
      } else {
        currentpage = 0;
      }

      _pageController.animateToPage(
        currentpage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,

      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
//      appBar: AppBar(
//          centerTitle:true,
//
//          actionsIconTheme: IconThemeData(color: Colors.white),
//          //elevation: 20,
//          //bottomOpacity: 20,
//          //  shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomRight:Radius.circular(20)),
//
//          backgroundColor: Colors.black,
//          title: Text('Skin Care',style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w400,fontFamily: 'Nunito'),),
//          iconTheme: IconThemeData(color: Colors.white,size: 40,opacity: 20)
//      ),
        body:
        SingleChildScrollView(
          child: Container(
            // color: Colors.pink[400].withOpacity(0.5),

            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      //Padding(padding: EdgeInsets.only(top:15),),
                      Clipper(),
                      // Padding(padding: EdgeInsets.only(top:10),),
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left:15),),
                          Text('Hands & Feet And Spa',style:
                          TextStyle(color: Colors.black,fontSize:35,fontWeight: FontWeight.w600,fontFamily: 'Raleway'),//textAlign: TextAlign.center,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left:98.0,right: 20),
                              child: Container(height:100,width:100,child: Image(image: AssetImage('assets/logo2.png',),color: Colors.pink[900],))
                            //FlutterLogo(size: 40,),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top:20),),

                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(image:
                  DecorationImage(image:
                  AssetImage('assets/background.png'),
                      fit: BoxFit.cover,

                      colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5) ,BlendMode.darken,)
                  )),
                  height:550,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection('Skincare').snapshots(),
                      // ignore: missing_return
                      builder: (context,snapshot) {
                        print("Data : ${snapshot.data}");


                        if (!snapshot.hasData) {
                          const Text('loading');
                          return Container();
                        }
                        else{
                          return
                            PageView.builder(

                                controller: _pageController,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot mypost = snapshot.data.documents[index];
                                  return
                                    SingleChildScrollView(
                                      child: Card(

                                        //color: Colors.transparent,
                                        elevation: 10,
                                        clipBehavior:Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32),),
                                        // margin: EdgeInsets.only(right: 40,left: 40,bottom: 20,top:20),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              // color: Colors.transparent,
                                                width: MediaQuery.of(context).size.width,
                                                child:

                                                Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:10.0),
                                                      child: Text('${mypost['Title']}', style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: 30,
                                                          fontFamily: 'Courgette'),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:20.0,left: 20,right: 20),
                                                      child: Text('"${mypost['Description']}"', style: TextStyle(
                                                        color: Colors.blueGrey[400],
                                                        fontSize:22,
                                                        fontFamily: 'Courgette',
                                                        fontWeight: FontWeight.w800,
                                                      ),softWrap: true,overflow: TextOverflow.fade,),
                                                    ),
                                                    //  Padding(padding: EdgeInsets.only(top: 20),) ,
                                                    // Expanded(flex: 2,child: Clipper2()),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Padding(
                                                            padding: EdgeInsets.only(left: 5)),
                                                        Text('Varies | ', style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:25,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Nunito'),),
//                                      Text('${mypost['Varies']}', style: TextStyle(
//                                          color: Colors.pink,
//                                          fontSize: 25,
//                                          fontWeight: FontWeight.w600,
//                                          fontFamily: 'Nunito'),),
                                                        ScaleAnimatedTextKit(
                                                            duration: Duration(milliseconds: 5000),
                                                            onTap: () {
                                                              print("Tap Event");
                                                            },
                                                            text: [
                                                              '${mypost['Varies']}'
                                                            ],
                                                            textStyle: TextStyle(
                                                                color: Colors.pink,
                                                                fontSize: 25,
                                                                fontWeight: FontWeight.w600,
                                                                fontFamily: 'Nunito'
                                                            ),
                                                            textAlign: TextAlign.start,
                                                            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                                                        ),
                                                        Padding(padding: EdgeInsets.only(left: 90)),
                                                        Text('Price | ', style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Nunito'),),
//                                      Text('${mypost['Cost']}', style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 25,
//                                          fontWeight: FontWeight.w600,
//                                          fontFamily: 'Nunito'),),
                                                        SizedBox(width: 20.0, height: 100.0),
                                                        ScaleAnimatedTextKit(
                                                          duration: Duration(milliseconds: 5000),
                                                          onTap: () {
                                                            print("Tap Event");
                                                          },
                                                          text: ['${mypost['Cost']}'],
                                                          textStyle: TextStyle(color: Colors.purple[400],fontSize: 25.0, fontFamily: "Nunito",fontWeight: FontWeight.w600),
                                                          textAlign: TextAlign.start,
                                                          alignment: AlignmentDirectional.topStart,
                                                          // or Alignment.topLeft
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                            ),
                                            mypost['CheckList']?ExpansionTile(
                                              trailing: icons(),

                                              title:FadeAnimatedTextKit(
                                                  isRepeatingAnimation: false,
                                                  text: [
                                                    "Types",
                                                    "Types of",
                                                    "Types of Services"
                                                  ],
                                                  textStyle: TextStyle(color: Colors.purple[400],fontSize:25,fontWeight: FontWeight.w600,fontFamily: 'Raleway'),
                                                  textAlign: TextAlign.start,
                                                  alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                                              ),
                                              children: <Widget>[
                                                Container(
                                                    height: 400,
                                                    width: MediaQuery.of(context).size.width,
                                                    child: Makeup())
//                                      Container(
//                                        child: Column(
//                                          mainAxisAlignment: MainAxisAlignment.start,
//                                          children: <Widget>[
//                                            Row(
//                                              children: <Widget>[
//                                                Text('hello')
//                                              ],
//
//
//                                            ),
//                                          ],
//                                        ),
//                                      )
                                              ],
                                            ):Container(),
                                            Clipper2()
                                          ],
                                        ),
                                      ),
                                    );
                                }
                            );
                        }
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}