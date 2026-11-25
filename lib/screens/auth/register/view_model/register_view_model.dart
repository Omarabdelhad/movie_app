import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/remote/network/fire_store_manager.dart';

class RegisterViewModel extends Cubit<RegisterState> {
  RegisterViewModel() : super(RegisterInitial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  int avatarIndex = 0;
  Timer? _timer;

  Future<void> createAccount(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    emit(RegisterLoading());
    final ok = await FireStoreManager.saveUser(
      context,
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      password: passController.text,
      avatarIndex: avatarIndex,
    );

    if (isClosed) return;

    if (ok) {
      emit(RegisterSuccess());
      _waitForVerification();
    } else {
      emit(RegisterFailure());
    }
  }

  void _waitForVerification() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final verified =
          FirebaseAuth.instance.currentUser?.emailVerified ?? false;
      if (verified) {
        timer.cancel();
        if (!isClosed) emit(RegisterVerified());
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
sealed class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {}

class RegisterVerified extends RegisterState {}
