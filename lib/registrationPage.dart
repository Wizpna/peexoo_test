import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peexoo_test/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController passWordController,
      userNameController,
      emailController,
      registeredAsContoller;

  final _formKey = GlobalKey<FormState>();
  String _userName, _password, _email, _registeredAs, _confirmPassword;
  List<String> categoryList = new List<String>();
  final formKey = new GlobalKey<FormState>();

  String _value;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // ignore: unnecessary_statements
      _userName;
      // ignore: unnecessary_statements
      _password;
      // ignore: unnecessary_statements
      _email;
      // ignore: unnecessary_statements
      _registeredAs;
      // ignore: unnecessary_statements
      _confirmPassword;

      _registerUser();
    }
  }

  _registerUser() async {
    if (_password != _confirmPassword) {
      print('wrong passcode, try again');
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(('Password not matching with confirm password !!!')),
      ));
    } else if (_password == _confirmPassword) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('User Name', _userName);
      prefs.setString('Email', _email);
      prefs.setString('password', _password);
      prefs.setString('Confirm Password', _confirmPassword);
      prefs.setString('Registered As', _registeredAs);
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(('User details registered ...')),
      ));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
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
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20,
                          ),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.orangeAccent,
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
                              left: 20.0, right: 20, top: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            validator: (input) => !input.contains('@')
                                ? 'Please enter a valid email'
                                : null,
                            onSaved: (input) {
                              _email = input;
                              print(_email);
                            },
                            cursorColor: Colors.orangeAccent,
                            decoration: InputDecoration(
                              hintText: ("E-mail"),
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 15),
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.orangeAccent,
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
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 15),
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.orangeAccent,
                            validator: (input) => input.length < 6
                                ? 'Must be at least 6 characters'
                                : null,
                            onSaved: (input) {
                              //if (_password != _confirmPassword) {}
                              _confirmPassword = input;
                              print(_confirmPassword);
                            },
                            decoration: InputDecoration(
                              hintText: ("Confirm Password"),
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
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 15, bottom: 20),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.person_add,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              canvasColor: Colors.black),
                                          child: DropdownButton<String>(
                                            icon: Icon(
                                              Icons
                                                  .keyboard_arrow_down, // Add this
                                              color: Colors.white,
                                              size: 25, // Add this
                                            ),
                                            hint: Text(
                                              'Register As',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            value: _value,
                                            items: <String>[
                                              'Photographer',
                                              'Videographer',
                                              'Photographer / videographer',
                                            ].map((String value) {
                                              return new DropdownMenuItem<
                                                  String>(
                                                value: value,
                                                child: new Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String value) {
                                              setState(() {
                                                _value = value;
                                                _registeredAs = _value;
                                                print(_registeredAs);
                                              });
                                            },
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                                  "Sign up to Tringoo",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
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
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
