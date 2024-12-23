import 'package:auto_route/auto_route.dart';
import '/core/router/router.gr.dart';

AppRouter navController = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: false),
    AutoRoute(page: CategoriesRoute.page),
    AutoRoute(page: SubcategoriesRoute.page),
    AutoRoute(page: CreateCategoryRoute.page),
    AutoRoute(page: CreateProductRoute.page),
    AutoRoute(page: ProductDescriptionEditorRoute.page),
    AutoRoute(page: ProductsRoute.page),
    AutoRoute(page: StaffRoute.page),
    AutoRoute(page: OrdersRoute.page, initial: true),
    AutoRoute(page: OrdersFilterRoute.page),
  ];
}