import 'package:xozmag_admin/features/catalogs/data/request/subCategory/create_sub_category_params.dart';
import 'package:xozmag_admin/features/catalogs/data/request/subCategory/update_sub_category_params.dart';

import '../../dto/base_success_response.dart';
import '../../dto/sub_category_dto.dart';

abstract class SubCategoryApi {
  Future<List<SubCategoryDto>> getSubCategoryList(String id);

  Future<BaseSuccessResponse> createSubCategory(CreateSubCategoryParams params);

  Future<BaseSuccessResponse> updateSubCategory(
      UpdateSubCategoryParams params, String id);

  Future<BaseSuccessResponse> deleteSubCategory(String id);
}
