import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/tableManagment/logic/table_provider.dart';

class TableWidget extends ConsumerStatefulWidget {
  double left;
  double top;
  String nombre;
  TableWidget({Key? key, this.left = 0.0, this.top = 0.0, this.nombre = "mesa"})
      : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends ConsumerState<TableWidget> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(isEditProvider);

    return Positioned(
      left: widget.left,
      top: widget.top,
      child: state
          ? Draggable(
              child: ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue[900],
                  child: Center(
                      child: Text(
                    widget.nombre,
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
                    widget.nombre,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              childWhenDragging: Container(),
              onDragEnd: (dragDetails) {
                print(dragDetails.offset);
                setState(() {
                  widget.left = dragDetails.offset.dx;
                  widget.top = dragDetails.offset.dy - 103;
                });
              },
            )
          : ClipOval(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue[900],
                child: Center(
                    child: Text(
                  widget.nombre,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
    );
  }
}
