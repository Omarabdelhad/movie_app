import 'package:flutter/cupertino.dart';

abstract interface class RepoRegisterInterFace {
  Future<void> createAccount(BuildContext context);
  void waitForVerification();
}