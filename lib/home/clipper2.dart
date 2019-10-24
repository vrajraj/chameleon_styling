import 'package:flutter/material.dart';

class Clipper2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Card(
                color: Colors.white,
                clipBehavior: Clip.hardEdge,
                //margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child:
                //Image.asset('assets/menuPics/spa.jpg',fit: BoxFit.cover,)
                Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.pink[300],Colors.purple[400]])),)
            )
        ),
      ),
      clipper: BottomWaveClipper(),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height*0.4 );

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height*0.6 );
    path.lineTo(size.width, size.height);
    path.lineTo(0.0,size.height );
    //path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}