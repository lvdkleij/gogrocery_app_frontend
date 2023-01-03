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
    expect(loginButton.textColor, Colors.black);
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
      textColor: Colors.red,
      svgLabel: SvgLabels.googleLogo,
    );

    expect(loginButton.text, 'text');
    expect(loginButton.backgroundColor, Colors.black);
    expect(loginButton.textColor, Colors.red);
    expect(loginButton.elevation, false);
    expect(loginButton.hideFocus, true);
    expect(loginButton.svgLabel, SvgLabels.googleLogo);
  });

  testWidgets('LoginButtons contains apple, google and email login buttons',
      (tester) async {
    const loginButtons = LoginButtons();

    await tester.pumpWidget(const MaterialApp(home: loginButtons));

    final buttonsFinder = find.byType(LoginButton);
    expect(buttonsFinder, findsNWidgets(3));

    final googleLoginButton = tester.widget<LoginButton>(buttonsFinder.at(0));

    expect(googleLoginButton.text, 'Continue with Google');
    expect(googleLoginButton.svgLabel, SvgLabels.googleLogo);
    expect(googleLoginButton.backgroundColor, Colors.white);
    expect(googleLoginButton.elevation, false);

    final appleLoginButton = tester.widget<LoginButton>(buttonsFinder.at(1));

    expect(appleLoginButton.text, 'Continue with Apple');
    expect(appleLoginButton.svgLabel, SvgLabels.appleLogo);
    expect(appleLoginButton.backgroundColor, Colors.white);
    expect(appleLoginButton.elevation, false);

    final emailLoginbutton = tester.widget<LoginButton>(buttonsFinder.at(2));

    expect(emailLoginbutton.text, 'Continue with email');
    expect(emailLoginbutton.svgLabel, null);
    expect(emailLoginbutton.backgroundColor, Colors.transparent);
    expect(emailLoginbutton.elevation, false);
    expect(emailLoginbutton.textColor, Colors.white);
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
