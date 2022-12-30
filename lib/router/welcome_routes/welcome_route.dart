import 'package:app/screens/welcome_screen/welcome_screen.dart';
import 'package:go_router/go_router.dart';

final welcomeRoute = [
  GoRoute(
    path: '/',
    builder: (context, state) => const WelcomeScreen(),
  )
];
