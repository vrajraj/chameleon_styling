import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './makeup.dart';
class bride extends StatefulWidget {
  @override
  _brideState createState() => _brideState();
}

class _brideState extends State<bride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15) ) ),
          backgroundColor: Colors.pink[900],
          title: Text('Bride-Groom And Party MakeUp',style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w400,
             fontFamily: 'Nunito'
          ),),
          iconTheme: IconThemeData(color: Colors.white,size:90)
      ),
      body:


          StreamBuilder<QuerySnapshot>(

              stream: Firestore.instance.collection("Bride")
              .orderBy('Title', descending: true)
//                  .orderBy('Perfect Groom', descending: true)
//                  .orderBy('Pretty Bride', descending: true)
                  .snapshots(),
              // ignore: missing_return
              builder: (context,snapshot) {
                print("Data : ${snapshot.data}");


                if (!snapshot.hasData) {
                  const Text('loading');
                  return Container();
                }
                else{
                  return  ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot mypost = snapshot.data.documents[index];
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10) ),
                            // side: BorderSide(color: Colors.yellow[300], width: 2)
                          ),
                          margin: EdgeInsets.only(
                               left: 20, right: 20, top: 20),
                          elevation: 20,
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              // height: 600,
                              width: 600,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.all(20)),
                                  Card(
                                    color: Colors.pink[900],
                                    clipBehavior: Clip.hardEdge,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all( Radius.circular(40)),
                                      // side: BorderSide(color: Colors.yellow[300], width: 2)
                                    ),

                                    child: Container(

                                      height: 80,
                                      width: 450,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('${mypost['Title']}', style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32,
                                              fontFamily: 'Raleway'
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 25,)),
                                  Divider(color: Colors.grey[900],
                                    thickness: 1.5,
                                    height: 10,
                                    indent: 25,
                                    endIndent: 25,),
                                  Padding(padding: EdgeInsets.all(20)),
                                  // Text('Description: "',style: TextStyle(color: Colors.white,fontSize:30,fontFamily:'Lobster'),),
                                  Text('${mypost['Description']}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.grey[900],
                                        fontWeight: FontWeight.w600,
                                        fontSize:24,
                                      //  fontStyle: FontStyle.italic,
                                        fontFamily: 'Raleway',
                                        letterSpacing: 2
                                    ),),
                                  Padding(padding: EdgeInsets.all(15)),
                                  Row(children: <Widget>[
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text('Varies | ', style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize:30,
                                        fontWeight: FontWeight.w600
                                       // fontFamily: 'Cinzel'
                                    ),),
                                    Text('${mypost['Varies']}', style: TextStyle(
                                        color: Colors.pink[900],
                                        fontSize:30,
                                        fontWeight: FontWeight.w600
                                    //    fontFamily: 'Cinzel'
                                    ),),
                                  //  Padding(padding: EdgeInsets.only(left: 60)),

                                  ],),
                                  Padding(padding: EdgeInsets.all(10)),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                     // Padding(padding: EdgeInsets.only(left: 5)),
                                      Text('Price | ', style: TextStyle(
                                            color: Colors.grey[900],
                                            fontSize:30,
                                          fontWeight: FontWeight.w600
                                      //      fontFamily: 'Cinzel'
                                      ),),
                                      Expanded(
                                        flex: 2,
                                        child: Text('${mypost['Cost']}', style: TextStyle(
                                            color: Colors.pink[900],
                                            fontSize:30,
                                        fontWeight: FontWeight.w600
                                        //    fontFamily: 'Cinzel'
                                        ),),
                                      ),
                                     // mypost['CheckList']?IconButton(icon: Icon(Icons.arrow_drop_down_circle,color: Colors.pink[900],size:50), onPressed:()=> Navigator.push(context,new  MaterialPageRoute(builder: (context) => Makeup()))):Container()

                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(10)),
                                  mypost['CheckList']?ExpansionTile(
                                    title: Text('Types of services'),
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
                                  Padding(padding: EdgeInsets.all(10)),
                                ],

                              ),

                          ),
                        );
                      }
                  );
                }
              }
          ),
//          StreamBuilder<QuerySnapshot>(
//              stream: Firestore.instance.collection('Bride Trial').snapshots(),
//              // ignore: missing_return
//              builder: (context,snapshot) {
//                print("Data : ${snapshot.data}");
//
//
//                if (!snapshot.hasData) {
//                  const Text('loading');
//                  return Container();
//                }
//                else{
//                  return  ListView.builder(
//                      itemCount: snapshot.data.documents.length,
//                      itemBuilder: (context, index) {
//                        DocumentSnapshot mypost = snapshot.data.documents[index];
//                        return Card(
//                          color: Colors.brown[500],
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(15.0),
//                              side: BorderSide(
//                                  color: Colors.yellow[300], width: 5)),
//                          margin: EdgeInsets.only(
//                              bottom: 150, left: 10, right: 10, top: 10),
//                          elevation: 20,
//                          clipBehavior: Clip.hardEdge,
//                          child: Container(
//
//
//                              padding: EdgeInsets.only(left: 15, right: 10),
//                              // height: 600,
//                              width: 600,
//
//
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//
//                                // mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Padding(padding: EdgeInsets.all(20)),
//                                  Text('${mypost['Title']}', style: TextStyle(
//                                      color: Colors.yellow[300],
//                                      fontSize: 50,
//                                      fontFamily: 'Cinzel'),),
//                                  Padding(padding: EdgeInsets.only(top: 25,)),
//                                  Divider(color: Colors.yellow[300],
//                                    thickness: 1.5,
//                                    height: 10,
//                                    indent: 25,
//                                    endIndent: 25,),
//                                  Padding(padding: EdgeInsets.all(20)),
//                                  // Text('Description: "',style: TextStyle(color: Colors.white,fontSize:30,fontFamily:'Lobster'),),
//                                  Text('${mypost['Description']}',
//                                    textAlign: TextAlign.left,
//                                    style: TextStyle(color: Colors.white,
//                                        fontWeight: FontWeight.w100,
//                                        fontSize:25,
//                                        fontFamily: 'Lobster',
//                                        letterSpacing: 2),),
//                                  Padding(padding: EdgeInsets.all(15)),
//                                  Row(children: <Widget>[Padding(
//                                      padding: EdgeInsets.only(left: 5)),
//                                    Text('Varies | ', style: TextStyle(
//                                        color: Colors.yellow[300],
//                                        fontSize: 30,
//                                        fontFamily: 'Cinzel'),),
//                                    Text('${mypost['Varies']}', style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 30,
//                                        fontFamily: 'Cinzel'),),
//                                    Padding(padding: EdgeInsets.only(left: 130)),
//                                  FlatButton(onPressed: ()=>  Navigator.pushReplacement(context,new  MaterialPageRoute(builder: (context) => Makeup()),),
//                                      child: Text('Price List =>', style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 30,
//                                          fontFamily: 'Cinzel'),),
//                                  )
//                                  ],),
//                                  Padding(padding: EdgeInsets.all(10)),
//                                ],
//                              )),
//                        );
//                      }
//                  );
//                }
//              }
//          ),
    );
  }
}
