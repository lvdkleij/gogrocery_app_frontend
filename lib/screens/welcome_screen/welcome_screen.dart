import 'package:app/assets/svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              color: Colors.green[300],
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/welcome_image.jpg',
                  )),
            )),
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(stops: [
              0,
              0.65,
              1
            ], colors: [
              Colors.white,
              Colors.transparent,
              Colors.black
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
            Positioned(
                top: viewPadding.top + 32,
                left: 0,
                right: 0,
                child: const Center(
                  child: Text(
                    'GoGrocery',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                )),
            Positioned(
              bottom: viewPadding.bottom + 16,
              left: 42,
              right: 42,
              child: const LoginButtons(),
            ),
          ],
        ));
  }
}

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginButton(
            text: 'Continue with Google',
            backgroundColor: Colors.white,
            svgLabel: SvgLabels.googleLogo,
            elevation: false,
            onTap: () {}),
        const SizedBox(height: 18),
        LoginButton(
            text: 'Continue with Apple',
            backgroundColor: Colors.white,
            svgLabel: SvgLabels.appleLogo,
            elevation: false,
            onTap: () {}),
        const SizedBox(height: 14),
        LoginButton(
          text: 'Continue with email',
          onTap: () => context.push('/login_with_email'),
          textColor: Colors.white,
          hideFocus: true,
          elevation: false,
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool hideFocus;
  final SvgLabels? svgLabel;
  final bool elevation;
  final Color textColor;

  const LoginButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.svgLabel,
      this.elevation = true,
      this.textColor = Colors.black,
      this.hideFocus = false,
      this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        elevation: elevation ? 4 : 0,
        child: Ink(
            height: 46,
            child: InkWell(
                onTap: onTap,
                highlightColor: hideFocus ? Colors.transparent : null,
                splashColor: hideFocus ? Colors.transparent : null,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  if (svgLabel != null) ...[
                    SizedBox(
                        height: 19, width: 19, child: svgPictures[svgLabel]!),
                    const SizedBox(width: 12)
                  ],
                  Text(text,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.w700))
                ]))));
  }
}
