import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  String _userID;
  String _password;

  void _onLogin() {
    final form = _formKey.currentState;
    form.save();

    if (_userID == '') {
      _showMessageDialog('账号不可为空');
      return;
    }
    if (_password == '') {
      _showMessageDialog('密码不可为空');
      return;
    }

    //导航到新路由有返回
    /*Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MyStackPage();
    }));*/

    //导航到新路由无返回
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new MyStackPage()),
        (route) => route == null);
  }

  void _showMessageDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text('提示'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _showAccountInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        style: TextStyle(fontSize: 15),
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: '请输入帐号',
            icon: new Icon(
              Icons.account_box,
              color: Colors.grey,
            )),
        onSaved: (value) => _userID = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: 15),
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: '请输入密码',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints.tightFor(height: 321),
              child: Image(
                image: AssetImage('assets/images/login.jpg'),
              ),
            ),
            Container(
              height: 160,
              padding: const EdgeInsets.fromLTRB(35, 30, 35, 0),
              child: Form(
                key: _formKey,
                child: Container(
                  height: 130,
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        _showAccountInput(),
                        Divider(
                          height: 0.5,
                          indent: 16.0,
                          color: Colors.grey[300],
                        ),
                        _showPasswordInput(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.fromLTRB(35, 30, 35, 0),
              child: OutlineButton(
                child: Text('登录'),
                textColor: Colors.orange,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                borderSide: BorderSide(color: Colors.orange, width: 1),
                onPressed: () {
                  _onLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
