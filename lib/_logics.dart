import 'package:flutter/material.dart';
import 'package:fitness_app/_variables.dart';
import 'package:sqflite/sqflite.dart';


class Data {
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });
}