class ListUsersModel {
  ListUsersModel({
    this.user_id,
    this.username,
    this.password,
    this.nama,
    this.saldo,
    this.nomor_rekening,
  });

  String? user_id;
  String? username;
  String? password;
  String? nama;
  String? saldo;
  String? nomor_rekening;

  factory ListUsersModel.fromJson(Map<String, dynamic> json) => ListUsersModel(
        user_id: json["user_id"],
        username: json["username"],
        password: json["password"],
        nama: json["nama"],
        saldo: json["saldo"],
        nomor_rekening: json["nomor_rekening"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "username": username,
        "password": password,
        "nama": nama,
        "saldo": saldo,
        "nomor_rekening": nomor_rekening,
      };
}
