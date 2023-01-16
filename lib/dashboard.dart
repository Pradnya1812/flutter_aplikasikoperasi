import 'package:flutter_aplikasikoperasi/mobileView.dart';
import 'package:flutter_aplikasikoperasi/model/list_users_model.dart';
import 'package:flutter_aplikasikoperasi/scanner.dart';
import 'package:flutter_aplikasikoperasi/tabletView.dart';
import 'package:flutter_aplikasikoperasi/tombol.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:vector_math/vector_math_operations.dart';

class dashboard extends StatefulWidget {
  final ListUsersModel user;
  const dashboard({Key? key, required this.user}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 7, 139),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480) {
          return TabletView();
        } else {
          return MobileView(user: widget.user);
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1C2474),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => QrScanner()),
          );
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.qr_code_scanner),
        ),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
