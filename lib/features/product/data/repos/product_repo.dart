import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/error_handling/api_error_handler.dart';
import '../apis/product_apis.dart';
import '../../../category/data/models/category_model.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ProductApi api;
  ProductRepository({required this.api});

  Future<ApiResult<List<ProductModel>>> getProducts() async {
    try {
      final response = await api.getProducts();
      final data = response.data as List;
      final products = data.map((json) => ProductModel.fromJson(json)).toList();
      return ApiResult.success(products);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    try {
      final response = await api.getCategories();
      final data = response.data as List;
      final categories =
          data.map((json) => CategoryModel.fromJson(json)).toList();
      return ApiResult.success(categories);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
