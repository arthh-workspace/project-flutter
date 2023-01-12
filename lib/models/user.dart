class User {
  String username;
  String nama;
  String avatar;

  User({
    this.username,
    this.nama,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        nama = json['nama'],
        avatar = json['avatar'];
}
