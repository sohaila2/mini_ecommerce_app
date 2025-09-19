import 'package:dio/dio.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/dio_client.dart';

class ProductApi {
  final DioClient dioClient;
  ProductApi({required this.dioClient});

  Future<Response> getProducts() async {
    return await dioClient.get(ApiConstants.products);
  }

  Future<Response> getCategories() async {
    return await dioClient.get(ApiConstants.categories);
  }
}
