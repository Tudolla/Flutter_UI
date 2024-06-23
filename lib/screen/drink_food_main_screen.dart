import 'package:flutter/material.dart';
import 'package:pet_ui/model/product_model.dart';
import 'package:pet_ui/utils/color.dart';
import 'package:pet_ui/widgets/background.dart';
import 'dart:math';

import 'package:pet_ui/widgets/category_item.dart';
import 'package:pet_ui/widgets/display_image.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  int currentCategory = 0;
  int currentProduct = 0;
  PageController? controller;
  double viewPointFraction = 0.5;
  double? pageOffSet = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 1, viewportFraction: viewPoint)
      ..addListener(() {
        setState(() {
          pageOffSet == controller!.page;
        });
      });
  }

  void despose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> dataProducts = products
        .where(
          (element) => element.category == categories[currentCategory],
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "images/coffee-cup.png",
              height: 30,
              color: Colors.greenAccent,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                Text(
                  "Trung Nguyen,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Legend space",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5, top: 12),
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.greenAccent,
                ),
                Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: firstColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Background(),
          Positioned(
            top: 30,
            left: 40,
            child: Text(
              "It's never failed,\nIt's all a challenge.",
              style: TextStyle(
                height: 1.2,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          Positioned(
            top: 122,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                    children: List.generate(
                        categories.length,
                        (index) => Container(
                              height: 190,
                              width: 107,
                              color: currentCategory == index
                                  ? Colors.amber
                                  : Colors.transparent,
                            ))),
              ),
            ),
          ),
          Positioned(
            top: 125,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                color: firstColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(categories.length, (index) {
                    int decrease = 0;
                    int max = 1;
                    int bottomPadding = 1;

                    for (var i = 0; i < categories.length; i++) {
                      bottomPadding = index > max ? index - decrease++ : index;
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentCategory = index;
                          dataProducts = products
                              .where(
                                (element) =>
                                    element.category ==
                                    categories[currentCategory],
                              )
                              .toList();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: bottomPadding.abs() * 75,
                        ),
                        child: CategoryItem(category: categories[index]),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: Clip(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                color: secondColor,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipPath(
                    clipper: Clip(),
                    child: Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                          controller: controller,
                          onPageChanged: (value) {
                            setState(() {
                              currentProduct = value % dataProducts.length;
                            });
                          },
                          itemBuilder: (context, index) {
                            double scale = max(
                                viewPointFraction,
                                (1 -
                                    (pageOffSet! - index).abs() +
                                    viewPointFraction));
                            double angel = 0.0;
                            final items =
                                dataProducts[index % dataProducts.length];
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 200 - (scale / 1.6 * 170),
                                ),
                                child: Transform.rotate(
                                  angle: angel * pi,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [ProductImage(product: items)],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Text(
                              dataProducts[currentProduct % dataProducts.length]
                                  .name,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$${dataProducts[currentProduct % dataProducts.length].price}",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: List.generate(
                            dataProducts.length, (index) => indicator(index)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }

  AnimatedContainer indicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 1,
            color: index == currentProduct
                ? Colors.amberAccent
                : Colors.transparent),
      ),
      padding: const EdgeInsets.all(6),
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: index == currentProduct ? Colors.white : Colors.white60,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 100);
    path.quadraticBezierTo(size.width / 2, -40, 0, 100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
