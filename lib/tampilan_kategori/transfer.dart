import 'package:flutter/material.dart';
import 'package:flutter_aplikasikoperasi/model/list_users_model.dart';
import 'package:flutter_aplikasikoperasi/service/list_users_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

showNotification() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high channel',
    'Very important notification!!',
    description: 'the first notification',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin.show(
      1,
      'Koperasi Undiksha',
      'Berhasil Transfer',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ));
}
