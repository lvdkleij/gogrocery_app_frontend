import 'package:app/screens/authentication/login_with_email_screen/login_with_email_screen.dart';
import 'package:app/screens/authentication/login_with_email_verify_screen/login_with_email_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final authenticationRoutes = [
  GoRoute(
      path: '/login_with_email',
      pageBuilder: (context, state) =>
          CustomTransitionPage<LoginWithEmailScreen>(
              key: state.pageKey,
              child: const LoginWithEmailScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: const Offset(0, 1), end: Offset.zero)
                    .animate(animation);

                return SlideTransition(position: tween, child: child);
              })),
  GoRoute(
    path: '/login_with_email_verify',
    builder: (context, state) => const LoginWithEmailVerifyScreen(),
  )
];
