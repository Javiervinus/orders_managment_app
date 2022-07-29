part of 'table_provider.dart';

class TableNotifier extends StateNotifier<TableState> {
  final ITableRepositoryHttp _tableRepositoryHttp;
  final ITableRepository _tableRepository;

  TableNotifier(
      {required ITableRepositoryHttp tableRepositoryHttp,
      required ITableRepository tableRepository})
      : _tableRepositoryHttp = tableRepositoryHttp,
        _tableRepository = tableRepository,
        super(const TableState.initial());

  Future<void> createTable(TableModel table, BuildContext context) async {
    state = const TableState.loading();
    try {
      final response = await _tableRepositoryHttp.createTable(table);
      table.id = response;
      table.x = 0.0;
      table.y = 0.0;
      await _tableRepository.createTable(table);
      state = TableState.data(id: response);
      FocusManager.instance.primaryFocus?.unfocus();

      Navigator.pop(context);
    } catch (e) {
      print(e);
      state = TableState.error(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
