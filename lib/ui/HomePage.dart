import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:techdemo/ui/login.dart';

class HomePage extends StatefulWidget {
  HashMap<String,dynamic> credit=new HashMap();
  List cdrt=new List();


HomePage({Key key, this.cdrt}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homePageState(cdrt);
  }
}

class homePageState extends State<HomePage> {
  HashMap<String, String> credit=new HashMap();
   String name="";
   List<String> cdrt=new List();

  //  homePageState(HashMap<String,String> credit){
//    this.credit=credit;
//  }


  homePageState(this.cdrt);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HomePage"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.person),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => new login(cdrt:cdrt))),
            color: Colors.redAccent,

          ),
        ],
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Text("Welcome Home ${cdrt[0]}"),
      ),
    );
  }
}
