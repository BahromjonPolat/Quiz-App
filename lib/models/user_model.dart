import 'package:flutter/cupertino.dart';

class User {
  final int _id;
  final String _username;
  final String _email;
  final String _password;
  int _score;
  final IconData _avatar;

  User(this._id, this._username, this._email, this._password, this._score, this._avatar);


  int get id => _id;

  IconData get avatar => _avatar;

  int get score => _score;

  String get password => _password;

  String get email => _email;

  String get username => _username;

  set score(int value) {
    _score = value;
  }
}