import 'package:xozmag_admin/features/catalogs/data/dto/sub_category_dto.dart';
import 'package:xozmag_admin/features/catalogs/data/remote/subCategory/sub_category_api.dart';
import 'package:xozmag_admin/features/catalogs/data/request/subCategory/create_sub_category_params.dart';
import '../../../../../core/network/api_service.dart';
import '../../dto/base_success_response.dart';
import '../../request/subCategory/update_sub_category_params.dart';

class SubCategoryApiImpl extends SubCategoryApi {
  final ApiService network;

  SubCategoryApiImpl(this.network);

  @override
  Future<List<SubCategoryDto>> getSubCategoryList(String id) {
    return network.get(
      "api/v1/admin/subcategory/$id",
      tFromJson: SubCategoryDto.fromJson,
    );
  }

  @override
  Future<BaseSuccessResponse> createSubCategory(
      CreateSubCategoryParams params) {
    return network.post("api/v1/admin/subcategory",
        data: params.toJson(), tFromJson: BaseSuccessResponse.fromJson);
  }

  @override
  Future<BaseSuccessResponse> updateSubCategory(
      UpdateSubCategoryParams params, String id) {
    return network.put("api/v1/admin/subcategory/$id",
        data: params.toJson(), tFromJson: BaseSuccessResponse.fromJson);
  }

  @override
  Future<BaseSuccessResponse> deleteSubCategory(String id) {
    return network.delete("api/v1/admin/subcategory/$id",
        tFromJson: BaseSuccessResponse.fromJson);
  }
}
