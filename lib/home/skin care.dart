import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class skincare extends StatefulWidget {
  @override
  _skincareState createState() => _skincareState();
}

class _skincareState extends State<skincare> {
 
  
  @override
  Widget build(BuildContext context) {
       return Scaffold(
         backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle:true,

        actionsIconTheme: IconThemeData(color: Colors.white),
           //elevation: 20,
          //bottomOpacity: 20,
        //  shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomRight:Radius.circular(20)),

          backgroundColor: Colors.black,
        title: Text('Skin Care',style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w400,fontFamily: 'Nunito'),),
        iconTheme: IconThemeData(color: Colors.white,size: 40,opacity: 20)
      ),
      body:
      StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Skincare').snapshots(),
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
                        color: Colors.black,
                        clipBehavior:Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),),
                        margin: EdgeInsets.only(right: 20,left: 20,bottom: 20,top:20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height:800,
                          decoration: BoxDecoration(image:
                          DecorationImage(image: NetworkImage('${mypost['Image']}'),
                          fit: BoxFit.cover,
                           // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6) ,BlendMode.darken,)
                          )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Card(
                                clipBehavior: Clip.hardEdge,
                                elevation: 10,
                             //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.elliptical(150,150), topLeft:  Radius.elliptical(800,90), bottomRight:  Radius.circular(40),bottomLeft:  Radius.elliptical(100,20))),
                                color: Colors.black.withOpacity(0.6),
                                child: Container(
                                  width: 600,
                              //    height: 500,
                                  child: Column(
                                    mainAxisAlignment:MainAxisAlignment.start ,
                                    children: <Widget>[
                                      Card(
                                        margin: EdgeInsets.only(
                                             right: 250, top: 10),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),topRight: Radius.circular(50))),
                                        color: Colors.white.withOpacity(0.8),
                                        child: Container(
                                            width:300,
                                            height:75,
                                            child: Column(
                                              children: <Widget>[
                                                Expanded(child: Container(child: Center(child:
                                                Text('${mypost['Title']}',
                                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontFamily: 'Raleway',fontSize: 45,),textAlign: TextAlign.center,)))),
                                              ],
                                            )),
                                      ),
                                     Padding(padding: EdgeInsets.all(20)),
                                      Text('" ${mypost['Description']} "',softWrap: true,
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontFamily: 'Courgette',fontSize:26,),textAlign: TextAlign.center,),
                                      Padding(padding: EdgeInsets.all(20)),
                                      Card(
                                        color: Colors.white.withOpacity(0.9),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                         // height: 100,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(padding: EdgeInsets.all(15)),
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(left: 5)),
                                                  Text('Varies | ', style: TextStyle(
                                                      color: Colors.blueGrey[900],
                                                      fontSize: 30,
                                                      fontFamily: 'Cinzel'),),
                                                  Text('${mypost['Varies']}', style: TextStyle(
                                                      color: Colors.blueGrey[900],
                                                      fontSize: 30,
                                                      fontFamily: 'Cinzel'),),
                                                  Padding(padding: EdgeInsets.only(left: 90)),
                                                  Expanded(
                                                   // flex: 1,
                                                    child: Text('Price | ', style: TextStyle(
                                                        color: Colors.blueGrey[900],
                                                        fontSize: 30,
                                                        fontFamily: 'Cinzel'),),
                                                  ),
                                                  Expanded(
                                                  //  flex: 1,
                                                    child: Text('${mypost['Cost']}', style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 30,
                                                        fontFamily: 'Cinzel'),),
                                                  ),
                                                ],
                                              ),
                                              Padding(padding: EdgeInsets.all(10)),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(20)),





                                    ],
                                  )
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20))
                            ],
                          ),
                        ),
                      );
                    }
                );
                }
              }
              ),
             );
           }
}