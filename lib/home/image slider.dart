import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Image_slider extends StatefulWidget {
  @override
  _Image_sliderState createState() => _Image_sliderState();
}

class _Image_sliderState extends State<Image_slider> {
  int _currentPage=0;
  PageController _pageController = PageController(
    initialPage: 0,viewportFraction: 0.9
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,

      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('offers').snapshots(),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Card(
                            elevation: 20,

                            clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('${mypost['Image']}'),fit: BoxFit.fill)),
                              )),
                        );
                    }
                );
            }
          }
      );
  }
}
