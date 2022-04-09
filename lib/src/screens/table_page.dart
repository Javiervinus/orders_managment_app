import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mesas"),
      ),
    );
  }
}
