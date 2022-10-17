import 'package:flutter/material.dart';

class TabletView extends StatefulWidget {
  const TabletView({
    Key? key,
  }) : super(key: key);

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  int tampilanaktif = 0;
  String judul = '';
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                      child: InkWell(
                        onTap: (() {
                          setState(() {
                            tampilanaktif = 0;
                          });
                        }),
                        child: Image.asset(
                          'images/logoundiksha.jpeg',
                        ),
                      ),
                    ),
                    padding: EdgeInsets.all(6),
                    color: Colors.amber,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.3,
                    // flex: 1,
                    child: ListView(
                      children: [
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                judul = 'Cek Saldo';
                                tampilanaktif = 1;
                              });
                            },
                            leading: Icon(
                              Icons.wallet_giftcard,
                              size: 35,
                            ),
                            title: Text(
                              'Cek Saldo',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                judul = 'Transfer';
                                tampilanaktif = 2;
                              });
                            },
                            leading: Icon(
                              Icons.wallet_giftcard,
                              size: 35,
                            ),
                            title: Text(
                              'Transfer',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                judul = 'Deposito';
                                tampilanaktif = 3;
                              });
                            },
                            leading: Icon(
                              Icons.wallet_giftcard,
                              size: 35,
                            ),
                            title: Text(
                              'Deposito',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                judul = 'Pembayaran';
                                tampilanaktif = 4;
                              });
                            },
                            leading: Icon(
                              Icons.wallet_giftcard,
                              size: 35,
                            ),
                            title: Text(
                              'Pembayaran',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                judul = 'Pinjaman';
                                tampilanaktif = 5;
                              });
                            },
                            leading: Icon(
                              Icons.wallet_giftcard,
                              size: 35,
                            ),
                            title: Text(
                              'Pinjaman',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                judul = 'Mutasi';
                                tampilanaktif = 6;
                              });
                            },
                            leading: Icon(
                              Icons.wallet_giftcard,
                              size: 35,
                            ),
                            title: Text(
                              'Mutasi',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    color: Colors.blue,
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: tampilanaktif == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nasabah',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('Ni Made Pradnyaswari Wijaya'),
                                  Text('Tabungan',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('500.000'),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Text(judul),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
