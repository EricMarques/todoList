import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    title: "Lista de Tarefas",
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
      ),
    );

    Future<File> _getFile() async {
      final directory = await getApplicationDocumentsDirectory();

      return File("${directory.path}/data.json");
    }

    Future<File> _saveData() async {
      String data = json.encode(_toDoList);
      final file = await _getFile();

      return file.writeAsString(data);
    }

    Future<String> _readData() async {
      try {
        final file = await _getFile();

        return file.readAsString();
      } catch (e) {
        return null;
      }
    }
  }
}
