import 'package:flutter/material.dart';
import 'package:learn_flutter/model/user_model.dart';
import 'package:learn_flutter/pages/page_get_data.dart';

class PagePassingValue extends StatefulWidget {
  @override
  _PagePassingValueState createState() => _PagePassingValueState();
}

class _PagePassingValueState extends State<PagePassingValue> {
  //declare variable for editingController

  var _userController = new TextEditingController();
  var _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passing Value App'),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'Please Input data',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20),
              ),
              TextFormField(
                controller: _userController,
                decoration: InputDecoration(
                    hintText: 'Input Username'
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Input Email'
                ),
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  //onpress send data to other pages
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PageGetValue(
                            value: UserModel(username: _userController.text,
                                email: _emailController.text),));
                  Navigator.of(context).push(route);
                }, child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
