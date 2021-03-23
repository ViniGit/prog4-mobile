import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DioService.dart';
// import 'package:http/http.dart' as http;
import 'package:validators/validators.dart' as validator;
import 'dart:convert';
import 'UserModel.dart';
import 'create_category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final DioServer _dioServer = DioServer();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder(
          future: _dioServer.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserModel> user = snapshot.data;
              return ListView(
                children: user
                    .map(
                      (UserModel user) => ListTile(
                        title: Text(user.name),
                        subtitle: Text("${user.id}"),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }
}

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  // var users = new List<UserModel>();

  // Future<UserModel> fetchUsers() async {
  //   final response =
  //       await http.get(Uri.http('localhost:8080', '/Stock-Management/'));

  //   if (response.statusCode == 200) {
  //     // return UserModel.fromJson(jsonDecode(response.body));
  //     print(response.body);
  //   } else {
  //     throw Exception('Failed to load User');
  //   }
  // }
  // Dio dio = new Dio();

  // Future<List<UserModel>> getUsers() async {
  //   try {
  //     var response =
  //         await dio.get("http://192.168.1.108:8080/Stock-Management/users?q=");
  //     // print(response.data.toString());
  //     final jsonMap = jsonDecode(response.data); //passando json para string
  //     print(jsonMap);
  //     // setState(() {
  //     //   users =
  //     //       (jsonMap as List).map((item) => UserModel.fromJson(item)).toList();
  //     // }); //setstate users

  //     users =
  //         (jsonMap as List).map((item) => UserModel.fromJson(item)).toList();
  //     return users; //retornando lista de usuários
  //   } on DioError catch (e) {
  //     throw (e.message);
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateUser()));
                },
                child: Text(
                  '+ Novo Usuário',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Listagem de Usuários',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey[400]),
                padding: EdgeInsets.all(35),
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Nome: ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Lucas Henrique',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Username: ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'lcsjogaj',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'E-mail: ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'lucashsilva99@hotmail.com',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Telefone: ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: '(62) 99631-3131',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Endereço: ',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Goianápolis',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.all(8.0),

  //   );
  // }
}
