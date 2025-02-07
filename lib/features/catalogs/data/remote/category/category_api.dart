import '../../dto/base_success_response.dart';
import '../../dto/category_dto.dart';
import '../../request/category/create_category_params.dart';
import '../../request/category/update_category_params.dart';

abstract class CategoryApi {
  Future<List<CategoryDTO>> getCategoryList();

  Future<BaseSuccessResponse> createCategory(CreateCategoryParams params);

  Future<BaseSuccessResponse> updateCategory(
      UpdateCategoryParams params, String id);

  Future<BaseSuccessResponse> deleteCategory(String id);
}
