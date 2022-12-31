import 'package:app/widgets/top_navigation_bar/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(children: [
      TopNavigationToolbar(
        startActions: [
          const SizedBox(width: 12),
          ImageButtonSl(
            icon: Icons.chevron_left,
            onTap: () {
              context.pop();
            },
          )
        ],
      )
    ]));
  }
}
