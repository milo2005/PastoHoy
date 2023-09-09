import 'package:go_router/go_router.dart';
import 'package:pasto_hoy/presentation/pages/login/login_page.dart';

final appRouter =  GoRouter(
    initialLocation: "/login",
    routes: [
      GoRoute(path: "/login", builder: (ctx, state)=> const LoginPage())
    ]
);