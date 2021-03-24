import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'UserModel.dart';
import 'main.dart';
import 'package:flutter_application_1/DioService.dart';

class CreateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Criação de Usuário'),
        ),
        body: SingleChildScrollView(child: TestForm()),
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  UserModel model = UserModel();
  final DioServer _dioServer = DioServer();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              MyTextFormField(
                hintText: 'Nome:',
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Campo deve ser Preenchido!';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.name = value;
                },
              ),
              MyTextFormField(
                hintText: 'Username:',
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Campo deve ser Preenchido!';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.username = value;
                },
              ),
              MyTextFormField(
                hintText: 'Email',
                validator: (String value) {
                  if (!validator.isEmail(value)) {
                    return 'E-mail Inválido!';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.mail = value;
                },
              ),
              MyTextFormField(
                hintText: 'Telefone:',
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Campo deve ser Preenchido!';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.phone = value;
                },
              ),
              MyTextFormField(
                hintText: 'Endereço:',
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Campo deve ser Preenchido!';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.address = value;
                },
              ),
              MyTextFormField(
                hintText: 'Senha',
                isPassword: true,
                validator: (String value) {
                  if (value.length < 7) {
                    return 'A senha deve ter no mínimo 6 caracteres.';
                  }

                  _formKey.currentState.save();

                  return null;
                },
                onSaved: (String value) {
                  model.password = value;
                },
              ),
              MyTextFormField(
                hintText: 'Confirmação de Senha',
                isPassword: true,
                validator: (String value) {
                  if (value.length < 7) {
                    return 'A senha deve ter no mínimo 6 caracteres.';
                  } else if (model.password != null &&
                      value != model.password) {
                    print(value);
                    print(model.password);
                    return 'Senhas não se correspondem';
                  }

                  return null;
                },
              ),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    Future<bool> result = _dioServer.createUser(model);

                    // set up the button
                    Widget okButton = FlatButton(
                      child: Text("OK"),
                      onPressed: () {},
                    );

                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: Text(""),
                      content: Text("Usuário Cadastrado!"),
                      actions: [
                        okButton,
                      ],
                    );

                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  }
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
