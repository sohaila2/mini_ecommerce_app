import 'package:ecommerce_app/features/product/data/models/product_model.dart';

import '../../../../core/di/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/product_repo.dart';

part 'product_cubit.freezed.dart';

@freezed
class ProductState<T> with _$ProductState<T> {
  const factory ProductState.initial() = Initial;
  const factory ProductState.loading() = Loading;
  const factory ProductState.success(T data) = Success;
  const factory ProductState.toggleFavorites() = ToggleFavorites;

  const factory ProductState.error({required String error}) = Error;
}

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit({required this.repository})
      : super(const ProductState.initial());

  static ProductCubit get get => getIt();
  static ProductCubit of(BuildContext context) => context.read<ProductCubit>();

  List<ProductModel> productList = [];

  // Fetch products
  Future<void> getProducts() async {
    emit(const ProductState.loading());

    final result = await repository.getProducts();

    result.when(
      success: (data) {
        productList = data;
        emit(ProductState.success(productList));
      },
      failure: (error) {
        emit(ProductState.error(
          error: error.apiErrorModel.message ?? '',
        ));
      },
    );
  }

  void toggleFavorite(ProductModel product) {
    productList = productList.map((p) {
      if (p.id == product.id) {
        return p.copyWith(isFavorite: !p.isFavorite);
      }
      return p;
    }).toList();

    emit(ProductState.success(productList));
  }

  bool isFavorite(ProductModel product) {
    return productList.firstWhere((p) => p.id == product.id).isFavorite;
  }

  List<ProductModel> get favoriteProducts =>
      productList.where((p) => p.isFavorite).toList();
}
