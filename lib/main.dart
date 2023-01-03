import 'package:app/providers/internal_api/internal_api_client.dart';
import 'package:app/providers/user_session/user_session.dart';
import 'package:app/providers/user_shopping_list/user_shopping_list.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSessionProvider.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      // ChangeNotifierProvider(create: (context) => ThemeModel()),
      ChangeNotifierProvider(create: (context) => UserShoppingListProvider()),
      ChangeNotifierProvider(create: (context) => UserSessionProvider()),
      Provider(create: (context) => InternalApiClient(context))
    ], child: MaterialApp.router(routerConfig: router));
  }
}
