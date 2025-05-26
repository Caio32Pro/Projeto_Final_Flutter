import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        title: Text('Sobre', style: TextStyle(color: Colors.white, fontSize: 30)),
        backgroundColor: Color(0xFF3E3E3E),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(color: Color.fromARGB(255, 0, 0, 0), height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'GymGuru',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: SizedBox(
                      width: 450,
                      child: Text(
                        'O GymGuru é um aplicativo desenvolvido para ajudar os usuários a alcançarem seus objetivos fitness e de saúde. Com uma interface amigável e recursos inovadores, o GymGuru oferece uma experiência única para quem busca melhorar sua qualidade de vida.',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.black,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  /*Image.asset('images/FotoWeb.png', width: 200,),
                  SizedBox(width: 20,),*/
                  Padding(padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Image.asset('assets/images/FotoWeb.png', width: 200,),
                        SizedBox(width: 20,),
                        SizedBox(
                          child: Text(
                            'A parte web do projeto, desenvolvida por\n'
                            'Lucas de Henrique de Jesus, é focada\n'
                            'em apresentar a interface do aplicativo\n'
                            'para as academias, permitindo que\n'
                            'elas tenham uma visão do que\n'
                            'nosso aplicativo pode oferecer.\n',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ]
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  /*Image.asset('images/FotoWeb.png', width: 200,),
                  SizedBox(width: 20,),*/
                  Padding(padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text(
                            'A parte desktop do projeto, desenvolvida\n'
                            'por Danilo Pereira, é pensada para\n'
                            'a utilização da academia, permitindo\n'
                            'os funcionários tenham um maior\n'
                            'controle sobre os equipamentos\n'
                            'e alunos cadastrados.\n',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Image.asset('assets/images/FotoWeb.png', width: 200,),
                      ]
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  /*Image.asset('images/FotoWeb.png', width: 200,),
                  SizedBox(width: 20,),*/
                  Padding(padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Image.asset('assets/images/FotoWeb.png', width: 200,),
                        SizedBox(width: 20,),
                        SizedBox(
                          child: Text(
                            'A parte mobile do projeto, desenvolvida\n'
                            'por Caio Franco, se trata de onde o\n'
                            'usuário irá interagir com o aplicativo,\n'
                            'tendo acesso a todas as funcionalidades\n'
                            'que o GymGuru pode oferecer.\n',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
