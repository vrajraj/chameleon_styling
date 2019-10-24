import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Makeup extends StatefulWidget {
  @override
  _MakeupState createState() => _MakeupState();
}

class _MakeupState extends State<Makeup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Bride party makeup').snapshots(),
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                         // side: BorderSide(color: Colors.yellow[30, width: 5)
                      ),
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10),
                      elevation: 10,
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          height: 120,
                          width:MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text('${mypost['Title']}',textAlign: TextAlign.start, style: TextStyle(
                            color: Colors.black,
                            fontSize:20,
                           fontFamily: 'Raleway',
                           fontWeight: FontWeight.w600

                           // fontFamily: 'Cinzel'
                        ),),
                        Padding(padding: EdgeInsets.all(8),
                        child:Divider(color: Colors.purple[500],
                          thickness: 1.5,
                          height: 10,
                          indent: 25,
                          endIndent: 25,),
                        ),
                        Row(children: <Widget>[
                                  Padding(padding: EdgeInsets.only(left:5)),
                                  Text('Price |', style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:20,
                                      fontFamily: 'Raleway'
                                  ),),
                          Padding(padding: EdgeInsets.all(5)),
                                  Text('${mypost['Cost']}', style: TextStyle(
                                      color: Colors.pink[400],
                                      fontWeight: FontWeight.w600,
                                      fontSize:20,
                                      fontFamily: 'Cinzel'),),
                                ],
                              ),
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
