import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';
import 'package:meseros_app/src/features/table_managment/views/widgets/table.dart';
import 'package:meseros_app/src/features/table_managment/logic/table_provider.dart';

class TablePage extends ConsumerStatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends ConsumerState<TablePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(isEditProvider);
    final authState = ref.watch(authNotifierProvider);
    final tableState = ref.watch(tablesProvider);
    List<Widget> tablesList = tableState.whenOrNull(
          data: (data) {
            List<Widget> l = [];
            for (var item in data) {
              l.add(TableWidget(
                top: item.y!,
                left: item.x!,
                status: item.hasOrder!,
                id: item.idF!,
              ));
            }
            return l;
          },
        ) ??
        [const Text("no hay")];

    return Scaffold(
        body: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: GridPaper(
                color: Colors.black12,
                divisions: 1,
                interval: 200,
                subdivisions: 8,
              ),
            ),
            ...tablesList
          ],
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
                      FloatingActionButton(
                          child: !state
                              ? const Icon(Icons.edit)
                              : const Icon(Icons.close),
                          onPressed: (() {
                            ref
                                .read(isEditProvider.notifier)
                                .update((state) => !state);
                          }),
                          backgroundColor: state ? Colors.blue : null),
                    ],
                  );
                } else {
                  return Column();
                }
              },
            ) ??
            Column());
  }
}
