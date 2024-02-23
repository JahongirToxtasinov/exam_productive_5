import 'package:exam_productive_5/core/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'assets/constants/routes.dart';
import 'assets/theme/theme.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';

void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => AuthenticatedBloc(),
          ),
        ],
      child : MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      home: const SplashScreen(),
    onGenerateRoute: RouteGenerator.onGenerateRoute,
  ),);
}
