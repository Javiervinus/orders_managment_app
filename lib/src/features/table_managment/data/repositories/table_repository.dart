import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';

abstract class ITableRepository {
  Future<TableModel> create();
  Stream<List<TableModel>> tablesStream();
}

class TableRepository implements ITableRepository {
  final _service = FirebaseFirestore.instance;

  @override
  Future<TableModel> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

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

            return table;
          }).toList());
}
