import 'package:flutter/material.dart';
import 'package:learn_flutter/model/user_model.dart';

class PageGetValue extends StatefulWidget {
  final UserModel value;

  PageGetValue({Key key, this.value}) : super(key: key);

  @override
  _PageGetValueState createState() => _PageGetValueState();
}

class _PageGetValueState extends State<PageGetValue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Passing Value Page'),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              Padding(
                  child: new Text(
                    'Passed Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.fromLTRB(5, 15, 5, 20)),
              Padding(
                padding: EdgeInsets.all(10),
                child: new Text(
                  'Username : ' + widget.value.username,
                  style:
                      new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: new Text(
                  'Email : ${widget.value.email}',
                  style:
                  new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
