class Mahasiswa {
  String username;
  String nama;
  String avatar;

  Mahasiswa({this.username, this.nama, this.avatar});

  Mahasiswa.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        nama = json['nama'],
        avatar = json['avatar'];
}
