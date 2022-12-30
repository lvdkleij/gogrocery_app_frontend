import 'package:app/screens/authentication/login_with_email_screen/login_with_email_screen.dart';
import 'package:app/screens/authentication/login_with_email_verify_screen/login_with_email_verify_screen.dart';
import 'package:go_router/go_router.dart';

final authenticationRoutes = [
  GoRoute(
    path: '/login_with_email',
    builder: (context, state) => const LoginWithEmailScreen(),
  ),
  GoRoute(
    path: '/login_with_email_verify',
    builder: (context, state) => const LoginWithEmailVerifyScreen(),
  )
];
