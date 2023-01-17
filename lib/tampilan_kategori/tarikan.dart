import 'package:flutter/material.dart';
import 'package:flutter_aplikasikoperasi/model/list_users_model.dart';
import 'package:flutter_aplikasikoperasi/service/list_users_service.dart';

class Tarikan extends StatefulWidget {
  final ListUsersModel user;

  const Tarikan({Key? key, required this.user}) : super(key: key);

  @override
  State<Tarikan> createState() => _TarikanState();
}

class _TarikanState extends State<Tarikan> {
  bool penarikanLoading = false;
  final TextEditingController jumlahPenarikanController =
      TextEditingController();

  confirmDialog(String? user_id, String jumlah_setoran) {
    showDialog(
      context: (context),
      builder: (_) => AlertDialog(
        title: Text('Are You Sure?'),
        actions: [
          (penarikanLoading)
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      penarikanLoading = true;
                    });
                    await tarikSaldo(user_id, jumlah_setoran);
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: jumlahPenarikanController,
                    decoration: InputDecoration(labelText: "Jumlah Penarikan"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  confirmDialog(
                      widget.user.user_id, jumlahPenarikanController.text);
                  // tarikSaldo(
                  //     widget.user.user_id, jumlahPenarikanController.text);
                },
                child: Text('Tarik'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tarikSaldo(String? user_id, String jumlah_tarikan) async {
    ListUsersService _service = ListUsersService();
    await _service.Tarikan(int.parse(user_id!), double.parse(jumlah_tarikan));
    setState(() {
      penarikanLoading = false;
    });
  }
}
