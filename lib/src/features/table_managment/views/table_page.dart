import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:meseros_app/src/core/helpers/hero_dialog.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:meseros_app/src/features/table_managment/views/widgets/table.dart';
import 'package:meseros_app/src/features/table_managment/views/widgets/table_dialog.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import '../logic/table_provider.dart';

class TablePage extends ConsumerStatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends ConsumerState<TablePage> {
  List<TableModel> tables = [];
  Map<String, dynamic>? map;
  @override
  void initState() {
    super.initState();
    ref.read(tablesProvider);
  }

  @override
  Widget build(BuildContext context) {
    bool state = ref.watch(isEditProvider);
    final authState = ref.watch(authNotifierProvider);
    final tableState = ref.watch(tablesProvider);
    ValueNotifier<bool> isDialogOpen = ref.watch(isOpenDialog);

    var map2 = ref.watch(mapObj);
    Matrix4 matrix = Matrix4.identity();
    ValueNotifier<int> pageState = ValueNotifier(0);
    tables = tableState.whenOrNull(
          data: (tables) {
            return tables;
          },
        ) ??
        [];
    if (tables.isNotEmpty) {
      adjustMatrix(matrix, map2);
    }
    return Scaffold(
        body: LayoutBuilder(
          builder: (ctx, constraints) => MatrixGestureDetector(
              shouldRotate: true,
              onMatrixUpdate: (m, tm, sm, rm) {
                matrix = MatrixGestureDetector.compose(matrix, tm, sm, null);
                double x = matrix.getTranslation().x;
                double y = matrix.getTranslation().y;
                double zoom =
                    MatrixGestureDetector.decomposeToValues(matrix).scale;
                map2?['x'] = x;
                map2?['y'] = y;
                map2?['zoom'] = zoom;
                pageState.value++;
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topLeft,
                color: Colors.transparent,
                child: AnimatedBuilder(
                  animation: pageState,
                  builder: (ctx, child) {
                    return SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            GridPaper(
                              divisions: 2,
                              color: Colors.black.withOpacity(0.5),
                              subdivisions: 3,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                            if (tables.isNotEmpty)
                              ...List.generate(
                                  tableState.whenOrNull(
                                    data: (data) => data.length,
                                  )!,
                                  (index) =>
                                      buildNode(matrix, pageState, index)),
                          ],
                        ));
                  },
                ),
              )),
        ),
        floatingActionButton: authState.mapOrNull(
              data: (value) {
                if (value.user.isWaiter == null) {
                  return SpeedDial(
                    openCloseDial: isDialogOpen,
                    closeManually: false,
                    animatedIcon: AnimatedIcons.menu_close,
                    backgroundColor: Colors.black,
                    activeBackgroundColor: Colors.red,
                    onOpen: () {
                      ref.read(isEditProvider.notifier).state = true;
                    },
                    onClose: () {
                      ref
                          .read(isEditProvider.notifier)
                          .update((state) => false);
                    },
                    renderOverlay: false,
                    children: [
                      SpeedDialChild(
                          child: const Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                          onTap: () {
                            List<TableModel> _toSave =
                                tables.where((i) => i.isEdit).toList();
                            for (var t in _toSave) {
                              var data = {"x": t.vector!.x, "y": t.vector!.y};
                              ref
                                  .read(databaseProvider)
                                  ?.editTable(t.idF!, data);
                            }

                            ref.read(databaseProvider)?.createMap(
                                map2?['x'],
                                map2?['y'],
                                map2?['zoom'],
                                authState.whenOrNull(data: (user) => user.id)!);
                            isDialogOpen.value = false;
                            ref
                                .read(isEditProvider.notifier)
                                .update((state) => false);
                          }),
                      SpeedDialChild(
                          onTap: () {
                            List<TableModel> _toSave =
                                tables.where((i) => i.isEdit).toList();
                            for (var t in _toSave) {
                              var data = {"x": t.vector!.x, "y": t.vector!.y};
                              ref
                                  .read(databaseProvider)
                                  ?.editTable(t.idF!, data);
                            }
                            Navigator.push(context, HeroDialogRoute(
                                builder: (BuildContext context) {
                              return TableDialogWidget(
                                table: TableModel(),
                                heroTag: "table",
                                isNew: true,
                              );
                            })).whenComplete(
                                () => ref.read(isOpenDialog).value = true);
                            // isDialogOpen.value = false;
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.black),
                    ],
                  );

                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     state
                  //         ? FloatingActionButton(
                  //             heroTag: null,
                  //             child: const Icon(Icons.add),
                  //             onPressed: (() {
                  //               AutoRouter.of(context).navigateNamed("login");
                  //             }),
                  //             backgroundColor: state ? Colors.black : null)
                  //         : const Text(""),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     state
                  //         ? FloatingActionButton(
                  //             heroTag: null,
                  //             child: const Icon(Icons.save),
                  //             onPressed: (() {
                  //               List<TableModel> _toSave =
                  //                   tables.where((i) => i.isEdit).toList();
                  //               for (var t in _toSave) {
                  //                 ref.read(databaseProvider)?.editTablePosition(
                  //                     t.idF!, t.vector!.x, t.vector!.y);
                  //               }
                  //               ref
                  //                   .read(isEditProvider.notifier)
                  //                   .update((state) => !state);

                  //               double x = matrix.getTranslation().x;
                  //               double y = matrix.getTranslation().y;

                  //               double zoom =
                  //                   MatrixGestureDetector.decomposeToValues(
                  //                           matrix)
                  //                       .scale;
                  //               ref.read(databaseProvider)?.createMap(
                  //                   x,
                  //                   y,
                  //                   zoom,
                  //                   authState.whenOrNull(
                  //                       data: (user) => user.id)!);
                  //             }),
                  //             backgroundColor: state ? Colors.blue : null)
                  //         : const Text(""),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     FloatingActionButton(
                  //         heroTag: null,
                  //         child: !state
                  //             ? const Icon(Icons.edit)
                  //             : const Icon(Icons.close),
                  //         onPressed: (() {
                  //           ref
                  //               .read(isEditProvider.notifier)
                  //               .update((state) => !state);
                  //         }),
                  //         backgroundColor: state ? Colors.red : null),
                  //   ],
                  // );
                } else {
                  return Column();
                }
              },
            ) ??
            Column());
  }

  Widget buildNode(Matrix4 matrix, ValueNotifier<int> pageState, int index) {
    Matrix4 ma = matrix.clone();
    ma.translate(tables[index].vector!.x, tables[index].vector!.y);
    return Transform(
        transform: ma,
        child: MatrixGestureDetector(
            shouldRotate: true,
            shouldScale: false,
            onMatrixUpdate: (m, tm, sm, rm) {
              if (ref.read(isEditProvider)) {
                Matrix4 change = tm;
                double sc =
                    MatrixGestureDetector.decomposeToValues(matrix).scale;
                tables[index].vector =
                    tables[index].vector! + change.getTranslation() / sc;
                tables[index].isEdit = true;
                pageState.value++;
              }
            },
            child: TableWidget(index: index)));
  }

  adjustMatrix(Matrix4 matrix, Map<String, dynamic>? map) {
    if (map != null) {
      matrix.scale(map['zoom'], map['zoom'], 0);
      matrix.setTranslationRaw(map['x'], map['y'], 0);
      return;
    }
    List<vector.Vector3> vectores = [];
    for (var t in tables) {
      vectores.add(t.vector!);
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - 150;
    vector.Vector3 maxNodeX = vectores.reduce((a, b) => a.x > b.x ? a : b);
    vector.Vector3 minNodeX = vectores.reduce((a, b) => a.x < b.x ? a : b);
    vector.Vector3 maxNodeY = vectores.reduce((a, b) => a.y > b.y ? a : b);
    vector.Vector3 minNodeY = vectores.reduce((a, b) => a.y < b.y ? a : b);
    double distanceX = maxNodeX.x + minNodeX.x + 100;
    double distanceY = maxNodeY.y + minNodeY.y + 100;
    double differenceX = maxNodeX.x - minNodeX.x + 200;
    double differenceY = maxNodeY.y - minNodeY.y + 100;
    double centerX = distanceX / 2;
    double centerY = distanceY / 2;
    double zoom;
    if (differenceX >= differenceY) {
      zoom = width / differenceX;
    } else {
      zoom = height / differenceY;
      double zoom2 = 0;
      if (differenceX > width) {
        zoom2 = width / differenceX;
      }
      zoom = (zoom2 + zoom) / 2;
    }
    zoom = zoom > 1 ? 1 : zoom;
    zoom = zoom > 0.55 ? zoom - 0.24 : zoom - 0.1;
    matrix.scale(vector.Vector3(zoom, zoom, 0));
    matrix.translate(vector.Vector3(-minNodeX.x + (zoom * zoom * centerX / 4),
        -minNodeY.y + (zoom * zoom * centerY / 4), 0));
  }
}
