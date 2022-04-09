part of 'auth_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _authRepository;

  AuthNotifier({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.initial()) {
    loadStorage();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    state = const AuthState.loading();
    try {
      final user = await _authRepository.login(email, password);
      state = AuthState.data(user: user);
      FocusManager.instance.primaryFocus?.unfocus();
      saveStorage(user);
      AutoRouter.of(context).pushWidget(const SelectUserPage(),
          transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }, transitionDuration: const Duration(milliseconds: 370));
    } catch (_) {
      state = const AuthState.error("Error al iniciar sesion");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Datos incorrectos")));
    }
  }

  logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_authRepository.logOut()) {
      prefs.remove("user");
      state = const AuthState.initial();
      AutoRouter.of(context).replace(LoginRouter());
    }
  }

  Future<void> loadStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("user")) {
      UserModel user = UserModel.fromJson(jsonDecode(prefs.getString("user")!));
      _authRepository.user = user;
      state = AuthState.data(user: user);
    } else {
      print("no se enncontro");
      state = const AuthState.initial();
    }
  }

  saveStorage(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final str = jsonEncode(user.toJson());
    prefs.setString("user", str);
  }

  selectTypeUser(bool? isWaiter, BuildContext context) {
    user()?.isWaiter = isWaiter;
    saveStorage(user()!);
    state = AuthState.data(user: user()!);
    AutoRouter.of(context).replace(TabsAppRouter());
  }

  UserModel? user() {
    return _authRepository.user;
  }
}
