class UserModel {
  int id;
  String name;
  String username;
  String mail;
  String phone;
  String address;
  String password;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.mail,
      this.password,
      this.phone,
      this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    mail = json['mail'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}
