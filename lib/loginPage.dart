import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peexoo_test/homePage.dart';
import 'package:peexoo_test/registrationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passWordController, userNameController;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String _userName, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // ignore: unnecessary_statements
      _userName;
      // ignore: unnecessary_statements
      _password;

      checkUserDetails();
    }
  }

  checkUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_userName != (prefs.getString('User Name') ?? '') &&
        _password != (prefs.getString('password') ?? '')) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("Incorrect username or password !!!"),
      ));
      print('Incorrect username and password');
    } else if (_userName == (prefs.getString('User Name') ?? '') &&
        _password == (prefs.getString('password') ?? '')) {
      print('correct username and password');
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 20),
                          child: TextFormField(
                            cursorColor: Colors.orangeAccent,
                            style: TextStyle(color: Colors.white),
                            validator: (input) => input.trim().isEmpty
                                ? 'Please enter a valid username'
                                : null,
                            onSaved: (input) {
                              _userName = input.toLowerCase();
                              print(_userName);
                            },
                            decoration: InputDecoration(
                              hintText: ("Username"),
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 20),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.orangeAccent,
                            controller: passWordController,
                            obscureText: true,
                            validator: (input) => input.length < 6
                                ? 'Must be at least 6 characters'
                                : null,
                            onSaved: (input) {
                              _password = input;
                              print(_password);
                            },
                            decoration: InputDecoration(
                              hintText: ("Password"),
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                                //color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15),
                          child: MaterialButton(
                            height: 55,
                            color: Colors.orangeAccent,
                            onPressed: () {
                              _submit();
                            },
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  child: Icon(
                                    Icons.lightbulb_outline,
                                    color: Colors.orangeAccent,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Sign in to Tringoo",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationPage())),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
