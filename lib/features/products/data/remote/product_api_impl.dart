
import 'package:xozmag_admin/features/catalogs/data/dto/base_success_response.dart';
import 'package:xozmag_admin/features/products/data/dto/create_product_dto.dart';
import 'package:xozmag_admin/features/products/data/remote/product_api.dart';
import 'package:xozmag_admin/features/products/data/request/create_product_params.dart';

import '../../../../core/network/api_service.dart';

class ProductApiImpl extends ProductApi {
  final ApiService network;

  ProductApiImpl(this.network);

  @override
  Future<BaseSuccessResponse> addFavorite(String productId) {
    return network.post(
        "api/favorite",
        tFromJson: BaseSuccessResponse.fromJson);
  }

  @override
  Future<CreateProductDto> createProduct(CreateProductParams params) {
    return network.post(
        "api/v1/admin/product",
        data: params.toJson(),
        tFromJson: CreateProductDto.fromJson);
  }
}