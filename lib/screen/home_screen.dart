import 'package:flutter/material.dart';
import 'package:pet_ui/model/pet_model.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:const  [
            Padding(padding: EdgeInsets.only(left: 22),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
                SizedBox(width: 8,),
                Text('Hi, Thor', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            
            ),),

           const SizedBox(height: 10,),
           const Padding(padding: EdgeInsets.only(left: 22),
            
            child: Text.rich(
              
              TextSpan(text: "Kieu Van  \n", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              
              children: [
                
                TextSpan(
                  text: "Cute Pet animal!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  )
                )
              ]
              ),
            ),
            ),
            const SizedBox(height: 10,),

            

          ],
        ),
      ),),

    );
  }

  SizedBox categorySelect() {
    return SizedBox(
            height: 90,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listPets.length,
              itemBuilder: ((context, index){
                return GestureDetector(
                  onTap: (){},
                  child: Padding(
                  padding:const EdgeInsets.only(left: 20, top: 30),
                  child: Column(
                    children: [
                      Container(
                        
                        
                        height: 50,
                        width: 65,
                        decoration: BoxDecoration(
                        
                          color: selectedIndex == index ? Color.fromARGB(255, 236, 168, 141) : Color.fromARGB(255, 210, 243, 156) ,
                          borderRadius: BorderRadius.circular(10),
                          
                          boxShadow:const [
                              BoxShadow(
                              blurRadius: 1.5,
                              spreadRadius: 0,
                              
                             )
                          ],
                        ),
                        child: Center(
                          child: Text(listPets[index]),
                        ),
                      )
                    ],
                  ),
                  ),

                );

              })),
          );
  }
}