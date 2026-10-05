import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/features/category/domain/entities/category_entities.dart';
import 'package:e_commrece_app/features/category/domain/repo/category_repository.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepo) : super(CategoryInitial());

  final CategoryRepository _categoryRepo;

  Future<void> getCategories() async {
    emit(CategoryLoading());
    await Future.delayed(const Duration(seconds: 3));
    final result = await _categoryRepo.getCategories();

    result.fold(
      (failure) => emit(CategoryFailure(failure.message)),
      (categories) => emit(CategorySuccess(categories)),
    );
  }
}
