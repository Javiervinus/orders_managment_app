import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/authentication/logic/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool errorOnEmail = false;
  bool errorOnPassword = false;

  @override
  void initState() {
    super.initState();
    nameController.text = "javiervin@hotmail.com";
    passwordController.text = "Hola123";

    // "ref" se puede utilizar en todos lo ciclos de vida de un StatefulWidget.
    ref.read(authNotifierProvider);
    setState(() {
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? get _errorTextEmail {
    final text = nameController.value.text;
    if (text.isEmpty) {
      setState(() {
        errorOnEmail = true;
      });
      return 'No puede estar vacía';
    }
    if (text.length < 4) {
      setState(() {
        errorOnEmail = true;
      });
      return 'Muy pequeña';
    }
    setState(() {
      errorOnEmail = false;
    });
    return null;
  }

  String? get _errorTextPass {
    final text = passwordController.value.text;
    if (text.isEmpty) {
      setState(() {
        errorOnPassword = true;
      });
      return 'No puede estar vacía';
    }
    if (text.length < 4) {
      setState(() {
        errorOnPassword = true;
      });
      return 'Muy pequeña';
    }
    setState(() {
      errorOnPassword = false;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // También podemos usar "ref" para escuchar a un provider dentro del método build
    final state = ref.watch(authNotifierProvider);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      '21Shots',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                SizedBox(
                  height: 140,
                  child: Center(
                    child: Image.asset("assets/images/21shots.png"),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Correo',
                        errorText: _errorTextEmail),
                    onChanged: (text) => setState(() {}),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Contraseña',
                        errorText: _errorTextPass),
                    onChanged: (text) => setState(() {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        child: state.when(
                            initial: () => const Text("Entrar"),
                            loading: () => const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                )),
                            data: (data) => const Text("Entrar"),
                            error: (error) => const Text("Entrar")),
                        onPressed: !state.isLoading &&
                                !errorOnPassword &&
                                !errorOnEmail
                            ? () {
                                ref.read(authNotifierProvider.notifier).login(
                                    nameController.text,
                                    passwordController.text,
                                    context);
                              }
                            : null,
                      )),
                ),
              ],
            )));
  }
}
