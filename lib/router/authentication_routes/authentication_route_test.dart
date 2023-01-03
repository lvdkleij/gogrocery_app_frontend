import 'package:app/router/authentication_routes/authentication_route.dart';
import 'package:app/router/constants.dart';
import 'package:app/screens/authentication/login_with_email_screen/login_with_email_screen.dart';
import 'package:app/screens/authentication/login_with_email_verify_screen/login_with_email_verify_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  test('authenticationRoutes', () {
    const Map<String, Type> expectedRoutes = {
      '/login_with_email': CustomTransitionPage<LoginWithEmailScreen>,
      '/login_with_email_verify': RouteBuilderType<LoginWithEmailVerifyScreen>,
    };

    expect(authenticationRoutes.length, expectedRoutes.length);

    final loginWithEmailRoute = authenticationRoutes[0];

    expect(loginWithEmailRoute.path, '/login_with_email');
    // expect(loginWithEmailRoute.pageBuilder.runtimeType,
    //     CustomTransitionPage<LoginWithEmailScreen>);

    final loginWithEmailVerify = authenticationRoutes[1];

    expect(loginWithEmailVerify.path, '/login_with_email_verify');
    expect(loginWithEmailVerify.builder.runtimeType,
        RouteBuilderType<LoginWithEmailVerifyScreen>);
  });
}
