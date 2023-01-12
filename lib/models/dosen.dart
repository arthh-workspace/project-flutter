class Dosen {
  String username;
  String nama;
  String avatar;

  Dosen({this.username, this.nama, this.avatar});

  Dosen.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        nama = json['nama'],
        avatar = json['avatar'];
}
