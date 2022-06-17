import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle/bus_details.dart';

class search_bus_list extends StatelessWidget {
  String? from_text;
  String? to_text;

  search_bus_list({Key? key, this.from_text, this.to_text}) : super(key: key);

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
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.white24),
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
                                "$from_text",
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
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Divider(
                                    height: MediaQuery.of(context).size.height *
                                        0.031,
                                    color: Colors.white,
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              Text(
                                "$to_text",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  elevation: 10,
                                  color: Colors.blue,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const bus_details())),
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
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
                                onTap: () {},
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    elevation: 10,
                                    color: Colors.blue,
                                    child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Icon(
                                          Icons.notifications_active,
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
      ),
    );
  }
}
