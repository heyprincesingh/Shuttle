import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle/bus_details.dart';

class search_bus_list extends StatelessWidget {
  String? from_text;
  String? to_text;
  List route = [
    "Route S1",
    "Route S1-A",
    "Route S2",
    "Route S3",
    "Route S4",
    "Route S5",
    "Route S6"
  ];

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
            child: Column(
              children: [
                for (int i = 0; i < route.length; i++)
                  GetUserName(from_text!, to_text!, route[i]),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "No more shuttle available",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetUserName extends StatelessWidget {
  final String from_text;
  final String to_text;
  final String route;

  GetUserName(this.from_text, this.to_text, this.route);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Route');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(route).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong", style: TextStyle(fontSize: 10));
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist",
              style: TextStyle(fontSize: 10));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          List stopsList = [], timeList = [];
          for (int i = 0; i < data["Stop"].length; i++) {
            stopsList.add(data["Stop"][i]["Name"]);
            timeList.add(data["Stop"][i]["Time"]);
          }

          if (stopsList.contains(from_text) && stopsList.contains(to_text)) {
            int from_textindex = stopsList.indexOf(from_text);
            int to_textindex = stopsList.indexOf(to_text);
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white24),
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      route,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      height: MediaQuery.of(context).size.height * 0.001,
                      color: Colors.white70,
                      thickness: 1,
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        SizedBox(
                          width: 110,
                          child: Text(
                            "$from_text",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Divider(
                              height:
                                  MediaQuery.of(context).size.height * 0.031,
                              color: Colors.white60,
                              thickness: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          child: Text(
                            "$to_text",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 25),
                        Text(
                          "${timeList[from_textindex]} AM",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                            child: Text(
                          "${timeList[to_textindex]} AM",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: Colors.white),
                          textAlign: TextAlign.right,
                        )),
                        SizedBox(width: 25),
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
                                width: MediaQuery.of(context).size.width * 0.6,
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
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: Icon(
                                    Icons.notifications_active,
                                    color: Colors.white,
                                  ))),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        }
        return SizedBox();
      },
    );
  }
}
