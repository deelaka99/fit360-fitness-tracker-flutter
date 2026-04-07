import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'ui/auth/welcome_screen.dart';
import 'ui/auth/login_screen.dart';
import 'ui/auth/register_screen.dart';
import 'ui/main/main_layout.dart';
import 'ui/food/food_tracker_screen.dart';
import 'ui/water/water_tracker_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Wait for firebase configuration file to be added
  // await Firebase.initializeApp();
  runApp(const ProviderScope(child: Fit360App()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const MainLayout()),
    GoRoute(
      path: '/food',
      builder: (context, state) => const FoodTrackerScreen(),
    ),
    GoRoute(
      path: '/water',
      builder: (context, state) => const WaterTrackerScreen(),
    ),
  ],
);

class Fit360App extends StatelessWidget {
  const Fit360App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fit360',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
