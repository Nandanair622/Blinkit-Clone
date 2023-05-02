import 'package:blinkit/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'CartPage.dart';


class CategoryProducts extends StatefulWidget {
  final String category;
  CategoryProducts(this.category);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  List<DocumentSnapshot> productsList = [];



  @override
  void initState() {
    super.initState();
    _getCategoryProducts();
  }

  void _getCategoryProducts() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: widget.category)
          .get();
      setState(() {
        productsList = snapshot.docs;
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while fetching products. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
  List<Map<String, dynamic>> vegetables = [
    {
      'imgPath': 'assets/images/veg&fruits/mango.jpg',
      'quantity': 0,
    },
    {
      'imgPath': 'assets/images/veg&fruits/potato.jpg',
      'quantity': 0,
    },
    {
      'imgPath': 'assets/images/veg&fruits/chilli.jpg',
      'quantity': 0,
    },
    {
      'imgPath': 'assets/images/veg&fruits/banana.jpg',
      'quantity': 0,
    },
    {
      'imgPath': 'assets/images/veg&fruits/onion.jpg',
      'quantity': 0,
    },
    {
      'imgPath': 'assets/images/veg&fruits/tomato.jpg',
      'quantity': 0,
    },
    {
      'imgPath': 'assets/images/veg&fruits/coconut.jpg',
      'quantity': 0,
    },
    {
      'imgPath': 'assets/images/veg&fruits/watermelon.jpg',
      'quantity': 0,
    },

  ];
  List<Map<String, dynamic>> cartProducts = [];
  List<Map<String, dynamic>> juices = [
    {
      'imgPath': 'assets/images/juices/milshake.jpg',
    },
    {
      'imgPath': 'assets/images/juices/redbull.jpg',
    },
    {
      'imgPath': 'assets/images/juices/mixedfruit.jpg',
    },
    {
      'imgPath': 'assets/images/juices/sprit.jpg',
    },
    {
      'imgPath': 'assets/images/juices/water.jpg',
    },
    {
      'imgPath': 'assets/images/juices/cola.jpg',
    },
    {
      'imgPath': 'assets/images/juices/tang.jpg',
    },
    {
      'imgPath': 'assets/images/juices/slice.jpg',
    }


  ];
  List<Map<String, dynamic>> dairy = [
    {
      'imgPath': 'assets/images/dairy/bread.jpg',
    },
    {
      'imgPath': 'assets/images/dairy/oats.jpg',
    },
    {
      'imgPath': 'assets/images/dairy/butter.jpg',
    },
    {
      'imgPath': 'assets/images/dairy/milk.jpg',
    },
    {
      'imgPath': 'assets/images/dairy/chocos.jpg',
    },
    {
      'imgPath': 'assets/images/dairy/curd.jpg',
    },
    {
      'imgPath': 'assets/images/dairy/paneer.jpg',
    },
    {
      'imgPath': 'assets/images/dairy/egg.jpg',
    }



  ];
  List<Map<String, dynamic>> namkeen = [
    {
      'imgPath': 'assets/images/namkeen/bananafries.jpg',
    },
    {
      'imgPath': 'assets/images/namkeen/rusk.jpg',
    },
    {
      'imgPath': 'assets/images/namkeen/kurkure.jpg',
    },
    {
      'imgPath': 'assets/images/namkeen/bhelpuri.jpg',
    },
    {
      'imgPath': 'assets/images/namkeen/doritos.jpg',
    },
    {
      'imgPath': 'assets/images/namkeen/pringles.jpg',
    },
    {
      'imgPath': 'assets/images/namkeen/bhujia.jpg',
    },
    {
      'imgPath': 'assets/images/namkeen/bingo.jpg',
    }


  ];
  // void _incrementQuantity(int index) {
  //   setState(() {
  //     vegetables[index]['quantity']++;
  //   });
  // }
  //
  // void _decrementQuantity(int index) {
  //   setState(() {
  //     if (vegetables[index]['quantity'] > 1) {
  //       vegetables[index]['quantity']--;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color(0xFFF7CB46),
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              final product = productsList[index].data() as Map<String, dynamic>;
              final imageUrl = product['img_path'] as String?;

              return GestureDetector(
                onTap: () {

                },
                child: Card(
                  margin: const EdgeInsets.all(3),
                  color: const Color(0xffF5F5FF), // Change background color to very light blue
                  elevation: 4, // Add box shadow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 170, // Set the height of the container
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.category == 'Vegetables & Fruits'
                            ? AssetImage(vegetables[index]['imgPath'])
                            : widget.category == 'Munchies'
                             ? AssetImage(namkeen[index]['imgPath'])
                            : widget.category == 'Dairy & Breakfast'
                            ? AssetImage(dairy[index]['imgPath'])
                            : AssetImage(juices[index]['imgPath']),
                        fit: BoxFit.fill,
                      ),
                    ),

                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'] ?? 'N/A',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              // const SizedBox(height:4),
                              Text(
                                '₹ ${product['price'] ?? 'N/A'}',
                              ),
                              // Row(
                              //   children: [
                              //     Container(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(2),
                              //         color: Colors.lightGreen,
                              //       ),
                              //       child: IconButton(
                              //         onPressed: () => _decrementQuantity(index),
                              //         icon: const Icon(Icons.remove),
                              //         color: Colors.white,
                              //         iconSize: 10,
                              //         padding: const EdgeInsets.all(4),
                              //       ),
                              //     ),
                              //
                              //     Text(
                              //       vegetables[index]['quantity'].toString(),
                              //       style: TextStyle(fontSize: 16),
                              //     ),
                              //
                              //     Container(
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(5),
                              //         color: Colors.lightGreen,
                              //       ),
                              //       child: IconButton(
                              //         onPressed: () => _incrementQuantity(index),
                              //         icon: const Icon(Icons.add),
                              //         color: Colors.lightGreen,
                              //         iconSize: 10,
                              //         padding: const EdgeInsets.all(8),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              const Spacer(),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // TODO: Add product to cart


                                    Fluttertoast.showToast(
                                        msg: 'Added to Cart',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 5.0);
                                    Map<String, dynamic> products = {
                                      'name': product['name'],
                                      'price': product['price'],
                                    };
                                    cartProducts.add(products);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartPage(cartProducts: cartProducts),
                                      ),
                                    );
                                  },

                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightGreen, // Change button color to light green
                                  ),
                                  child: const Text('ADD'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (productsList.isEmpty)
            Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text('Everything you need ,delivered in minutes.'),
                        ],
                      ),
                    )
        ],
      ),
    );
  }

}
