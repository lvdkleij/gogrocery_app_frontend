import 'package:app/router/authentication_routes/authentication_route.dart';
import 'package:app/router/constants.dart';
import 'package:app/screens/authentication/login_with_email_screen/login_with_email_screen.dart';
import 'package:app/screens/authentication/login_with_email_verify_screen/login_with_email_verify_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('authenticationRoutes', () {
    const Map<String, Type> expectedRoutes = {
      '/login_with_email': RouteBuilderType<LoginWithEmailScreen>,
      '/login_with_email_verify': RouteBuilderType<LoginWithEmailVerifyScreen>,
    };

    expect(authenticationRoutes.length, expectedRoutes.length);

    expectedRoutes.forEach((path, builderRunTimeType) {
      final actualRoute = authenticationRoutes
          .where((actualRoute_) => actualRoute_.path == path);

      expect(actualRoute.length, 1);
      expect(actualRoute.first.builder.runtimeType, builderRunTimeType);
    });
  });
}
