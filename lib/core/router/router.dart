import 'package:auto_route/auto_route.dart';
import '/core/router/router.gr.dart';

AppRouter navController = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: CategoriesRoute.page, initial: false),
    AutoRoute(page: SubcategoriesRoute.page, initial: false),
    AutoRoute(page: CreateCategoryRoute.page),
    AutoRoute(page: CreateProductRoute.page,initial: false),
    AutoRoute(page: ProductDescriptionEditorRoute.page),
    AutoRoute(page: ProductsRoute.page, initial: false),
  ];
}