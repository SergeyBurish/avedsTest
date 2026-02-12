import 'package:auto_route/auto_route.dart';
import 'package:aveds_test/features/auth/presentation/auth_screen.dart';
import 'package:aveds_test/features/home/presentation/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: HomeRoute.page,
    ),
    AutoRoute(
      page: AuthRoute.page,
    ),
  ];
}