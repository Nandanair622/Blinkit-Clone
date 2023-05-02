import 'package:blinkit/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String productName;

  const ProductDetails(
      {Key? key,
        required this.productName, 

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Text('Product details for $productName'),
      ),
    );
  }

}

