import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';
import 'package:meseros_app/src/features/tableManagment/views/widgets/table.dart';
import 'package:meseros_app/src/features/tableManagment/logic/table_provider.dart';

class TablePage extends ConsumerStatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends ConsumerState<TablePage> {
  List<Widget> list2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTables();
  }

  void getTables() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("shots21/variables/mesas");
    collectionReference.snapshots().listen((event) {
      list2 = [];
      if (mounted) {
        setState(() {
          for (var element in event.docs) {
            var doc = element.data()! as Map;
            list2.add(
              TableWidget(
                left: doc["left"]!,
                top: doc["top"],
                status: doc["status"],
                nombre: doc["id"],
              ),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(isEditProvider);
    final authState = ref.watch(authNotifierProvider);

    List<Widget> list = [
      TableWidget(
        left: 80,
        top: 30,
      ),
      TableWidget(
        left: MediaQuery.of(context).size.width / 2.5,
        top: MediaQuery.of(context).size.height / 3,
        nombre: "prueba",
      )
    ];
    return Scaffold(
        body: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: GridPaper(
                color: Colors.black12,
                divisions: 1,
                interval: 200,
                subdivisions: 8,
              ),
            ),
            ...list2
          ],
        ),
        floatingActionButton: authState.mapOrNull(
              data: (value) {
                if (value.user.isWaiter == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      state
                          ? FloatingActionButton(
                              child: const Icon(Icons.add),
                              onPressed: (() {
                                AutoRouter.of(context).navigateNamed("login");
                              }),
                              backgroundColor: state ? Colors.black : null)
                          : const Text(""),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                          child: !state
                              ? const Icon(Icons.edit)
                              : const Icon(Icons.save),
                          onPressed: (() {
                            ref
                                .read(isEditProvider.notifier)
                                .update((state) => !state);
                          }),
                          backgroundColor: state ? Colors.blue : null),
                    ],
                  );
                } else {
                  return Column();
                }
              },
            ) ??
            Column());
  }
}
