import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_ui/utils/color.dart';
import 'package:pet_ui/widgets/background.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  @override
  Widget build(BuildContext context) {
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
            left: 35,
            child: Text(
              "It's never failed,\nIt's all a challenge.",
              style: TextStyle(
                height: 1.2,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
