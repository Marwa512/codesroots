import 'package:codesroots/features/product_api/data/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/dataresources/graph_ql.dart';
import '../../presentation/bloc/product_states.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLInitiaState());
  static ProductsCubit get(context) => BlocProvider.of(context);
  final GraphQl _grapgQl = GetIt.I<GraphQl>();
  List<ProductModel> productModel = [];
  Future<void> getData({
    String? categoryId,
  }) async {
    productModel = [];
    emit(ProductsLoadingState());
    _grapgQl.getData(categoryId: categoryId).then((value) {
      for (int i = 0; i < value!.length; i++) {
        productModel.add(ProductModel.fromJson(value["products"][i]));
      }
      emit(ProductsSuccessState(product: productModel));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ProductsFailurState(error: error.toString()));
    });
  }
}
