import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/table_managment/logic/table_provider.dart';

class TableWidget extends ConsumerStatefulWidget {
  num left;
  num top;
  String id;
  bool status;

  TableWidget(
      {Key? key,
      this.left = 0.0,
      this.top = 0.0,
      this.id = "",
      this.status = false})
      : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends ConsumerState<TableWidget> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(isEditProvider);
    final tableState = ref.watch(tablesProvider);

    return AnimatedPositioned(
      left: widget.left.toDouble(),
      top: widget.top.toDouble(),
      duration: Duration(milliseconds: !state ? 300 : 0),
      child: state && !widget.status
          ? Draggable(
              child: ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: !widget.status ? Colors.blue[900] : Colors.red,
                  child: Center(
                      child: Text(
                    widget.id.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              feedback: ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue[900]!.withOpacity(0.7),
                  child: Center(
                      child: Text(
                    widget.id.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                setState(() {
                  widget.left = dragDetails.offset.dx;
                  widget.top = dragDetails.offset.dy - 103;
                  FirebaseFirestore.instance
                      .collection('shots21/variables/mesas')
                      .doc(widget.id)
                      .update({
                    "x": widget.left,
                    "y": widget.top,
                    "ref": FirebaseFirestore.instance
                        .collection('shots21/variables/mesas')
                        .doc(widget.id)
                  });
                });
              },
            )
          : GestureDetector(
              onVerticalDragStart: (DragStartDetails dd) {
                if (state) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${widget.id} tiene pedidos en curso"),
                    duration: const Duration(seconds: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              child: ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: !widget.status ? Colors.blue[900] : Colors.red,
                  child: Center(
                      child: Text(
                    widget.id.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
    );
  }
}
