import 'package:flutter/material.dart';
import 'package:fitness_app/_variables.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

var _bodyPart;
var _equipment;
var _weight;
var _reps;

void logics() {
  if (value1 == 1) {
    _bodyPart = "Biceps";
    if (valueEquip1 == 1) {
      _equipment = "11";
    }
    else if (valueEquip2 == 1) {
      _equipment = "12";
    }
    else if (valueEquip3 == 1) {
      _equipment = "13";
    }
    else if (valueEquip4 == 1) {
      _equipment = "14";
    }
  }
  else if (value2 == 1) {
    _bodyPart = "Chest";
    if (valueEquip1 == 1) {
      _equipment = "21";
    }
    else if (valueEquip2 == 1) {
      _equipment = "22";
    }
    else if (valueEquip3 == 1) {
      _equipment = "23";
    }
    else if (valueEquip4 == 1) {
      _equipment = "24";
    }
  }
  else if (value3 == 1) {
    _bodyPart = "Abs";
    if (valueEquip1 == 1) {
      _equipment = "31";
    }
    else if (valueEquip2 == 1) {
      _equipment = "32";
    }
    else if (valueEquip3 == 1) {
      _equipment = "33";
    }
    else if (valueEquip4 == 1) {
      _equipment = "34";
    }
  }
  else if (value4 == 1) {
    _bodyPart = "Legs";
    if (valueEquip1 == 1) {
      _equipment = "41";
    }
    else if (valueEquip2 == 1) {
      _equipment = "42";
    }
    else if (valueEquip3 == 1) {
      _equipment = "43";
    }
    else if (valueEquip4 == 1) {
      _equipment = "44";
    }
  }
}

// var fido = const Dog(
//   id: 0,
//   name: 'Fido',
//   age: 35,
// );
//
// await insertDog(fido);

class Data {
  final String date;
  final String bodyPart;
  final String equipment;
  final int weight;
  final int reps;

  const Data({
    required this.date,
    required this.bodyPart,
    required this.equipment,
    required this.weight,
    required this.reps,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'bodyPart': bodyPart,
      'equipment': equipment,
      'weight': weight,
      'reps': reps,
    };
  }

  @override
  String toString() {
    return 'Data{date: $date, bodyPart: $bodyPart, equipment: $equipment, weight: $weight, reps: $reps}';
  }
}

var command = [
  'CREATE TABLE data(date TEXT PRIMARY KEY, bodyPart TEXT, equipment TEXT, weight INTEGER, reps INTEGER);',
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'fitnessDatabase.db'),
    onCreate: (db, version) {
      return db.execute(
        command[0],
      );
    },
    version: 1,
  );

  Future<void> insertData(Data data) async {
    final db = await database;
    await db.insert(
      'data',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
