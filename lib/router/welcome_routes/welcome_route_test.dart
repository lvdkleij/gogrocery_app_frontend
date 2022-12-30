import 'package:app/router/constants.dart';
import 'package:app/router/welcome_routes/welcome_route.dart';
import 'package:app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('welcomeRoute has correct path and builder', () {
    expect(welcomeRoute.length, 1);
    expect(welcomeRoute[0].path, '/');
    expect(
        welcomeRoute[0].builder.runtimeType, RouteBuilderType<WelcomeScreen>);
  });
}
