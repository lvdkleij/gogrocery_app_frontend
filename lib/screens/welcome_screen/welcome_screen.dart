import 'package:app/assets/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              child: const _LoginButtons(),
            ),
          ],
        ));
  }
}

class _LoginButtons extends StatelessWidget {
  const _LoginButtons({super.key});

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
          onTap: () => context.go('/login_with_email'),
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
    return Ink(
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            if (elevation)
              const BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          highlightColor: hideFocus ? Colors.transparent : null,
          splashColor: hideFocus ? Colors.transparent : null,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (svgLabel != null) ...[
                  SizedBox(
                      height: 19, width: 19, child: svgPictures[svgLabel]!),
                  const SizedBox(width: 12)
                ],
                Text(text,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700))
              ]),
        ));
  }
}
