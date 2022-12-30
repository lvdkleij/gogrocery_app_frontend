import 'package:app/router/authentication_routes/authentication_route.dart';
import 'package:app/router/welcome_routes/welcome_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ...welcomeRoute,
    ...authenticationRoutes,
  ],
);
