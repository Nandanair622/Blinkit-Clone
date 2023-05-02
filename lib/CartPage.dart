import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartProducts;

  const CartPage({Key? key, required this.cartProducts}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    for (var product in widget.cartProducts) {
      double price = double.parse(product['price'] as String);
      totalPrice += price;
    }
  }

  void _removeProduct(int index) {
    setState(() {
      widget.cartProducts.removeAt(index);
      totalPrice = 0;
      for (var product in widget.cartProducts) {
        double price = double.parse(product['price'] as String);
        totalPrice += price;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.yellow.shade700,
      ),
      body: widget.cartProducts.isEmpty
          ? Center(
        child: Text(
          'No items in cart',
          style: Theme.of(context).textTheme.headline5,
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartProducts.length,
              itemBuilder: (context, index) {
                final product = widget.cartProducts[index];
                return ListTile(
                  title: Text(product['name'] as String),
                  subtitle: Text('\₹${product['price']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeProduct(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\₹$totalPrice',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
