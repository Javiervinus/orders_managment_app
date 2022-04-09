import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meseros_app/src/routes/app_router.gr.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Ordenes"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (() {
            AutoRouter.of(context).navigateNamed('test');
          })),
    );
  }
}
