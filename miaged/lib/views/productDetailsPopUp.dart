import 'package:flutter/material.dart';
import 'productDetails.dart';

class ProductDetailPopup extends StatelessWidget {
  const ProductDetailPopup({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ProductDetail(productId: productId),
      ),
    );
  }
}
