/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';

class Model {
  String name;
  String userName;
  String email;
  String password;
  String confirmPassword;
  String phone;
  String address;

  Model(
      {this.name,
      this.userName,
      this.email,
      this.password,
      this.confirmPassword,
      this.phone,
      this.address});
}
