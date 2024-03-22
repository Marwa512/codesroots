import 'package:codesroots/core/colors.dart';
import 'package:codesroots/features/product_api/data/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_style.dart';

Widget productWidget(ProductModel product) {
  return Container(
    height: 120,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:lightGrey),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
            width: 50,
            child: Image(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/shopping-supermarket-cart-with-grocery-pictogram_1284-11697.jpg?t=st=1711063002~exp=1711066602~hmac=7255cc8326373e026328aaa2187443515733f4fe92b23ba0dac3c1849064b211&w=740")),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 100,
            child: Column(
              children: [
                TextWidget(
                  title: " ${product.nameAr}",
                ),
                
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
