import 'package:codesroots/features/product_api/data/model/product_model.dart';

abstract class ProductsState {}

class ProductsLInitiaState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final  List<ProductModel> ? product;

  ProductsSuccessState({this.product});
}

class ProductsFailurState extends ProductsState {
  final String error;

  ProductsFailurState({required this.error});
}
