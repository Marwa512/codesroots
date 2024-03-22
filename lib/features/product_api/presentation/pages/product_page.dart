import 'package:codesroots/core/widgets/text_style.dart';
import 'package:codesroots/features/product_api/presentation/bloc/product_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_cubit.dart';
import '../widgets/product_widget.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const TextWidget(title: "Browse Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  ProductsCubit.get(context).getData(categoryId: value);
                },
                decoration: InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                  buildWhen: (_, state) =>
                      state is ProductsLoadingState ||
                      state is ProductsSuccessState ||
                      state is ProductsFailurState,
                  builder: (_, state) {
                    return ConditionalBuilder(
                        condition: state is! ProductsLoadingState,
                        builder: (context) {
                          return ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return productWidget(ProductsCubit.get(context)
                                  .productModel[index]);
                            },
                            itemCount:
                                ProductsCubit.get(context).productModel.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 5,
                            ),
                          );
                        },
                        fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
