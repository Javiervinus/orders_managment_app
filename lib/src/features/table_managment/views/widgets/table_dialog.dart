import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/logic/table_provider.dart';
import 'package:meseros_app/src/features/table_managment/logic/table_state.dart';

class TableDialogWidget extends ConsumerStatefulWidget {
  TableDialogWidget(
      {Key? key,
      required this.table,
      required this.heroTag,
      this.isNew = false})
      : super(key: key);
  TableModel table;
  bool isNew;
  String heroTag;
  @override
  _TableDialogWidgetState createState() => _TableDialogWidgetState();
}

class _TableDialogWidgetState extends ConsumerState<TableDialogWidget> {
  List<TableModel> tables = [];

  late TableModel table;
  late ShapeBorder _shape;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    table = TableModel.fromJson(widget.table.toJson());
    // ref.read(createTableProvider(table));
    ref.read(tableStateProvider);
    ref.read(isLoadingDeleteProvider);
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingDeleteState = ref.watch(isLoadingDeleteProvider);
    final TableState createTableState = ref.watch(tableStateProvider);
    final isDialogOpen = ref.watch(isOpenDialog);
    final tableState = ref.watch(tablesProvider);
    tables = tableState.whenOrNull(
          data: (tables) {
            return tables;
          },
        ) ??
        [];

    return Center(
        child: AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      scrollable: true,
      alignment: Alignment.center,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              widget.isNew ? "Nueva mesa" : "Mesa",
            ),
          ),
          Expanded(
            child: TextFormField(
              showCursor: true,
              style: const TextStyle(fontSize: 19),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 13),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit,
                    size: 20,
                  )),
              initialValue: table.name,
              onChanged: (text) => setState(() {
                table.name = text;
              }),
            ),
          )
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        if (!widget.isNew)
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onTap: !isLoadingDeleteState
                  ? () {
                      List<TableModel> _toSave =
                          tables.where((i) => i.isEdit).toList();
                      for (var t in _toSave) {
                        var data = {"x": t.vector!.x, "y": t.vector!.y};
                        ref.read(databaseProvider)?.editTable(t.idF!, data);
                      }
                      ref.read(deleteTableProvider(table));
                      Navigator.pop(context);
                    }
                  : null,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
              onTap: !createTableState.isLoading
                  ? () async {
                      List<TableModel> _toSave =
                          tables.where((i) => i.isEdit).toList();
                      for (var t in _toSave) {
                        var data = {"x": t.vector!.x, "y": t.vector!.y};
                        ref.read(databaseProvider)?.editTable(t.idF!, data);
                      }
                      if (widget.isNew) {
                        await ref
                            .read(tableStateProvider.notifier)
                            .createTable(table, context);
                        isDialogOpen.value = true;
                      } else {
                        ref
                            .read(databaseProvider)
                            ?.editTable(table.idF!, table.toJson());
                        FocusManager.instance.primaryFocus?.unfocus();

                        Navigator.pop(context);
                      }
                    }
                  : null,
              child: createTableState.when(
                  initial: () => const Icon(Icons.save),
                  loading: () => const CircularProgressIndicator(),
                  data: (id) => const Icon(Icons.save),
                  error: (e) => const Icon(Icons.save))),
        )
      ],
      content: Column(
        children: [
          Hero(
            tag: widget.heroTag,
            child: AnimatedContainer(
                decoration: ShapeDecoration(
                    shape: table.shape == 'r'
                        ? const RoundedRectangleBorder()
                        : const CircleBorder(),
                    color: widget.table.hasOrder ? Colors.green : Colors.grey),
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
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
          const Divider(),
          CustomSlidingSegmentedControl<String>(
            initialValue: table.shape,
            children: const {
              "r": Icon(
                Icons.square_outlined,
              ),
              "c": Icon(
                Icons.circle_sharp,
              ),
            },
            decoration: BoxDecoration(
              color: CupertinoColors.lightBackgroundGray,
              borderRadius: BorderRadius.circular(8),
            ),
            thumbDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInToLinear,
            onValueChanged: (v) {
              setState(() {
                table.shape = v;
              });
            },
          ),
        ],
      ),
    ));
  }
}
