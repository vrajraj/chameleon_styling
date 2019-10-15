import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class spa extends StatefulWidget {
  @override
  _spaState createState() => _spaState();
}

class _spaState extends State<spa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.yellow[300]),
          elevation: 20,
          bottomOpacity: 20,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0),side: BorderSide(color: Colors.yellow[300],width:2.0) ),

          backgroundColor: Colors.brown[500],
          title: Text('Skin Care',style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w400,fontFamily: 'Cinzel'),),
          iconTheme: IconThemeData(color: Colors.black,size: 40,opacity: 20)
      ),
      body:
      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Spa').snapshots(),
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
                      color: Colors.brown[500],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: Colors.yellow[300], width: 5)),
                      margin: EdgeInsets.only(
                          bottom: 150, left: 10, right: 10, top: 10),
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
                              Text('${mypost['Title']}', style: TextStyle(
                                  color: Colors.yellow[300],
                                  fontSize: 50,
                                  fontFamily: 'Cinzel'),),
                              Padding(padding: EdgeInsets.only(top: 25,)),
                              Divider(color: Colors.yellow[300],
                                thickness: 1.5,
                                height: 10,
                                indent: 25,
                                endIndent: 25,),
                              Padding(padding: EdgeInsets.all(20)),
                              // Text('Description: "',style: TextStyle(color: Colors.white,fontSize:30,fontFamily:'Lobster'),),
                              Text('${mypost['Description']}',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize:25,
                                    fontFamily: 'Lobster',
                                    letterSpacing: 2),),
                              Padding(padding: EdgeInsets.all(15)),
                              Row(children: <Widget>[Padding(
                                  padding: EdgeInsets.only(left: 5)),
                                Text('Varies | ', style: TextStyle(
                                    color: Colors.yellow[300],
                                    fontSize: 30,
                                    fontFamily: 'Cinzel'),),
                                Text('${mypost['Varies']}', style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'Cinzel'),),
                                Padding(padding: EdgeInsets.only(left: 120)),
                                Text('Price | ', style: TextStyle(
                                    color: Colors.yellow[300],
                                    fontSize: 30,
                                    fontFamily: 'Cinzel'),),
                                Text('${mypost['Cost']}', style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'Cinzel'),),
                              ],),
                              Padding(padding: EdgeInsets.all(10)),
                            ],
                          )),
                    );
                  }
              );
            }
          }
      ),
    );
  }
}
