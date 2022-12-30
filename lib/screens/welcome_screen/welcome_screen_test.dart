import 'package:app/assets/svg.dart';
import 'package:app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LoginButton has correct default values', () {
    final loginButton = LoginButton(onTap: () {}, text: 'text');
    expect(loginButton.elevation, true);
    expect(loginButton.hideFocus, false);
    expect(loginButton.backgroundColor, Colors.transparent);
    expect(loginButton.svgLabel, null);
  });

  test('LoginButton has correct custom values', () {
    final loginButton = LoginButton(
      onTap: () {},
      text: 'text',
      backgroundColor: Colors.black,
      elevation: false,
      hideFocus: true,
      svgLabel: SvgLabels.googleLogo,
    );

    expect(loginButton.text, 'text');
    expect(loginButton.backgroundColor, Colors.black);
    expect(loginButton.elevation, false);
    expect(loginButton.hideFocus, true);
    expect(loginButton.svgLabel, SvgLabels.googleLogo);
  });

  testWidgets('LoginButton has correct text and svg', (tester) async {
    final loginButton = LoginButton(
        onTap: () {},
        text: 'login',
        svgLabel: SvgLabels.appleLogo,
        backgroundColor: Colors.black);

    await tester.pumpWidget(MaterialApp(home: loginButton));

    final textFinder = find.text('login');
    final svgFinder = find.byType(SvgPicture);
    expect(textFinder, findsOneWidget);
    expect(svgFinder, findsOneWidget);
  });
}
