import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {

  final Widget child;
  const LoginBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //       colors: [Color(0xFF54082A), Color(0xFF170615)],
      //       begin: Alignment.bottomLeft,
      //       end: Alignment.topRight,
      //       stops: [0.0, 1.0],
      //       tileMode: TileMode.clamp
      //   ),
      // ),
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/main_top.png',
              color: Colors.deepPurple.shade300,
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/main_bottom.png',
              color: Colors.deepPurple.shade300,
              width: size.width * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
