import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search_bus_list extends StatelessWidget {
  const search_bus_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        //color: Colors.amber,

        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "From ",
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      height: 55,
                      color: Colors.blue,
                      thickness: 5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "To",
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                )
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "7:45",
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                    child: Text(
                  "8:05",
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                  textAlign: TextAlign.right,
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () => {},
                    shape: StadiumBorder(),
                    color: Colors.blue,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => {},
                  shape: StadiumBorder(),
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.notifications),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
