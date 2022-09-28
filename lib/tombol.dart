import 'package:flutter/material.dart';

class tombolkategori extends StatelessWidget {
  var jenis_icon;
  final String title;
  tombolkategori(this.jenis_icon, this.title);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                jenis_icon,
                size: 40,
                color: Colors.blue,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
