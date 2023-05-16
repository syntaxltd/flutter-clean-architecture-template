import 'package:auto_route/auto_route.dart';
import 'package:presentation/src/common/routes/router.gr.dart';

export 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: LoginRoute.page, path: '/'),
    AutoRoute(page: ArticleListRoute.page),
    AutoRoute(page: ArticleDetailRoute.page),
  ];
}
