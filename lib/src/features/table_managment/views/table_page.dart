import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import '../logic/table_provider.dart';

class TablePage extends ConsumerStatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends ConsumerState<TablePage> {
  List<vector.Vector3> vectores = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(isChanging);
    ref.read(matrixProvider);
    ref.read(tablesProvider);
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    final state = ref.watch(isEditProvider);
    final authState = ref.watch(authNotifierProvider);
    final tableState = ref.watch(tablesProvider);
    Matrix4 matrix = Matrix4.identity();
    ValueNotifier<int> pageState = ValueNotifier(0);
    tableState.whenOrNull(
      data: (tables) {
        vectores = [];
        num sumx = 0;
        num sumy = 0;
        for (var table in tables) {
          sumx = sumx + table.x!;
          sumy = sumy + table.y!;
          vector.Vector3 node =
              vector.Vector3(table.x!.toDouble(), table.y!.toDouble(), 0);
          vectores.add(node);
        }
        adjustMatrix(matrix);
      },
    );
    return Scaffold(
        body: LayoutBuilder(
          builder: (ctx, constraints) => MatrixGestureDetector(
              shouldRotate: false,
              onMatrixUpdate: (m, tm, sm, rm) {
                matrix = MatrixGestureDetector.compose(matrix, tm, sm, null);
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
                            ...List.generate(
                                vectores.length,
                                (index) =>
                                    buildNode2(matrix, pageState, index)),
                          ],
                        ));
                  },
                ),
              )),
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
                      state
                          ? FloatingActionButton(
                              child: const Icon(Icons.save),
                              onPressed: (() {
                                print(vectores);
                              }),
                              backgroundColor: state ? Colors.blue : null)
                          : const Text(""),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton(
                          child: !state
                              ? const Icon(Icons.edit)
                              : const Icon(Icons.close),
                          onPressed: (() {
                            ref
                                .read(isEditProvider.notifier)
                                .update((state) => !state);
                          }),
                          backgroundColor: state ? Colors.red : null),
                    ],
                  );
                } else {
                  return Column();
                }
              },
            ) ??
            Column());
  }

  Widget buildNode2(Matrix4 matrix, ValueNotifier<int> pageState, int index) {
    Matrix4 ma = matrix.clone();
    ma.translate(vectores[index].x, vectores[index].y);
    return Transform(
        transform: ma,
        child: MatrixGestureDetector(
            shouldRotate: false,
            shouldScale: false,
            onMatrixUpdate: (m, tm, sm, rm) {
              Matrix4 change = tm;
              double sc = MatrixGestureDetector.decomposeToValues(matrix).scale;
              vectores[index] += change.getTranslation() / sc;
              pageState.value++;
            },
            child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Node ${vectores[index].x}\n${vectores[index].y}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                ))));
  }

  adjustMatrix(Matrix4 matrix) {
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
    }
    zoom = zoom > 1 ? 1 : zoom;
    zoom = zoom > 0.55 ? zoom - 0.24 : zoom - 0.1;
    matrix.scale(vector.Vector3(zoom, zoom, 0));
    matrix.translate(vector.Vector3(-minNodeX.x + (zoom * zoom * centerX / 4),
        -minNodeY.y + (zoom * zoom * centerY / 4), 0));
  }
}
