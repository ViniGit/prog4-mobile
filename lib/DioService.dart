import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:validators/validators.dart' as validator;
import 'dart:convert';
import 'UserModel.dart';
import 'create_category.dart';

class DioServer {
  var users = new List<UserModel>();

  Dio dio = new Dio();

  Future<List<UserModel>> getUsers() async {
    try {
      var response =
          await dio.get("http://192.168.1.108:8080/Stock-Management/users?q=");
      print(response.data.toString());
      final jsonMap = jsonDecode(response.data); //passando json para string
      print(jsonMap);
      // setState(() {
      //   users =
      //       (jsonMap as List).map((item) => UserModel.fromJson(item)).toList();
      // }); //setstate users

      users =
          (jsonMap as List).map((item) => UserModel.fromJson(item)).toList();
      return users; //retornando lista de usuários
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
