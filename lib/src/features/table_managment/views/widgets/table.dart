import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/logic/table_provider.dart';
import 'package:meseros_app/src/features/table_managment/views/widgets/hero_dialog.dart';

class TableWidget extends ConsumerStatefulWidget {
  int index;

  TableWidget({Key? key, required this.index}) : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends ConsumerState<TableWidget> {
  List<TableModel> tables = [];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(isEditProvider);
    final tablesState = ref.watch(tablesProvider);
    tables = tablesState.whenOrNull(
          data: (tables) {
            return tables;
          },
        ) ??
        [];
    return widget.index <
            tablesState.whenOrNull(
              data: (data) => data.length,
            )!
        ? GestureDetector(
            onTap: () {
              if (!state) print("viendo ordenes");
            },
            onLongPress: () {
              if (state) {
                print("editando mesa ${tables[widget.index].id}");

                Navigator.push(context,
                    HeroDialogRoute(builder: (BuildContext context) {
                  return Center(
                      child: AlertDialog(
                    scrollable: true,
                    alignment: Alignment.center,
                    title: Text(
                      "Mesa ${tables[widget.index].id}",
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Guardar"))
                    ],
                    content: Column(
                      children: [
                        Hero(
                          tag: "table-${widget.index}",
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: tables[widget.index].shape == 'r'
                                      ? BoxShape.rectangle
                                      : BoxShape.circle,
                                  color: tables[widget.index].hasOrder!
                                      ? Colors.green
                                      : Colors.grey),
                              child: SizedBox(
                                width: 200,
                                height: 100,
                                child: Column(
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Forma',
                          ),
                          onChanged: (text) => setState(() {}),
                        ),
                      ],
                    ),
                  ));
                }));
              }
            },
            child: Hero(
              tag: "table-${widget.index}",
              child: Container(
                  decoration: BoxDecoration(
                      shape: tables[widget.index].shape == 'r'
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      color: tables[widget.index].hasOrder!
                          ? Colors.green
                          : Colors.grey),
                  child: SizedBox(
                    width: 200,
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Mesa ${tables[widget.index].id}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          )
        : Container();
  }
}
