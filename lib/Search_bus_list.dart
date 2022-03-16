import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search_bus_list extends StatelessWidget {
  const search_bus_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                            color: Colors.white24),
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("TN61 AF 2002",style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16,10,16,8),
                              child: Text(
                                "Medical",
                                style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Divider(
                                  height: 50,
                                  color: Colors.white,
                                  thickness: 5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13,10,16,8),
                              child: Text(
                                "Java Point",
                                style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18.0,8,10,15),
                              child: Text(
                                "7:45 AM",
                                style: TextStyle(fontSize: 23, color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(13,8,18,15),
                                  child: Text(
                              "8:05 AM",
                              style: TextStyle(fontSize: 23, color: Colors.white),
                              textAlign: TextAlign.right,
                            ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              minWidth: 200,
                              height: 50,
                              child: RaisedButton(
                                child: Text(
                                  "Track",
                                  style:
                                      TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                onPressed: () => {},
                                shape: StadiumBorder(),
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 20,),
                            FloatingActionButton(
                              onPressed: () => {},
                              shape: StadiumBorder(),
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.notifications),
                            ),
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
