import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle/setAlert.dart';

class bus_details extends StatefulWidget {
  const bus_details({Key? key}) : super(key: key);

  @override
  State<bus_details> createState() => _bus_detailsState();
}

var busroute = "";

class _bus_detailsState extends State<bus_details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString("assets/busdata.json"),
          builder: (context, snapshot) {
            var mydata = json.decode(snapshot.data.toString());
            if (mydata == null) {
              return Center(
                child: Text(
                  "Loading...",
                ),
              );
            } else {
              busroute = mydata[0]["ROUTE0"][0];
              int len = mydata[0]["ROUTE0"].length;
              print("This is ${mydata[0]}");
              return Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/wall.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(width: 2, color: Colors.white38),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        height: 50,
                        child: Center(
                          child: Text("$busroute",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                      width: 2, color: Colors.white38),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Arrival",
                                        style: TextStyle(
                                            fontSize: 20,
                                            decoration: TextDecoration.none,
                                            color: Colors.white)),
                                    Text("Location",
                                        style: TextStyle(
                                            fontSize: 20,
                                            decoration: TextDecoration.none,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 2, color: Colors.white38),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25))),
                                child: ListView.builder(
                                    itemExtent: 60,
                                    shrinkWrap: true,
                                    itemCount: mydata[0]["ROUTE0"].length - 1,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                    "${mydata[0]["ROUTE0"][index + 1]["time"]}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        decoration:
                                                            TextDecoration.none,
                                                        color: Colors.white,
                                                        fontWeight: index == 2
                                                            ? FontWeight.w800
                                                            : FontWeight.w200)),
                                                SizedBox(width: 30),
                                                index == 2
                                                    ? Icon(
                                                        Icons
                                                            .directions_bus_filled_outlined,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Icon(
                                                          CupertinoIcons
                                                              .smallcircle_fill_circle,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            Text(
                                                "${mydata[0]["ROUTE0"][index + 1]["Stop"]}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.white,
                                                  fontWeight: index == 2
                                                      ? FontWeight.w800
                                                      : FontWeight.w200,
                                                )),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: ()=> showCustomDialog(context,mydata[0]["ROUTE0"]),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                        width: 2, color: Colors.white38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Set Alert",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 15),
                                    Icon(
                                      CupertinoIcons.bell_fill,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
