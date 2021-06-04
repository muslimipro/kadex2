import 'package:flutter/material.dart';
import 'package:kadex2/auth/auth.dart';

class SignInPage extends StatelessWidget {
  // final Auth auth;
  final ValueChanged<User> onSuccess;

  SignInPage({
    @required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => onSuccess(User(uid: '123')),
            child: Text('Sign in')),
        // SignInButton(auth: auth, onSuccess: onSuccess),
      ),
    );
  }
}
