import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_aplikasikoperasi/dashboard.dart';
import 'package:flutter_aplikasikoperasi/model/list_users_model.dart';
import 'package:flutter_aplikasikoperasi/register.dart';
import 'package:flutter_aplikasikoperasi/service/list_users_service.dart';

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  late String Username;
  late String Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 8, 5, 130),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('images/logoundiksha.jpeg'),
                    width: 300,
                    height: 300,
                  ),
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  // height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color.fromARGB(255, 8, 5, 130),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username'),
                      TextFormField(
                          onChanged: (value) {
                            Username = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          )),
                      Text('Password'),
                      TextFormField(
                        onChanged: (value) {
                          Password = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Spacer(),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.2,
                          child: ElevatedButton(
                            onPressed: () async {
                              ListUsersService _service = ListUsersService();
                              ListUsersModel user =
                                  await _service.postLogin(Username, Password);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        dashboard(user: user)),
                              );
                            },
                            child: Text('Login'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HalamanRegister(),
                                  ));
                            },
                            child: Text('Daftar Mbanking'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('lupa password?'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50,
                  color: Color.fromARGB(255, 183, 199, 255),
                  child: Center(
                    child: Text(
                      'Copyright@2022 by Pradnya',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
