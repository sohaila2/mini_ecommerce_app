import '../../../../core/di/dependency_injection.dart';
import '../../data/models/category_model.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/data/repos/product_repo.dart';

part 'category_cubit.freezed.dart';

@freezed
class CategoryState<T> with _$CategoryState<T> {
  const factory CategoryState.initial() = Initial;
  const factory CategoryState.loading() = Loading;
  const factory CategoryState.success(T data) = Success;
  const factory CategoryState.error({required String error}) = Error;
}

class CategoryCubit extends Cubit<CategoryState> {
  final ProductRepository repository;

  CategoryCubit({required this.repository})
      : super(const CategoryState.initial());

  static CategoryCubit get get => getIt();
  static CategoryCubit of(BuildContext context) =>
      context.read<CategoryCubit>();
  List<CategoryModel> categoryList = [];

  Future<void> getCategories() async {
    emit(const CategoryState.loading());

    final result = await repository.getCategories();

    result.when(
      success: (data) {
        categoryList = data;

        emit(CategoryState.success(data));
      },
      failure: (error) {
        emit(CategoryState.error(
          error: error.apiErrorModel.message ?? '',
        ));
      },
    );
  }
}
