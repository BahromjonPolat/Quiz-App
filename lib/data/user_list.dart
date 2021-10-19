import 'package:flutter/material.dart';
import 'package:examtwo/models/user_model.dart';

class UserData {
  static List<User> userList = [
    User(
      1,
      "Bahromjon94",
      "bahromjon.ergashboyev@gmail.com",
      "123456",
      12,
      Icons.person,
    ),

    User(
      2,
      "Ibrohim",
      "ibrohim@gmail.com",
      "123456",
      45,
      Icons.person,
    ),

    User(
      3,
      "Jasur",
      "jasur@gmail.com",
      "123456",
      12,
      Icons.person,
    ),

    User(
      4,
      "bahromjon",
      "bahromjon@gmail.com",
      "123456",
      42,
      Icons.person,
    ),
  ];

  static User currentUser = userList[0];

}

