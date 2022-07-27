import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/routes/app_router.gr.dart';

import 'features/authentication/logic/auth_provider.dart';

class TabPage extends ConsumerWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    return AutoTabsScaffold(
        appBarBuilder: (_, tabsRouter) => AppBar(
              backgroundColor: Colors.black,
              title: state.mapOrNull(
                    data: (value) {
                      if (value.user.isWaiter == null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(value.user.name +
                                " " +
                                value.user.lastName +
                                " "),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Chip(
                                label: const Text("Admin"),
                                visualDensity: const VisualDensity(
                                    horizontal: 0.0, vertical: -4),
                                labelStyle: TextStyle(
                                    fontSize: 9,
                                    color: value.user.isWaiter == true
                                        ? Colors.black
                                        : Colors.white),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
                                backgroundColor: Colors.lightBlue,
                              ),
                            ),
                          ],
                        );
                      }
                      if (value.user.isWaiter == true) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(value.user.name +
                                " " +
                                value.user.lastName +
                                " "),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Chip(
                                label: const Text("Mesero"),
                                visualDensity: const VisualDensity(
                                    horizontal: 0.0, vertical: -4),
                                labelStyle: TextStyle(
                                    fontSize: 9,
                                    color: value.user.isWaiter == true
                                        ? Colors.black
                                        : Colors.white),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
                                backgroundColor: Colors.yellow,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            Text(value.user.name +
                                " " +
                                value.user.lastName +
                                " "),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Chip(
                                label: const Text("Chef"),
                                visualDensity: const VisualDensity(
                                    horizontal: 0.0, vertical: -4),
                                labelStyle: TextStyle(
                                    fontSize: 9,
                                    color: value.user.isWaiter == true
                                        ? Colors.black
                                        : Colors.white),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
                                backgroundColor: Colors.redAccent,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ) ??
                  const Text(""),
              leading: const AutoBackButton(),
              actions: [
                IconButton(
                    onPressed: () {
                      showAlertDialog(context, ref);
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
            ),
        routes: const [OrdersRouter(), TablesRouter()],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.notes_sharp), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.table_restaurant_rounded), label: "")
              ]);
        });
  }
}

showAlertDialog(BuildContext context, WidgetRef ref) {
  // set up the button
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancelar",
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      "Si",
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      ref.read(authNotifierProvider.notifier).logOut(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Advertencia"),
    content: const Text("Está seguro de cerrar sesión?"),
    actions: [continueButton, cancelButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
