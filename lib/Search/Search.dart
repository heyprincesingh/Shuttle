import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuttle/Search_bus_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController from_text = TextEditingController();
  TextEditingController to_text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              color: Color(0x12121212),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: 0,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 14, 14, 5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              elevation: 20,
                              color: Colors.white,
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: TextFormField(
                                    controller: from_text,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'From',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 12, //65,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 5, 14, 14),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            elevation: 20,
                            color: Colors.white,
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: TextFormField(
                                  controller: to_text,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'To',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.018,
                        child: ElevatedButton(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Center(
                                  child: Text(
                                "Search",
                                style: TextStyle(fontSize: 18),
                              ))),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            from_text.text.isNotEmpty && to_text.text.isNotEmpty
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => search_bus_list(
                                            from_text: from_text.text,
                                            to_text: to_text.text)))
                                : Fluttertoast.showToast(
                                    msg: 'Enter Locations',
                                    toastLength: Toast.LENGTH_SHORT);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.0578,
                        right: 30,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                TextEditingController temp = from_text;
                                from_text = to_text;
                                to_text = temp;
                              });
                            },
                            child: Icon(
                              CupertinoIcons.arrow_up_arrow_down_circle_fill,
                              size: 40,
                              color: Colors.blue,
                            ))),
                    Positioned(
                        top: MediaQuery.of(context).size.width * -0.34,
                        child: Image.asset("assets/SRMlogo.png",
                            width: MediaQuery.of(context).size.width * 0.28))
                  ],
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              elevation: 80,
              color: Colors.blue,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Track Shuttle",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
