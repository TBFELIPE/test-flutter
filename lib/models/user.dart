class UserModel{
  String? _userId;
  String? _username;
  String? _email;
  String? _password;

  UserModel();

  String get password => _password!;

  set password(String value) {
    _password = value;
  }

  String get email => _email!;

  set email(String value) {
    _email = value;
  }

  String get username => _username!;

  set username(String value) {
    _username = value;
  }

  String get userId => _userId!;

  set userId(String value) {
    _userId = value;
  }

  @override
  String toString(){
    String s;
    s = "Nome: $_username\ne-mail: $_email\nsenha: $_password";
    return s;
  }

}