import 'package:meseros_app/src/core/helpers/http_exception.dart';
import 'package:meseros_app/src/core/http/dio.dart';
import 'package:meseros_app/src/features/table_managment/data/models/table_model.dart';

abstract class ITableRepositoryHttp {
  Future<int> createTable(TableModel table);
  Future<bool> deleteTable(int id);
}

class TableRepositoryHttp implements ITableRepositoryHttp {
  @override
  Future<int> createTable(TableModel? table) async {
    try {
      if (table?.name == "") {
        throw HttpException("Debe Ingresar un nombre");
      }
      final response =
          await DioClient().dio.post("tables", data: table?.toJson());
      if (response.statusCode == 201) {
        return response.data["id"];
      } else {
        throw Exception();
      }
    } catch (_) {
      // debugPrint(_);
      throw _.toString();
    }
  }

  @override
  Future<bool> deleteTable(int id) async {
    try {
      final response = await DioClient().dio.delete("tables/$id");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
