import 'package:flutter_aplikasikoperasi/tampilan_kategori/setoran.dart';
import 'package:flutter_aplikasikoperasi/tampilan_kategori/tarikan.dart';
import 'package:flutter_aplikasikoperasi/tampilan_kategori/transfer.dart';
import 'package:flutter_aplikasikoperasi/tombol.dart';
import 'package:flutter/material.dart';

import 'model/list_users_model.dart';

class MobileView extends StatelessWidget {
  final ListUsersModel user;
  const MobileView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                // height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 10, 7, 139),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage('images/logoundiksha.jpeg'),
                                width: 90,
                                height: 90,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Hai Selamat Datang, ' + user.nama.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 150,
                                    padding: EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color:
                                            Color.fromARGB(255, 206, 191, 238)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Saldo Anda',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(user.saldo.toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          tombolkategori(
                            Icons.money,
                            'Transfer',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Transfer(
                                          usersModel: user,
                                        )),
                              );
                            },
                          ),
                          Spacer(),
                          tombolkategori(
                            Icons.money_sharp,
                            'Setoran',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Setoran(
                                          user: user,
                                        )),
                              );
                            },
                          ),
                          Spacer(),
                          tombolkategori(
                            Icons.money_sharp,
                            'Tarikan',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tarikan(
                                          user: user,
                                        )),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ]),

                padding: EdgeInsets.all(10.0),
                // height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 10, 7, 139),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(255, 206, 191, 238)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Butuh Bantuan?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  '0878-1234-1024',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.call,
                              size: 80,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
