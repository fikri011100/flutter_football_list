import 'package:flutter/material.dart';

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

class PageTabBar extends StatefulWidget {
  @override
  _PageTabBarState createState() => _PageTabBarState();
}

class _PageTabBarState extends State<PageTabBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<int> itemTabs = new List();
  List<Container> footballList = new List();
  var football = [
    {"nama": "FC Bayern", "images": "img_bayern.png"},
    {"nama": "Man Utd", "images": "img_mu.png"},
    {"nama": "City", "images": "img_city.png"},
    {"nama": "Barca", "images": "img_barca.png"},
    {"nama": "Madrid", "images": "img_madrid.png"},
    {"nama": "FC Bayern", "images": "img_bayern.png"},
    {"nama": "Man Utd", "images": "img_mu.png"},
    {"nama": "City", "images": "img_city.png"},
    {"nama": "Barca", "images": "img_barca.png"},
    {"nama": "Madrid", "images": "img_madrid.png"}
  ];
  String txt;

  listData() {
    for (var i = 0; i < football.length; i++) {
      final listFootball = football[i];
      final String images = listFootball['images'];

      footballList.add(new Container(
        padding: new EdgeInsets.all(20.0),
        child: new InkWell(
          onTap: () {
            //intent
            Navigator.pop(context);
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => DetailFootballApp(
                        nama: listFootball['nama'], image: images)));
          },
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Hero(
                tag: listFootball['nama'],
                child: new Image.asset(
                  'image/$images',
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Text(
                listFootball['nama'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData();
    for (int i = 0; i < 25; i++) {
      itemTabs.add(i);
    }
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Tab Bar Apps"),
        backgroundColor: Colors.green,
        bottom: new TabBar(controller: tabController, tabs: <Widget>[
          new Tab(
            icon: new Icon(Icons.home),
          ),
          new Tab(
            icon: new Icon(Icons.dashboard),
          ),
          new Tab(
            icon: new Icon(Icons.data_usage),
          ),
          new Tab(
            icon: new Icon(Icons.close),
          ),
        ]),
      ),
      body: new TabBarView(controller: tabController, children: <Widget>[
        new Column(children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(top: 80),
            child: Image.asset(
              'image/img_bayern.png',
              width: 120,
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: new TextField(
              onChanged: (String text) {
                setState(() {
                  txt = text;
                });
              },
              decoration: new InputDecoration(
                  hintText: 'Enter UsernName', labelText: 'Username'),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: new TextField(
              onChanged: (String text) {
                setState(() {
                  txt = text;
                });
              },
              decoration: new InputDecoration(
                  hintText: 'Enter Password', labelText: 'Password'),
              obscureText: true,
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: new SizedBox(
              width: double.infinity,
              child: new FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                onPressed: () {},
                color: Colors.lightGreen,
                child: new Text(
                  'Login',
                  style: new TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
              ),
            ),
          ),
        ]),
        new Container(
            child: new GridView.count(
              childAspectRatio: (itemWidth / itemHeight),
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: footballList,
            )),
        new ListView.builder(
            itemCount: itemTabs.length,
            itemBuilder: (BuildContext context, int index) {
              return new ListTile(
                title: new Text("Item nomor : $index"),
                trailing: new Icon(Icons.print),
              );
            }),
        new Center(
          child: Text('Welcome to Close!'),
        ),
      ]),
    );
  }
}

class DetailFootballApp extends StatelessWidget {
  DetailFootballApp({this.nama, this.image});

  final String nama;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: new Hero(
              tag: nama,
              child: Material(
                child: new InkWell(
                  child: Image.asset(
                    'image/$image',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          new FootBallName(nama: nama),
          new BagianIcon()
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new IconText(
            iconData: Icons.call,
            text: "Call",
          ),
          new IconText(
            iconData: Icons.message,
            text: "Message",
          ),
          new IconText(
            iconData: Icons.photo,
            text: "Photo",
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  IconText({this.iconData, this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: new Column(
          children: <Widget>[
            new Icon(
              iconData,
              size: 20,
              color: Colors.red,
            ),
            new Text(
              text,
              style: new TextStyle(fontSize: 12, color: Colors.red),
            )
          ],
        ));
  }
}

class FootBallName extends StatelessWidget {
  FootBallName({this.nama});

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    nama,
                    style: new TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  new Text(
                    "$nama\@gmail.com",
                    style: new TextStyle(fontSize: 17, color: Colors.grey),
                  )
                ],
              )),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30,
                color: Colors.yellow,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PageGrid extends StatefulWidget {
  @override
  _PageGridState createState() => _PageGridState();
}

class _PageGridState extends State<PageGrid> {
  List<int> itemGrid = new List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      itemGrid.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GridView.builder(
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            color: Colors.blueAccent,
            child: new Padding(padding: const EdgeInsets.all(20.0)),
          );
        },
      ),
    );
  }
}

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  List<int> item = new List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 25; i++) {
      item.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Flutter"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          new IconButton(icon: Icon(Icons.data_usage), onPressed: () {})
        ],
      ),
      body: new ListView.builder(
          itemCount: item.length,
          itemBuilder: (BuildContext context, int index) {
            return new ListTile(
              title: new Text("Item nomor : $index"),
              trailing: new Icon(Icons.print),
            );
          }),
    );
  }
}