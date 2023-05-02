import 'package:blinkit/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
        required this.catText,
        required this.imgPath,
        required this.passedColor,
     })
      : super(key: key);
  final String catText, imgPath;
  final Color passedColor;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return InkWell(

      child: Container(
        // height: _screenWidth * 0.6,
        height: 125,
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8), // Reduce the borderRadius value
          border: Border.all(
            color: passedColor.withOpacity(0.7),
            width: 1, // Reduce the width of the border
          ),
        ),
        child: Column(children: [
          // Container for the image
          Container(
            height: 125, // Set the height of the container
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          // Category name
          Expanded(
            child: TextWidget(
              text: catText,
              textSize: 13,
              color: Colors.black,
              isTitle: true,
            ),
          ),
        ]),
      ),
    );
  }
}

