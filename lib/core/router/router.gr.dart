// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:xozmag_admin/features/auth/ui/login_screen.dart' as _i4;
import 'package:xozmag_admin/features/catalogs/domain/entities/category.dart'
    as _i10;
import 'package:xozmag_admin/features/catalogs/ui/pages/categories_screen.dart'
    as _i1;
import 'package:xozmag_admin/features/catalogs/ui/pages/create_category_screen.dart'
    as _i2;
import 'package:xozmag_admin/features/catalogs/ui/pages/subcategories_screen.dart'
    as _i7;
import 'package:xozmag_admin/features/products/presentation/create_product/create_product_screen.dart'
    as _i3;
import 'package:xozmag_admin/features/products/presentation/create_product/product_description_editor.dart'
    as _i5;
import 'package:xozmag_admin/features/products/presentation/products_list/products_screen.dart'
    as _i6;

/// generated route for
/// [_i1.CategoriesScreen]
class CategoriesRoute extends _i8.PageRouteInfo<void> {
  const CategoriesRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateCategoryScreen]
class CreateCategoryRoute extends _i8.PageRouteInfo<void> {
  const CreateCategoryRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CreateCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateCategoryRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateCategoryScreen();
    },
  );
}

/// generated route for
/// [_i3.CreateProductScreen]
class CreateProductRoute extends _i8.PageRouteInfo<void> {
  const CreateProductRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CreateProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProductRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateProductScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.ProductDescriptionEditorScreen]
class ProductDescriptionEditorRoute extends _i8.PageRouteInfo<void> {
  const ProductDescriptionEditorRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProductDescriptionEditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDescriptionEditorRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProductDescriptionEditorScreen();
    },
  );
}

/// generated route for
/// [_i6.ProductsScreen]
class ProductsRoute extends _i8.PageRouteInfo<void> {
  const ProductsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProductsScreen();
    },
  );
}

/// generated route for
/// [_i7.SubcategoriesScreen]
class SubcategoriesRoute extends _i8.PageRouteInfo<SubcategoriesRouteArgs> {
  SubcategoriesRoute({
    _i9.Key? key,
    required _i10.Category category,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          SubcategoriesRoute.name,
          args: SubcategoriesRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'SubcategoriesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubcategoriesRouteArgs>();
      return _i7.SubcategoriesScreen(
        key: args.key,
        category: args.category,
      );
    },
  );
}

class SubcategoriesRouteArgs {
  const SubcategoriesRouteArgs({
    this.key,
    required this.category,
  });

  final _i9.Key? key;

  final _i10.Category category;

  @override
  String toString() {
    return 'SubcategoriesRouteArgs{key: $key, category: $category}';
  }
}
