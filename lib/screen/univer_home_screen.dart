import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:pet_ui/model/planet_model.dart';
import 'package:pet_ui/screen/planet_detail_screen.dart';
import 'package:pet_ui/utils/color.dart';

class UniverHomePage extends StatefulWidget {
  const UniverHomePage({super.key});

  @override
  State<UniverHomePage> createState() => _UniverHomePageState();
}

class _UniverHomePageState extends State<UniverHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondGradientColor,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                firstGradientColor,
                secondGradientColor,
              ]),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Kiến thức",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Kinh nghiệm",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down,
                          color: Colors.pink[200], size: 35),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Swiper(
                      itemCount: planets.length,
                      physics: const BouncingScrollPhysics(),
                      itemHeight: 500,
                      itemWidth: double.infinity,
                      layout: SwiperLayout.TINDER,
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                        activeSize: 7,
                        size: 4,
                        activeColor: Colors.white,
                        color: Colors.white24,
                      )),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlanetDetailScreen(
                                        planetInfo: planets[index])));
                          },
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 180,
                                  ),
                                  Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            planets[index].name,
                                            style: const TextStyle(
                                              fontSize: 50,
                                              color: Color.fromARGB(
                                                  255, 71, 69, 90),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "SpaceX Elon",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: primaryTextColor,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Xem thêm ",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: secondaryTextColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: secondaryTextColor,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(planets[index].iconImage),
                              Positioned(
                                  right: 0,
                                  bottom: 60,
                                  child: Text(
                                    planets[index].id.toString(),
                                    style: TextStyle(
                                      fontSize: 150,
                                      color: primaryTextColor.withOpacity(0.2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: navBarColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("images/menu_icon.png"),
                ),
                const Text(
                  "Trải nghiệm",
                  style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.pink[200],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: Colors.pink[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
