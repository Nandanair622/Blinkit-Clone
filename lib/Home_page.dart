import 'package:blinkit/my_account.dart';
import 'package:blinkit/widgets/categories_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'CartPage.dart';
import 'CategoryProducts.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firebase
  final List<String> _carouselImages = [];
  var _dotPosition=0;


  fetchCarouselImages()async{
    var _firestoreInstance=FirebaseFirestore.instance;
    QuerySnapshot qn =
    await _firestoreInstance.collection("carousel-images").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["image-path"],
        );
        // ignore: avoid_print
        print(qn.docs[i]["image-path"]);
      }
    });

    return qn.docs;


  }
  final List<Map<String, dynamic>> cartProducts = [];
  @override
  void initState(){
    fetchCarouselImages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7CB46),
        //...
          centerTitle: false,
          title: const Text('blinkit'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => CartPage(cartProducts: cartProducts)),
                 );
              },
            ),
      IconButton(
      icon: const Icon(Icons.account_circle_sharp),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=>const MyAccount(key: null,),
            ));
      },
      ),


             ],
        bottom: AppBar(
          backgroundColor: const Color(0xFFF7CB46),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: const [
                SizedBox(width: 10),
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for something',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.mic, color: Colors.grey),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),

        iconTheme: const IconThemeData(color: Colors.black), toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(color: Colors.black),
        ).bodyMedium,
    ),
        body: SafeArea(
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        AspectRatio(
          aspectRatio: 2.5,
          child: CarouselSlider(items:_carouselImages.map((item) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(item),fit:BoxFit.fitWidth)
            ),
          )).toList(),options: CarouselOptions(
            height: 600,
            aspectRatio: 2/1,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (val,carouselPageChangedReason) {
              setState(() {
                _dotPosition = val;
              },);
            }

          )),
        ),
        const SizedBox(height: 10),
        DotsIndicator(
          dotsCount: _carouselImages.isEmpty?1:_carouselImages.length,
          position: _dotPosition.toDouble(),
          decorator: const DotsDecorator(
           activeColor: Colors.black,
            color: Colors.blueGrey,
            spacing: EdgeInsets.all(2),
            activeSize: Size(8, 8),
            size: Size(6, 6),
        ),
        ),
        Expanded(
          child: CategoriesScreen(), // Adding CategoriesScreen widget here
        ),
      ]


    )
        )
    );
  }
}
// Search Page
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          //...r
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,

            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
    );
  }
}






class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);


  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/f_v.jpg',
      'catText': 'Vegetables & Fruits',

    },
    {
      'imgPath': 'assets/images/cat/dairy_break.jpg',
      'catText': 'Dairy & Breakfast',
    },
    {
      'imgPath': 'assets/images/cat/atta.jpg',
      'catText': 'Atta,Rice & Dal',
    },
    {
      'imgPath': 'assets/images/cat/juices.jpg',
      'catText': 'Cold drinks & Juices',
    },
    {
      'imgPath': 'assets/images/cat/munchies.jpg',
      'catText': 'Munchies',
    },
    {
      'imgPath': 'assets/images/cat/tea.jpg',
      'catText': 'Tea,Coffee & Health Drinks',
    },
    {
      'imgPath': 'assets/images/cat/instant.jpg',
      'catText': 'Instant & Frozen food',
    },
    {
      'imgPath': 'assets/images/cat/masala.jpg',
      'catText': 'Dry Fruits,Masala & Oil',
    },
    {
      'imgPath': 'assets/images/cat/sauce.jpg',
      'catText': 'Sauces & Spreads',
    },
    {
      'imgPath': 'assets/images/cat/sweet_tooth.jpg',
      'catText': 'Sweet tooth',
    },
    {
      'imgPath': 'assets/images/cat/clean.jpg',
      'catText': 'Cleaning essentials',
    },
    {
      'imgPath': 'assets/images/cat/home.jpg',
      'catText': 'Home & Office',
    },
    {
      'imgPath': 'assets/images/cat/personal.jpg',
      'catText': 'Personal Care',
    },
    {
      'imgPath': 'assets/images/cat/pet.jpg',
      'catText': 'Pet Care',
    },
    {
      'imgPath': 'assets/images/cat/baby.jpg',
      'catText': 'Baby Care',
    },


  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10, // Vertical spacing
          mainAxisSpacing: 10, // Horizontal spacing
          children: List.generate(catInfo.length, (index) { // Use catInfo.length instead of 6
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryProducts(catInfo[index]['catText'])),
                );
              },
              child: CategoriesWidget(
                imgPath: catInfo[index]['imgPath'],
                catText: catInfo[index]['catText'],
                passedColor: const Color(0xffB7DFF5),
                // passedColor:Colors.yellow.shade50,
              ),
            );
          }),
        ),
      ),

    );
  }
}




