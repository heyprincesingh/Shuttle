import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firstscreen extends StatelessWidget {
  const firstscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffc7c7c7),
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    child: Image.asset(
                      "assets/bus.png",
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.43,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text(
                      "Search Bus",
                      style: TextStyle(
                          color: Colors.black,
                          height: 2,
                          fontSize: 26,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: "shuttle"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.43,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffc7c7c7),
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    child: Image.asset(
                      "assets/search.png",
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.43,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text(
                      "Track Bus",
                      style: TextStyle(
                          color: Colors.black,
                          height: 2,
                          fontSize: 26,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontFamily: "shuttle"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Text(
          "or",
          style: TextStyle(
              color: Color(0xffc7c7c7),
              height: 2,
              fontSize: 26,
              letterSpacing: 2,
              fontFamily: "shuttle"),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You're a staff? ",
              style: TextStyle(
                  color: Color(0xffc7c7c7),
                  height: 2,
                  fontSize: MediaQuery.of(context).size.width * 0.065,
                  fontFamily: "shuttle"),
            ),
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  height: 2,
                  fontWeight: FontWeight.w100,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  fontFamily: "shuttle"),
            )
          ],
        ),
      ],
    );
  }
}
