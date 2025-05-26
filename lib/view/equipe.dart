import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:projeto_final_flutter/view/busca.dart';
import 'package:projeto_final_flutter/view/homepage.dart';
import 'package:projeto_final_flutter/view/login.dart';
import 'package:projeto_final_flutter/view/sobre.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  PageController pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3E3E),
        title: Text(
          "Equipe",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF3E3E3E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 65,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF3E3E3E)),
                child: Text(
                  'GymGuru',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Sobre', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.help, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sobre()),
                );
              },
            ),
            ListTile(
              title: Text('Sair', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFF5500),
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Treino()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Perfil()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Busca',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Equipe'),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFFFF5500),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      width: constraints.maxWidth * 1,
                      height: constraints.maxWidth * 0.4,
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        width: constraints.maxWidth * 0.8,
                        height: constraints.maxHeight * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0xFF2B2B2B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                scrollDirection: Axis.horizontal,
                                height: double.infinity,
                                autoPlay: true,
                                aspectRatio: 1 / 1,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  onPageChanged(index);
                                },
                                autoPlayAnimationDuration: Duration(milliseconds: 400),
                              ),
                              items: [
                                Column(
                                  children: [
                                    SizedBox(height: 100),
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: AssetImage(
                                        'images/FotoCaio.png',
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Text(
                                      'Caio Franco',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                      ),
                                    ),
                                    Text(
                                      'caio32823@gmail.com',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 100),
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: AssetImage(
                                        'images/FotoDanilo.png',
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Text(
                                      'Danilo Pereira',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                      ),
                                    ),
                                    Text(
                                      'cl203310@g.unicamp.br',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 100),
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: AssetImage(
                                        'images/FotoLucas.png',
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Text(
                                      'Lucas Henrique',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                      ),
                                    ),
                                    Text(
                                      'lucashenriquedejesus98@gmail.com',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 100),
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: AssetImage(
                                        'images/FotoRay.png',
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Text(
                                      'Ray Anthony',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                      ),
                                    ),
                                    Text(
                                      'cl203518@g.unicamp.br',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              bottom:
                                  10,
                              left: 0,
                              right: 0,
                              child: DotsIndicator(
                                dotsCount: 4,
                                position: currentPage.toDouble(),
                                decorator: DotsDecorator(
                                  activeColor: Colors.deepOrange,
                                  size: Size.square(7.0),
                                  activeSize: Size(14.0, 7.0),
                                  spacing: EdgeInsets.symmetric(
                                    horizontal: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
