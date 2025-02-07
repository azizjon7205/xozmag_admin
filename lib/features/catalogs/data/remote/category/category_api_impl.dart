import 'package:xozmag_admin/core/network/api_service.dart';

import '../../dto/base_success_response.dart';
import '../../dto/category_dto.dart';
import '../../request/category/create_category_params.dart';
import '../../request/category/update_category_params.dart';
import 'category_api.dart';

class CategoryApiImpl extends CategoryApi {
  final ApiService network;

  CategoryApiImpl(this.network);

  @override
  Future<List<CategoryDTO>> getCategoryList() {
    return network.get(
      "api/v1/admin/category",
      tFromJson: CategoryDTO.fromJson,
    );
  }

  @override
  Future<BaseSuccessResponse> createCategory(CreateCategoryParams params) {
    return network.post("api/v1/admin/category",
        data: params.toJson(), tFromJson: BaseSuccessResponse.fromJson);
  }

  @override
  Future<BaseSuccessResponse> updateCategory(
      UpdateCategoryParams params, String id) {
    return network.put("api/v1/admin/category/$id",
        data: params.toJson(), tFromJson: BaseSuccessResponse.fromJson);
  }

  @override
  Future<BaseSuccessResponse> deleteCategory(String id) {
    return network.delete("api/v1/admin/category/$id",
        tFromJson: BaseSuccessResponse.fromJson);
  }
}
