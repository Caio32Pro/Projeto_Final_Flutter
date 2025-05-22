import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/exercicio.dart';
import 'package:projeto_final_flutter/homepage.dart';
import 'package:projeto_final_flutter/login.dart';
import 'package:projeto_final_flutter/sobre.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3E3E),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF3E3E3E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 65,
              child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3E3E3E),
              ),
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
              title: Text('Ajuda', style: TextStyle(color: Colors.white),),
              leading: Icon(
                Icons.help,
                color: Colors.white,
                ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
              },
            ),
            ListTile(
              title: Text('Sair', style: TextStyle(color: Colors.white),),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                ),
              onTap: () { 
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFF5500),
        currentIndex: 2,
        onTap: (index){
          if(index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Treino()));
          }else if(index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
          }
          else if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil()));
          }

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Exercícios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                width: constraints.maxWidth * 1,
                height: constraints.maxWidth * 0.4,
              ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 50),
                Container(

                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxHeight * 0.9,
                  
                  decoration: BoxDecoration(
                    color: Color(0xFF2B2B2B),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/images/FotoCaio.png'),
                      ),

                      SizedBox(height: 50),
                      
                      Text('Caio Franco',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                      Text('caio32823@gmail.com'
                        ,style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(height: 50),

                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFc8c8c8),
                              fixedSize: Size(200, 35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            child: const Text('Edit Profile', 
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold, 
                                fontSize: 25)),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
          );
        },
      ),
    );
  }
}