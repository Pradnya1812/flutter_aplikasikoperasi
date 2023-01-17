import 'dart:ffi';

import 'package:flutter_aplikasikoperasi/model/list_users_model.dart';
import 'package:dio/dio.dart';

class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUsersModel>?> getDataUsers() async {
    String url = 'http://apikoperasi.rey1024.com/users';
    final Response response;
    try {
      response = await dio.get(url);
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  postLogin(String username, String password) async {
    String url = 'http://apikoperasi.rey1024.com';
    final Response response;
    FormData formData =
        FormData.fromMap({"username": username, "password": password});
    // {"username": username, "password": password};

    // dio.options.headers['Authentication'] = 'Bearer $token'
    // dio.options.headers['Content type'] = 'aplication/json'
    response = await dio.post(
      url,
      data: formData,
    );
    // ignore: avoid_print
    print(username);
    if (response.statusCode == 200) {
      final data = response.data;
      //print(data['user_id']);
      return ListUsersModel(
        user_id: data[0]['user_id'],
        username: username,
        password: password,
        nama: data[0]['nama'],
        saldo: data[0]['saldo'],
        nomor_rekening: data[0]['nomor_rekening'],
      );
    } else {
      return postLogin(username, password);
    }
  }

  postRegister(String username, String password, String nama) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama});
    // {"username": username, "password": password};

    // dio.options.headers['Authentication'] = 'Bearer $token'
    // dio.options.headers['Content type'] = 'aplication/json'
    response = await dio.post(
      url,
      data: formData,
    );
    print(username);
    if (response.data['pesan'] == "Data berhasil disimpan, saldo awal 50.000") {
      print("berhasil");
    } else {
      return postRegister(username, password, nama);
    }
  }

  Setoran(int user_id, double jumlah_setoran) async {
    String url = 'http://apikoperasi.rey1024.com/setoran';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
    try {
      response = await dio.post(url, data: formData);
    } catch (e) {
      print('gagal');
    }
  }

  Tarikan(int user_id, double jumlah_tarikan) async {
    String url = 'http://apikoperasi.rey1024.com/tarikan';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_tarikan": jumlah_tarikan});
    try {
      response = await dio.post(url, data: formData);
    } catch (e) {
      print('gagal');
    }
  }

  transfer(
      int id_pengirim, double jumlah_setoran, String nomor_rekening) async {
    String url = 'http://apikoperasi.rey1024.com/transfer';
    final Response response;
    FormData formData = FormData.fromMap({
      "id_pengirim": id_pengirim,
      "jumlah_transfer": jumlah_setoran,
      "nomor_rekening": nomor_rekening
    });
    try {
      response = await dio.post(url, data: formData);
      print("berhasil");
    } catch (e) {
      print('gagal');
    }
  }
}
