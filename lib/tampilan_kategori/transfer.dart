import 'package:flutter/material.dart';
import 'package:flutter_aplikasikoperasi/model/list_users_model.dart';
import 'package:flutter_aplikasikoperasi/service/list_users_service.dart';

class Transfer extends StatelessWidget {
  const Transfer({Key? key, required this.usersModel}) : super(key: key);
  final ListUsersModel usersModel;
  @override
  Widget build(BuildContext context) {
    TextEditingController jumlah_setorancontroller = TextEditingController();
    TextEditingController nomor_rekeningcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: jumlah_setorancontroller,
            decoration: InputDecoration(label: Text("jumlah_transfer")),
          ),
          TextField(
            controller: nomor_rekeningcontroller,
            decoration: InputDecoration(label: Text("nomor_rekening")),
          ),
          ElevatedButton(
              onPressed: () {
                ListUsersService _service = ListUsersService();
                _service.transfer(
                    int.parse(usersModel.user_id.toString()),
                    double.parse(jumlah_setorancontroller.text),
                    nomor_rekeningcontroller.text);
              },
              child: Text("Transfer"))
        ],
      )),
    );
  }
}
