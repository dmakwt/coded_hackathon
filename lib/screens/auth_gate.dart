import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coded/screens/bottom_nav_screen.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: FlutterLogo(
                  size: 120,
                ),
              );
            },
            footerBuilder: ((context, action) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'By signing in, you are agree to our terms and conditions.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              );
            }),
          );
        }

        return const BottomNavScreen();
      },
    );
  }
}
