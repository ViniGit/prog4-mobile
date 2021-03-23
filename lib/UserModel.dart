class UserModel {
  int id;
  String name;
  String username;
  String mail;
  String phone;
  String address;
  bool hasForeignKey;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.mail,
      this.phone,
      this.address,
      this.hasForeignKey});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    mail = json['mail'];
    phone = json['phone'];
    address = json['address'];
    hasForeignKey = json['hasForeignKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['hasForeignKey'] = this.hasForeignKey;
    return data;
  }
}
