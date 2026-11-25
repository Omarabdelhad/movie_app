
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/remote/network/fire_store_manager.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(LoginInitial());

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    final ok = await FireStoreManager.login(
      context,
      email: emailController.text.trim(),
      password: passController.text,
    );

    if (isClosed) return;

    emit(ok ? LoginSuccess() : LoginFailure());
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    emit(LoginLoading());

    final ok = await FireStoreManager.loginWithGoogle(context);

    if (isClosed) return;

    emit(ok ? LoginSuccess() : LoginFailure());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passController.dispose();
    return super.close();
  }
}
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

