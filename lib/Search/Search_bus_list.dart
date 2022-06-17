import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle/bus_details.dart';

class search_bus_list extends StatelessWidget {
  String? from_text;
  String? to_text;
  List route = ["Route S1", "Route S1-A", "Route S2", "Route S3", "Route S4", "Route S5" "Route S6"];

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
                  GetUserName(from_text!, to_text!, route[i])
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
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          List a = [];
          for (int i = 0; i < data["Stop"].length; i++)
            a.add(data["Stop"][i]["Name"]);

          if(a.contains(from_text) && a.contains(to_text)){
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white24),
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      route,
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
                        SizedBox(
                          width: 90,
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
                        SizedBox(
                          width: 90,
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
                        SizedBox(width: 10),
                        Text(
                          "7:45 AM",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                            child: Text(
                              "8:05 AM",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
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
                                width:
                                MediaQuery.of(context).size.width * 0.6,
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
                                  width: MediaQuery.of(context).size.width *
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
          }
          return Text("Not");
        }

        return Text("loading");
      },
    );
  }
}