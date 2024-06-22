import 'package:flutter/material.dart';
import 'package:pet_ui/model/planet_model.dart';
import 'package:pet_ui/utils/color.dart';

class PlanetDetailScreen extends StatefulWidget {
  final PlanetInfo planetInfo;
  const PlanetDetailScreen({super.key, required this.planetInfo});

  @override
  State<PlanetDetailScreen> createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  bool _isExpandText = false;
  void toggleExpaned() {
    setState(() {
      _isExpandText = !_isExpandText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 220,
                        ),
                        Text(
                          widget.planetInfo.name,
                          style: TextStyle(
                            fontSize: 50,
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "SpaceX Vietnam",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 95, 93, 93),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.planetInfo.description,
                          maxLines: _isExpandText ? null : 5,
                          overflow: _isExpandText
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            color: contentTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onDoubleTap: toggleExpaned,
                          child: Text(
                            _isExpandText ? "Read less" : "Read more",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color.fromARGB(255, 245, 122, 163),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 95, 93, 93),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Kho lưu trữ:",
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                          itemCount: widget.planetInfo.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  widget.planetInfo.images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -40,
              child: Container(
                height: 300,
                child: Hero(
                  tag: widget.planetInfo.id,
                  child: Image.asset(
                    widget.planetInfo.iconImage,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
