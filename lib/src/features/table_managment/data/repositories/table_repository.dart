import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

abstract class ITableRepository {
  Future<void> createMap(double x, double y, double zoom, int userId);
  Future<Map<String, dynamic>?> getMap(int userId);
  Stream<List<TableModel>> tablesStream();
  Future<void> editTable(String doc, Map<String, dynamic> data);
  Future<void> createTable(TableModel data);
}

class TableRepository implements ITableRepository {
  Map<String, dynamic>? map;
  final _tablesColletion =
      FirebaseFirestore.instance.collection("shots21/variables/mesas");
  final _mapColletion =
      FirebaseFirestore.instance.collection("shots21/variables/maps");

  @override
  Stream<List<TableModel>> tablesStream() => FirebaseFirestore.instance
      .collection("shots21/variables/mesas")
      .snapshots()
      .map((event) => event.docs.map((e) {
            // if (e.data()["ref"] != null) {
            //   var a = e.data()["ref"] as DocumentReference;
            //   a.get().then((value) => print(value.data()));
            // }
            // DocumentReference d = e.data()["ref"];
            var table = TableModel.fromJson(e.data());
            table.idF = e.id;
            vector.Vector3 node =
                vector.Vector3(table.x!.toDouble(), table.y!.toDouble(), 0);
            table.vector = node;

            return table;
          }).toList());

  @override
  Future<void> createMap(double x, double y, double zoom, int userId) async {
    print(zoom);
    await _mapColletion
        .doc('map-$userId')
        .set({"userId": userId, "x": x, "y": y, "zoom": zoom});
    map = {"userId": userId, "x": x, "y": y, "zoom": zoom};
  }

  @override
  Future<void> editTable(String doc, Map<String, dynamic> data) async {
    await _tablesColletion.doc(doc).update(data);
  }

  @override
  Future<Map<String, dynamic>?> getMap(int userId) async {
    var mapObj = await _mapColletion.doc('map-$userId').get();
    map = mapObj.data();
    return mapObj.data();
  }

  @override
  Future<void> createTable(TableModel data) async {
    await _tablesColletion.add(data.toJson());
  }

  Future<void> deleteTable(TableModel table) async {
    await _tablesColletion.doc(table.idF).delete();
  }
}
