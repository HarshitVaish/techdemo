import 'package:flutter/material.dart';
import 'package:techdemo/ui/HomePage.dart';
import 'dart:collection';

import 'package:techdemo/ui/Signup.dart';
class login extends StatefulWidget {
  List<String> cdrt=new List();

  login({Key key, this.cdrt}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new loginState(cdrt);
  }
}

class loginState extends State<login> {
  final TextEditingController emailController=new TextEditingController();
  final TextEditingController passController=new TextEditingController();
  List<String> cdrt=new List();

  loginState(this.cdrt);


  void validate(){
    Map<String,String> credit=new Map();

    credit["user"]="123";
    credit["pass"]="123";
    if(cdrt.isEmpty) {
      cdrt.add(credit["user"]);
      cdrt.add(credit["pass"]);
    }
    setState(() {
    String email= emailController.text;
    String pass=passController.text;
    if(email.isEmpty&&pass.isEmpty){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Enter Email and password"),
            content: new Text("Enter Email and password"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    if(!cdrt.isEmpty){
      var user =/*credit["user"]*/cdrt[0];
      var pss = /*credit["pass"]*/cdrt[1];
    if(email==user&&pass==pss) {
      var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
        new HomePage(cdrt: cdrt),
      );
      Navigator.of(context).push(route);
//      Navigator.push(context,  MaterialPageRoute(
//          builder: (context) => new HomePage(credit :credit)
//
      //     ));}
    }
    else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Wrong Email or password"),
            content: new Text("Wrong Email or password"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    }
    else{
      debugPrint("error");
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Login Page"),
          centerTitle: true,
          backgroundColor: Colors.redAccent),
      body: new Container(
        alignment: Alignment.topCenter,
        child:
            new ListView(padding: const EdgeInsets.all(2.0), children: <Widget>[
          new Image.asset(
            "images/ic_launcher.png",
            height: 85.0,
            width: 75.0,
          ),
          new Container(
            padding: EdgeInsets.all(40.5),
            margin: const EdgeInsets.fromLTRB(3.0, 40.0, 3.0, 20.0),
            height: 285.0,
            width: 290.0,
            color: Colors.grey.shade300,
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Email Address",
                      hintText: "abc@xyz.com",
                      icon: new Icon(Icons.person)),
                ),
                new TextField(
                  controller: passController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: new InputDecoration(
                      labelText: "Password",
                      hintText: "1234",
                      icon: new Icon(Icons.lock)),
                ),
                new Padding(padding: new EdgeInsets.all(10.8)),
                new Container(
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new RaisedButton(
                          onPressed: () =>Navigator.push(context,  MaterialPageRoute(
                            builder: (context) => new Signup(),
                          )),
                          color: Colors.redAccent,
                          child: new Text("Sign UP"),
                          textColor: Colors.white,
                        ),
                        new Padding(
                            padding: new EdgeInsets.fromLTRB(
                                110.0, 25.0, 20.0, 15.0)),
                        new RaisedButton(
                          onPressed: validate,
                          color: Colors.redAccent,
                          child: new Text("Sign In"),
                          textColor: Colors.white,
                        ),
                      ],
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

