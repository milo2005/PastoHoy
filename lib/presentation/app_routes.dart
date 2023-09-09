import 'package:go_router/go_router.dart';
import 'package:pasto_hoy/presentation/home/home_page.dart';

import 'login/login_page.dart';

final appRouter = GoRouter(initialLocation: "/login", routes: [
  GoRoute(
    path: "/login",
    builder: (ctx, state) => const LoginPage(),
  ),
  GoRoute(
      path: "/home",
      builder: (ctx, state)=> const HomePage(),
  )
]);
