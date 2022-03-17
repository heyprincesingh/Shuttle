import 'package:flutter/material.dart';

class login_driver extends StatelessWidget {
  const login_driver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wall.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
