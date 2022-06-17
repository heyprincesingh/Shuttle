import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shuttle/Driver/Driver_location.dart';

List<String> StudentBus = [
  'Select Route',
  'Route S1',
  'Route S1-A',
  'Route S2',
  'Route S3',
  'Route S4',
  'Route S5',
  'Route S6',
  'Route S7',
  'Route S7A',
  'Route S7B',
  'Route S8',
  'Route S9',
  'Route S10',
  'Route S11'
];
List<String> StaffBus = [
  'Select Route',
  'Route 11',
  'Route 122',
  'Route 144',
  'Route 188',
  'Route 33',
  'Route 55',
  'Route 66'
];
bool _switchValue = true;

class login_driver extends StatefulWidget {
  const login_driver({Key? key}) : super(key: key);

  @override
  State<login_driver> createState() => _login_driverState();
}

class _login_driverState extends State<login_driver> {
  var DDValue = "Select Route";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/wall.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 20,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton(
                    focusColor: Colors.white,
                    hint: Text("Select Route"),
                    value: DDValue.isEmpty ? "Select Route" : DDValue,
                    menuMaxHeight: 320,
                    dropdownColor: Colors.white,
                    items: _switchValue ? StaffBus.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(value),
                        ),
                      );
                    }).toList() : StudentBus.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(value),
                        ),
                      );
                    }).toList() ,
                    onChanged: (a) {
                      setState(() {
                        DDValue = a.toString();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Student       ",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                        )),
                    CupertinoSwitch(
                      activeColor: Colors.green,
                      trackColor: Colors.blue,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          DDValue = "Select Route";
                          _switchValue = value;
                        });
                      },
                    ),
                    Text("         Staff ",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 80,
                height: 80,
                child: RaisedButton(
                  //onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Driver_location())),
                  onPressed: () => DDValue == "Select Route"
                      ? Fluttertoast.showToast(
                          msg: 'Select valid Route',
                          toastLength: Toast.LENGTH_SHORT)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Driver_location(route: DDValue))),
                  color: Color(0xff1fdc1f),
                  textColor: Colors.white,
                  shape: CircleBorder(
                      side: BorderSide(width: 1, color: Colors.white)),
                  child: Text(
                    'Start',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
