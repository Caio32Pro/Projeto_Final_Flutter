import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/view/busca.dart';
import 'package:projeto_final_flutter/view/login.dart';
import 'package:projeto_final_flutter/view/equipe.dart';
import 'package:projeto_final_flutter/view/sobre.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
              title: Text('Sobre', style: TextStyle(color: Colors.white),),
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
        backgroundColor: Color(0xFF3E3E3E),
        currentIndex: 1,
        onTap: (index){
          if(index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Treino()));
          }
          else if(index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
          }
          else if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil()));
          }

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Equipe',
          ),
        ],
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.58,
              child: Image.asset('images/icone2png.png', width: 350,),
              ),
          ],
        ),
      ),
    );
  }
}