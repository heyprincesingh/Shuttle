import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle/bus_details.dart';
import 'package:shuttle/setAlert.dart';

class history extends StatelessWidget {
  const history({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/wall.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return index == 0
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(width: 2,color: Colors.white38),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)
                            )),
                        height: 50,
                        child: Center(
                          child: Text("History",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.white24),
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.amber,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "TN61 AF 2002",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 15),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    "Medical",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.028,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Divider(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.031,
                                        color: Colors.white,
                                        thickness: 1,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Java Point",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.028,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    "7:45 AM",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 23,
                                        color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "8:05 AM",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 23,
                                        color: Colors.white),
                                    textAlign: TextAlign.right,
                                  )),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(25),
                                              topLeft: Radius.circular(25))),
                                      elevation: 80,
                                      color: Colors.blue,
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const bus_details())),
                                        child: Container(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Center(
                                            child: Text(
                                              "Track Shuttle",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                        ),
                                      )),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      //delete bus history
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(25),
                                                topRight: Radius.circular(25))),
                                        elevation: 10,
                                        color: Colors.blue,
                                        child: Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            child: Icon(
                                              CupertinoIcons.delete,
                                              color: Colors.white,
                                            ))),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
              }),
        ),
      ),
    );
  }
}
