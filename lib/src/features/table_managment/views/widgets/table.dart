import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/logic/table_provider.dart';
import 'package:meseros_app/src/core/helpers/hero_dialog.dart';
import 'package:meseros_app/src/features/table_managment/views/widgets/table_dialog.dart';

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
    final isDialogOpen = ref.watch(isOpenDialog);
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
                print("editando mesa ${tables[widget.index].name}");
                ref.read(isOpenDialog).value = false;
                Navigator.push(context,
                    HeroDialogRoute(builder: (BuildContext context) {
                  return TableDialogWidget(
                      table: tables[widget.index],
                      heroTag: "table-${widget.index}");
                })).whenComplete(() => ref.read(isOpenDialog).value = true);
              }
            },
            child: Hero(
              tag: "table-${widget.index}",
              child: Container(
                  decoration: ShapeDecoration(
                      shape: tables[widget.index].shape == 'r'
                          ? const RoundedRectangleBorder()
                          : const CircleBorder(),
                      color: tables[widget.index].hasOrder
                          ? Colors.green
                          : Colors.grey),
                  child: SizedBox(
                    width: 200,
                    height: tables[widget.index].shape == 'r' ? 100 : 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Mesa ${tables[widget.index].name}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18.0),
                        ),
                      ],
                    ),
                  )),
            ),
          )
        : Container();
  }
}
