import 'package:flutter/material.dart';
import 'package:wb_test_flutter/widgets/generic_filled_button.dart';
import 'package:wb_test_flutter/widgets/generic_password_field.dart';
import 'package:wb_test_flutter/widgets/generic_text_field.dart';
import 'package:wb_test_flutter/backend/firebase_communication.dart';

import '../models/user.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  bool _nameShowError = false;
  bool _emailShowError = false;
  bool _passwordShowError = false;
  bool _pwdConfShowError = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _pwdConfController = TextEditingController();

  void _validateFields(){
    if(_nameController.text.isEmpty) {
      throw Exception("Preencha o campo de nome");
    }
    if(_emailController.text.isEmpty){
      throw Exception("Preencha o campo de e-mail");
    }
    if(_passwordController.text.isEmpty){
      throw Exception("Preencha o campo de senha");
    }
    if(_pwdConfController.text.isEmpty){
      throw Exception("Preencha o campo de confirmação de senha");
    }
  }

  void _filledButtonAction() async {
    try {
      _validateFields;
    }
    catch(e) {
      print(e);
      return;
    }
    UserModel user = UserModel();
    user.username = _nameController.text;
    user.password = _passwordController.text;
    user.email = _emailController.text;
    print(user);

    bool a = await registerUser(user);

    if(a) {
      Navigator.pushNamed(context, "/reg-success");
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: const Text("Cadastro"),
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .primary
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GenericTextField(
                          fieldController: _nameController,
                          inputType: TextInputType.name,
                          fieldLabel: "Nome",
                          prefixIcon: Icons.person,
                          showError: _nameShowError
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GenericTextField(
                            fieldController: _emailController,
                            inputType: TextInputType.emailAddress,
                            fieldLabel: "e-mail",
                            prefixIcon: Icons.mail,
                            showError: _emailShowError
                        ),
                    ),
                    GenericPasswordField(
                      fieldController: _passwordController,
                      fieldLabel: "Senha",
                      showError: _passwordShowError
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GenericPasswordField(
                          fieldController: _pwdConfController,
                          fieldLabel: "Confirme a senha",
                          showError: _pwdConfShowError
                      )
                    ),
                    GenericFilledButton(
                      buttonText: "Cadastrar",
                      buttonFunction: _filledButtonAction,
                    )
                  ],
                )
            )
        )
    );
  }
}