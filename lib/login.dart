import 'dart:ui';

import 'package:flutter/material.dart';

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Koperasi Undiksha'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 8, 5, 130),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('images/logoundiksha.jpeg'),
                    width: 200,
                    height: 200,
                  ),
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50.0),
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
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                      Text('Password'),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      // Spacer(),
                      Center(
                        child: Container(
                          width: 200.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Login'),
                          ),
                        ),
                      )
                    ],
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
