import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';

class SelectUserPage extends ConsumerWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: state.mapOrNull(
          data: (value) => Text("Bienvenido " + value.user.name),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  "Escoge el tipo de usuario ",
                  style: TextStyle(
                      fontSize: 21,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      if (state.mapOrNull(data: (value) => value.user.waiter) !=
                          null)
                        Card(
                          color: Colors.yellow,
                          margin: const EdgeInsets.all(20),
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(authNotifierProvider.notifier)
                                  .selectTypeUser(true, context);
                            },
                            child: Container(
                                width: 180,
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: const [
                                    Icon(Icons.person),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Mesero",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      else
                        const Text(""),
                      if (state.mapOrNull(data: (value) => value.user.chef) !=
                          null)
                        Card(
                          color: Colors.redAccent,
                          margin: const EdgeInsets.all(20),
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(authNotifierProvider.notifier)
                                  .selectTypeUser(false, context);
                            },
                            child: Container(
                                width: 180,
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.fastfood,
                                      color: Colors.white,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Chef",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      else
                        const Text(""),
                      if (state.mapOrNull(
                              data: (value) => value.user.isAdmin) ==
                          true)
                        Card(
                          color: Colors.lightBlue,
                          margin: const EdgeInsets.all(20),
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(authNotifierProvider.notifier)
                                  .selectTypeUser(null, context);
                            },
                            child: Container(
                                width: 180,
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.admin_panel_settings,
                                      color: Colors.white,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Admin",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      else
                        const Text(""),
                    ],
                  )),
              state.mapOrNull(
                    data: (value) {
                      if (value.user.isWaiter == null) {
                        return const Text("es admin");
                      }
                      if (value.user.isWaiter == true) {
                        return const Text("Es mesero");
                      } else {
                        return const Text("Es chef");
                      }
                    },
                  ) ??
                  const Text("")
            ],
          ),
        ),
      ),
    );
  }
}
