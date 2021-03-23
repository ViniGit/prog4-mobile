import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'UserModel.dart';

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
  // UserModel model = UserModel();

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
                  // model.name = value;
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
                  // model.username = value;
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
                  // model.mail = value;
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
                  // model.phone = value;
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
                  // model.address = value;
                },
              ),

              // MyTextFormField(
              //   hintText: 'Password',
              //   isPassword: true,
              //   validator: (String value) {
              //     if (value.length < 7) {
              //       return 'A senha deve ter no mínimo 6 caracteres.';
              //     }

              //     _formKey.currentState.save();

              //     return null;
              //   },
              //   onSaved: (String value) {
              //     model.password = value;
              //   },
              // ),

              // MyTextFormField(
              //   hintText: 'Confirm Password',
              //   isPassword: true,
              //   validator: (String value) {
              //     if (value.length < 7) {
              //       return 'A senha deve ter no mínimo 6 caracteres.';
              //     } else if (model.password != null &&
              //         value != model.password) {
              //       print(value);
              //       print(model.password);
              //       return 'Senhas não se correspondem';
              //     }

              //     return null;
              //   },
              // ),
              // Container(
              //   alignment: Alignment.topCenter,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: <Widget>[
              //       Container(
              //         alignment: Alignment.topRight,
              //         width: halfMediaWidth,
              //         child: MyTextFormField(
              //           hintText: 'First Name',
              //           validator: (String value) {
              //             if (value.isEmpty) {
              //               return 'Enter your first name';
              //             }
              //             return null;
              //           },
              //           onSaved: (String value) {
              //             model.firstName = value;
              //           },
              //         ),
              //       ),
              //       Container(
              //         alignment: Alignment.topLeft,
              //         width: halfMediaWidth,
              //         child: MyTextFormField(
              //           hintText: 'Last Name',
              //           validator: (String value) {
              //             if (value.isEmpty) {
              //               return 'Enter your last name';
              //             }
              //             return null;
              //           },
              //           onSaved: (String value) {
              //             model.lastName = value;
              //           },
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              RaisedButton(
                color: Colors.blueAccent,
                // onPressed: () {
                //   if (_formKey.currentState.validate()) {
                //     _formKey.currentState.save();

                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Result(model: this.model)));
                //   }
                // },
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
