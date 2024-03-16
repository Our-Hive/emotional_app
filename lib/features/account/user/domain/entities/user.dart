import 'package:flutter/material.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String userName;
  final String phoneNumber;
  final DateTime birthDate;
  final Color photoColor;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.birthDate,
    this.photoColor = Colors.yellow,
  });
}
