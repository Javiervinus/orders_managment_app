import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meseros_app/src/features/authentication/data/models/user_model.dart';
import 'package:meseros_app/src/features/authentication/data/repositories/auth_repository.dart';
import 'package:meseros_app/src/features/authentication/views/select_user_page.dart';
import 'package:meseros_app/src/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';
export 'auth_state.dart';
part 'auth_state_notifier.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(authRepository: ref.watch(authRepositoryProvider)));

//* Repository
final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRepository(),
);
