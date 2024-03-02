import 'package:go_router/go_router.dart';
import 'package:wasally/core/routing/app_routes.dart';
import 'package:wasally/features/splash/presentation/view/splash_view.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(routes: [
    GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) {
          return const SplashView();
        })
  ]);
}
