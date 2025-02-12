// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:xozmag_admin/features/auth/ui/login_screen.dart' as _i6;
import 'package:xozmag_admin/features/catalogs/domain/entities/category.dart'
    as _i18;
import 'package:xozmag_admin/features/catalogs/ui/pages/categories_screen.dart'
    as _i1;
import 'package:xozmag_admin/features/catalogs/ui/pages/create_category_screen.dart'
    as _i2;
import 'package:xozmag_admin/features/catalogs/ui/pages/subcategories_screen.dart'
    as _i15;
import 'package:xozmag_admin/features/customer/ui/details/pages/customer_details_screen.dart'
    as _i4;
import 'package:xozmag_admin/features/home/ui/home_screen.dart' as _i5;
import 'package:xozmag_admin/features/main_screen.dart' as _i7;
import 'package:xozmag_admin/features/orders/ui/order_details/pages/order_details_screen.dart'
    as _i8;
import 'package:xozmag_admin/features/orders/ui/orders_list/pages/orders_filter_screen.dart'
    as _i9;
import 'package:xozmag_admin/features/orders/ui/orders_list/pages/orders_screen.dart'
    as _i10;
import 'package:xozmag_admin/features/products/presentation/create_product/create_product_screen.dart'
    as _i3;
import 'package:xozmag_admin/features/products/presentation/create_product/product_description_editor.dart'
    as _i11;
import 'package:xozmag_admin/features/products/presentation/products_list/products_screen.dart'
    as _i12;
import 'package:xozmag_admin/features/settings/ui/settings_screen.dart' as _i13;
import 'package:xozmag_admin/features/staff/ui/pages/staff_screen.dart' as _i14;

/// generated route for
/// [_i1.CategoriesScreen]
class CategoriesRoute extends _i16.PageRouteInfo<void> {
  const CategoriesRoute({List<_i16.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateCategoryScreen]
class CreateCategoryRoute extends _i16.PageRouteInfo<void> {
  const CreateCategoryRoute({List<_i16.PageRouteInfo>? children})
    : super(CreateCategoryRoute.name, initialChildren: children);

  static const String name = 'CreateCategoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateCategoryScreen();
    },
  );
}

/// generated route for
/// [_i3.CreateProductScreen]
class CreateProductRoute extends _i16.PageRouteInfo<void> {
  const CreateProductRoute({List<_i16.PageRouteInfo>? children})
    : super(CreateProductRoute.name, initialChildren: children);

  static const String name = 'CreateProductRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateProductScreen();
    },
  );
}

/// generated route for
/// [_i4.CustomerDetailsScreen]
class CustomerDetailsRoute extends _i16.PageRouteInfo<void> {
  const CustomerDetailsRoute({List<_i16.PageRouteInfo>? children})
    : super(CustomerDetailsRoute.name, initialChildren: children);

  static const String name = 'CustomerDetailsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.CustomerDetailsScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainScreen();
    },
  );
}

/// generated route for
/// [_i8.OrderDetailsScreen]
class OrderDetailsRoute extends _i16.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i17.Key? key,
    String orderId = '',
    List<_i16.PageRouteInfo>? children,
  }) : super(
         OrderDetailsRoute.name,
         args: OrderDetailsRouteArgs(key: key, orderId: orderId),
         rawQueryParams: {'orderId': orderId},
         initialChildren: children,
       );

  static const String name = 'OrderDetailsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<OrderDetailsRouteArgs>(
        orElse:
            () => OrderDetailsRouteArgs(
              orderId: queryParams.getString('orderId', ''),
            ),
      );
      return _i8.OrderDetailsScreen(key: args.key, orderId: args.orderId);
    },
  );
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, this.orderId = ''});

  final _i17.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i9.OrdersFilterScreen]
class OrdersFilterRoute extends _i16.PageRouteInfo<void> {
  const OrdersFilterRoute({List<_i16.PageRouteInfo>? children})
    : super(OrdersFilterRoute.name, initialChildren: children);

  static const String name = 'OrdersFilterRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.OrdersFilterScreen();
    },
  );
}

/// generated route for
/// [_i10.OrdersScreen]
class OrdersRoute extends _i16.PageRouteInfo<void> {
  const OrdersRoute({List<_i16.PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.OrdersScreen();
    },
  );
}

/// generated route for
/// [_i11.ProductDescriptionEditorScreen]
class ProductDescriptionEditorRoute extends _i16.PageRouteInfo<void> {
  const ProductDescriptionEditorRoute({List<_i16.PageRouteInfo>? children})
    : super(ProductDescriptionEditorRoute.name, initialChildren: children);

  static const String name = 'ProductDescriptionEditorRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProductDescriptionEditorScreen();
    },
  );
}

/// generated route for
/// [_i12.ProductsScreen]
class ProductsRoute extends _i16.PageRouteInfo<void> {
  const ProductsRoute({List<_i16.PageRouteInfo>? children})
    : super(ProductsRoute.name, initialChildren: children);

  static const String name = 'ProductsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProductsScreen();
    },
  );
}

/// generated route for
/// [_i13.SettingsScreen]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i14.StaffScreen]
class StaffRoute extends _i16.PageRouteInfo<void> {
  const StaffRoute({List<_i16.PageRouteInfo>? children})
    : super(StaffRoute.name, initialChildren: children);

  static const String name = 'StaffRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.StaffScreen();
    },
  );
}

/// generated route for
/// [_i15.SubcategoriesScreen]
class SubcategoriesRoute extends _i16.PageRouteInfo<SubcategoriesRouteArgs> {
  SubcategoriesRoute({
    _i17.Key? key,
    required _i18.Category category,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         SubcategoriesRoute.name,
         args: SubcategoriesRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'SubcategoriesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubcategoriesRouteArgs>();
      return _i15.SubcategoriesScreen(key: args.key, category: args.category);
    },
  );
}

class SubcategoriesRouteArgs {
  const SubcategoriesRouteArgs({this.key, required this.category});

  final _i17.Key? key;

  final _i18.Category category;

  @override
  String toString() {
    return 'SubcategoriesRouteArgs{key: $key, category: $category}';
  }
}
