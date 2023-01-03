import 'package:app/providers/internal_api/internal_api_client.dart';
import 'package:app/providers/user_session/user_session.dart';
import 'package:app/widgets/top_navigation_bar/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginWithEmailScreen();
}

class _LoginWithEmailScreen extends State<LoginWithEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const TopNavigationToolbar(),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Your email address',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 28),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Enter your email address. We will send a code to verify it\'s you',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey),
                      )
                    ]),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 85,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                suffixIcon: ImageButtonSl(
                                    icon: const Icon(Icons.clear,
                                        color: Colors.grey, size: 18),
                                    onTap: () => emailController.clear()),
                                border: OutlineInputBorder(),
                                hintText: 'Email'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final email = emailController.text;
                              var response = await context
                                  .read<InternalApiClient>()
                                  .userService
                                  .loginWithEmail(email: email)
                                  .then((value) {
                                context
                                    .read<UserSessionProvider>()
                                    .setUserSession(email: email);
                              });
                            }
                          },
                          child: Text('Continue'),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      TopNavigationToolbar(
        startActions: [
          const SizedBox(width: 20),
          ImageButtonSl(
              icon: const Icon(Icons.close, color: Colors.grey, size: 24),
              onTap: () {
                context.pop();
              })
        ],
      )
    ]));
  }
}
