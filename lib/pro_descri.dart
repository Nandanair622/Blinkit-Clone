import 'package:flutter/material.dart';
class ProductDes extends StatelessWidget {
  const ProductDes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(

          child:Column(
              children: [
                Image.asset('assets/images/pro_pic.jpg'),
                const Text(
                  "Product Description",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.0,
                ),
                const MyButton()

              ])

      ),
    );
  }
}
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        const snackBar = SnackBar(content: Text('Added to cart'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('Add +'),
      ),
    );
  }
}