import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/cards/product_card.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/cart/data/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
              backgroundColor: UColors.backgroundColor,
        toolbarHeight: 40,
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: products.map((product) {
              return UProductCard(product: product);
            }).toList(),
          ),
        ),
      ),
    );
  }
}


