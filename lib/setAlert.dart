import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

double selectedValue = 1;

void showCustomDialog(BuildContext context, List stopList) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.7),
    transitionDuration: Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blueGrey),
                borderRadius: BorderRadius.all(Radius.circular(25))),
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width - 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: CupertinoPicker(
                  children: [
                    for (int i = 1; i < stopList.length; i++)
                      Text("${stopList[i]["Stop"]}"),
                  ],
                  onSelectedItemChanged: (value) {},

                  itemExtent: 25,
                  diameterRatio: 1,
                  useMagnifier: true,

                  magnification: 1.3,
                ),
              ),
              Alarmslider(),
              GestureDetector(
                onTap: () async {
                  Fluttertoast.showToast(
                      msg: "${selectedValue.toInt()} mins to go!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0,right: 35.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(width: 2, color: Colors.white38),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
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
                ),
              )
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

class Alarmslider extends StatefulWidget {
  const Alarmslider({Key? key}) : super(key: key);

  @override
  State<Alarmslider> createState() => _AlarmsliderState();
}


class _AlarmsliderState extends State<Alarmslider> {
  @override
  void dispose() {
    // TODO: implement dispose
    selectedValue = 1;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CupertinoSlider(
          value: selectedValue,
          min: 1,
          max: 59,
          divisions: 59,
          onChanged: (value) {
            selectedValue = value;
            setState(() {});
          },
        ),
        Text(
          "${selectedValue.toInt()}",
          style: TextStyle(
              fontSize: 35,
            decoration: TextDecoration.none,
            color: Colors.blue[400]
          ),
        ),
        Text(
          "mins",
          style: TextStyle(
            fontSize: 18,
              decoration: TextDecoration.none,
              color: Colors.blue[400]
          ),
        )
      ],
    );
  }
}