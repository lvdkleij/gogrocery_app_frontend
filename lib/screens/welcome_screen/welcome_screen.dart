import 'package:app/assets/svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPaddingBottom = MediaQuery.of(context).viewPadding.bottom + 16;

    return Material(
        color: Colors.green[400],
        child: Stack(
          children: [
            Positioned(
              bottom: viewPaddingBottom,
              left: 32,
              right: 32,
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
            onTap: () {}),
        const SizedBox(height: 14),
        LoginButton(
            text: 'Continue with Apple',
            backgroundColor: Colors.white,
            svgLabel: SvgLabels.appleLogo,
            onTap: () {}),
        const SizedBox(height: 14),
        LoginButton(
          text: 'Continue with email',
          onTap: () => context.push('/login_with_email'),
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
  const LoginButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.svgLabel,
      this.elevation = true,
      this.hideFocus = false,
      this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        elevation: elevation ? 4 : 0,
        child: Ink(
            height: 50,
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
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700))
                ]))));
  }
}
