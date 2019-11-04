import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chameleonstyling/wallpaper.dart';

class Clipper_home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
          //width: MediaQuery.of(context).size.width,
          height:100,
          child: Card(
            color: Colors.white,
           clipBehavior: Clip.hardEdge,
            //margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child:
            //Image.asset('assets/menuPics/spa.jpg',fit: BoxFit.cover,)
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[Colors.blue[800],Colors.blueGrey[900]
                    //Colors.pink[400],Colors.pinkAccent,Colors.deepOrange[500]
                  ])),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 10,top: 5)),
                      Expanded(flex: 5,
                        child: SizedBox(
                          width:350,height:35 ,
                          child: TyperAnimatedTextKit(
                              isRepeatingAnimation: false,
                              onTap: () {
                                print("Tap Event");
                              },
                              text: [
                                'Chameleon Styling' ,
                                'Chameleon Styling',
                              ],
                              textStyle: TextStyle(
                                  fontSize: 30,color: Colors.white,fontFamily: 'Raleway',fontWeight: FontWeight.w900
                              ),
                              textAlign: TextAlign.start,
                              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: IconButton(icon: Icon(Icons.collections,size: 30,color: Colors.white,),
                              onPressed:()=>{Navigator.push(context,new MaterialPageRoute(builder: (context) => WallScreen ()))},
                          )),
                      Expanded(
                        flex: 1,
                          child: IconButton(icon: Icon(Icons.search,size: 30,color: Colors.white,), onPressed: null))
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}