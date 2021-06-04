import 'package:flutter/material.dart';
import 'package:kadex2/common/constants.dart';
import 'package:provider/provider.dart';

import 'auth/auth.dart';
import 'models/portfolio_model.dart';
import 'pages/home.dart';
import 'pages/sign_in.dart';

class DashboardApp extends StatefulWidget {
  @override
  _DashboardAppState createState() => _DashboardAppState();
}

class _DashboardAppState extends State<DashboardApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        scaffoldBackgroundColor: grayscaleLight,
      ),
      home: SignInSwitcher(),
    );
  }
}

class SignInSwitcher extends StatefulWidget {
  @override
  _SignInSwitcherState createState() => _SignInSwitcherState();
}

class _SignInSwitcherState extends State<SignInSwitcher> {
  bool _isSignedIn = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeOut,
      duration: Duration(milliseconds: 200),
      child: _isSignedIn
          ? ChangeNotifierProvider(
              create: (context) =>
                  PortfolioModel(indexName: "i30", activated: false),
              child: HomePage(
                onSignOut: _handleSignOut,
              ),
            )
          : SignInPage(
              // auth: widget.appState.auth,
              onSuccess: _handleSignIn,
            ),
    );
  }

  void _handleSignIn(User user) {
    // widget.appState.api = widget.apiBuilder(user);
    setState(() {
      _isSignedIn = true;
    });
  }

  Future _handleSignOut() async {
    // await widget.appState.auth.signOut();
    setState(() {
      _isSignedIn = false;
    });
  }
}
