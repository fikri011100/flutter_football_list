import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/page_passing_value.dart';
import 'package:learn_flutter/train_week_1/proj_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageHomeReturnData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Return Data'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelectionItem(context);
      },
      child: Text('Please click this to see an option!'),
    );
  }

  _navigateAndDisplaySelectionItem(BuildContext context) async {
    final resultOption = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => SelectionOptionScreen()));

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text("$resultOption"),
      ));

    // Scaffold.of(context).removeCurrentSnackBar();
    // Scaffold.of(context).showSnackBar(snackbar);
  }
}

class SelectionOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose an Option"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, 'This option yes');
                },
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: Text('Yes'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, 'This option no');
                },
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: Text('No'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
