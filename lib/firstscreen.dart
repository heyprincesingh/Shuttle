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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              height: 230,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffc7c7c7),
              ),
              child: Image.asset("assets/bus.png"),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 230,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xffc7c7c7),
              ),
              child: Image.asset("assets/search.png"),
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
