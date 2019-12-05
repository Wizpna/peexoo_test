import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username, registeras;

  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('User Name') ?? '');
    registeras = (prefs.getString('Registered As') ?? '');
    print(username);
    print(registeras.toString());
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      drawer: Drawer(),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 150,
              color: Colors.orangeAccent,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 38,
                              backgroundColor: Colors.black,
                              child: ClipOval(
                                  child: Image.asset(
                                "assets/foto.png",
                                fit: BoxFit.fill,
                                height: MediaQuery.of(context).size.height,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                username,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                registeras,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "3.9",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            ListView(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 100.0, left: 15, right: 15),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.height * 0.24,
                            child: MaterialButton(
                              onPressed: () {},
                              height: 140,
                              color: Colors.white,
                              elevation: 30,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.photo_library,
                                    color: Colors.orangeAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Find My Pictures")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.24,
                            child: MaterialButton(
                              onPressed: () {},
                              height: 140,
                              color: Colors.white,
                              elevation: 30,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.find_in_page,
                                    color: Colors.orangeAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Find Photographer")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.height * 0.24,
                            child: MaterialButton(
                              onPressed: () {},
                              height: 140,
                              color: Colors.white,
                              elevation: 30,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.find_replace,
                                    color: Colors.orangeAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Find Studio")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.24,
                            child: MaterialButton(
                              onPressed: () {},
                              height: 140,
                              color: Colors.white,
                              elevation: 30,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.cloud_queue,
                                    color: Colors.orangeAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Tringoo Cloud")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.height * 0.24,
                            child: MaterialButton(
                              onPressed: () {},
                              height: 140,
                              color: Colors.white,
                              elevation: 30,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.print,
                                    color: Colors.orangeAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Qick Print")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.24,
                            child: MaterialButton(
                              onPressed: () {},
                              height: 140,
                              color: Colors.white,
                              elevation: 30,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.subscriptions,
                                    color: Colors.orangeAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Subscription")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.home,
                size: 30,
              ),
              Icon(
                Icons.search,
                size: 30,
              ),
              Icon(
                Icons.notification_important,
                size: 30,
              ),
              Icon(
                Icons.person_outline,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
