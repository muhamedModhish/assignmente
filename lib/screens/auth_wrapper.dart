import 'package:electronic_stor/screens/home_screen.dart';
import 'package:electronic_stor/screens/login_screen.dart';
import 'package:electronic_stor/screens/register_screen.dart';
import 'package:electronic_stor/constansts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _showLoginPage = true;

  void _toggleView() {
    setState(() {
      _showLoginPage = !_showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // حالة التحميل أثناء قراءة الجلسة
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: kBackgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        }

        // إذا كان المستخدم مسجل دخول
        if (snapshot.hasData && snapshot.data != null) {
          return HomeScreen();
        }

        // إذا لم يكن المستخدم مسجل دخول، يعرض شاشة الدخول أو التسجيل
        if (_showLoginPage) {
          return LoginScreen(toggleView: _toggleView);
        } else {
          return RegisterScreen(toggleView: _toggleView);
        }
      },
    );
  }
}
