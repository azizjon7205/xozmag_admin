import 'package:xozmag_admin/features/catalogs/data/dto/base_success_response.dart';
import 'package:xozmag_admin/features/products/data/request/create_product_params.dart';
import '../dto/create_product_dto.dart';

abstract class ProductApi {
  Future<CreateProductDto> createProduct(CreateProductParams params);
  Future<BaseSuccessResponse> addFavorite(String productId);
}