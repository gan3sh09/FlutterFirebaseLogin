import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/firebase_options.dart';
import 'package:loginapp/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';
import 'package:loginapp/src/features/authentication/screens/forget_password/forget_password_mail/email_sent_notify_screen.dart';
import 'package:loginapp/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:loginapp/src/features/authentication/screens/forget_password/forget_password_otp/forget_password_otp.dart';
import 'package:loginapp/src/features/authentication/screens/forget_password/forget_password_phone/forget_password_phone.dart';
import 'package:loginapp/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:loginapp/src/features/authentication/screens/signin_with_phone/signin_phone_screen.dart';
import 'package:loginapp/src/features/authentication/screens/signup_screen/layout/email_verify_screen.dart';
import 'package:loginapp/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:loginapp/src/features/authentication/screens/wrapper/wrapper.dart';
import 'package:loginapp/src/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MyApp(),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: AAppTheme.lightTheme,
            darkTheme: AAppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: 'wrapper',
            routes: {
              'wrapper': (context) => const Wrapper(),
              'login': (context) => const LoginScreen(),
              'signup': (context) => const SignupScreen(),
              'forgetemail': (context) => const ForgetPasswordMail(),
              'forgetphone': (context) => const ForgetPasswordPhone(),
              'emailsentnotify': (context) => const EmailSentNotifyScreen(),
              'emailverify': (context) => const EmailVerifyScreen(),
              'otpscreen': (context) => const ForgetPasswordOtp(),
              'signinphone': (context) => const SigninPhoneScreen(),
              'dashboard': (context) => const DashboardScreen(),
            },
          );
        },
      );
}
