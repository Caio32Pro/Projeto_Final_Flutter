import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/model/aparelho.dart';
import 'package:projeto_final_flutter/view/homepage.dart';
import 'package:projeto_final_flutter/view/login.dart';
import 'package:projeto_final_flutter/view/equipe.dart';
import 'package:projeto_final_flutter/view/sobre.dart';

class Treino extends StatefulWidget {
  const Treino({super.key});

  @override
  State<Treino> createState() => _TreinoState();
}

class _TreinoState extends State<Treino> {

  String selectedButton = "";
  double currentPosition = 0;
  final TextEditingController searchController = TextEditingController();
  List<Aparelho> aparelhos = [
    Aparelho(
      nome: "Cadeira Flexora",
      codAparelho: 1,
      tipoMusculo: "Perna",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Leg Press - 90º",
      codAparelho: 2,
      tipoMusculo: "Perna",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Supino Reto - máquina",
      codAparelho: 3,
      tipoMusculo: "Peito",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Remada Baixa - máquina",
      codAparelho: 4,
      tipoMusculo: "Costas",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Puxada Frontal - máquina",
      codAparelho: 5,
      tipoMusculo: "Costas",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Cadeira Abdutora",
      codAparelho: 6,
      tipoMusculo: "Perna",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Cadeira Adutora",
      codAparelho: 7,
      tipoMusculo: "Perna",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Puxada Alta - máquina",
      codAparelho: 8,
      tipoMusculo: "Costas",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Crossover",
      codAparelho: 9,
      tipoMusculo: "Peito",
      dificuldade: "Fácil",
    ),
    Aparelho(
      nome: "Leg Press 45°",
      codAparelho: 10,
      tipoMusculo: "Perna",
      dificuldade: "Médio",
    ),
  ];

  List<Aparelho> exerciciosFiltrados = [];
  String busca = '';
  String dificuldadeSelecionada = 'Todos';
  String musculoSelecionado = 'Todos';

  final List<String> dificuldades = ['Todos', 'Fácil', 'Médio', 'Difícil'];
  final List<String> musculos = ['Todos', 'Peito', 'Perna', 'Braço', 'Costas'];

  @override
  void initState() {
    super.initState();
    exerciciosFiltrados = List.from(aparelhos);
  }

  void filtrar() {
    setState(() {
      exerciciosFiltrados = aparelhos.where((ex) {
        final buscaMatch = busca.isEmpty ||
            ex.nome.toLowerCase().contains(busca.toLowerCase()) ||
            ex.codAparelho.toString().toLowerCase().contains(busca.toLowerCase());

        final dificuldadeMatch =
            dificuldadeSelecionada == 'Todos' || ex.dificuldade == dificuldadeSelecionada;

        final musculoMatch =
            musculoSelecionado == 'Todos' || ex.tipoMusculo == musculoSelecionado;

        return buscaMatch && dificuldadeMatch && musculoMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3E3E),
        title: Text(
          'Busca de Exercícios',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(color: Color.fromARGB(255, 0, 0, 0), height: 1.0),
        ),
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
        backgroundColor: Color(0xFF3E3E3E),
        currentIndex: 0,
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: screenWidth * 0.8,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Digite o nome/código do aparelho',
                  hintStyle: TextStyle(color: Colors.white70),
                  labelText: 'Buscar Aparelho',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0xFF3E3E3E),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 1.0,
                    ),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  busca = value;
                  filtrar();
                },
              ),
            ),

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                value: dificuldadeSelecionada,
                items: dificuldades
                    .map((dif) => DropdownMenuItem(value: dif, child: Text(dif)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    dificuldadeSelecionada = value;
                    filtrar();
                  }
                },
              ),
              DropdownButton<String>(
                value: musculoSelecionado,
                items: musculos
                    .map((mus) => DropdownMenuItem(value: mus, child: Text(mus)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    musculoSelecionado = value;
                    filtrar();
                  }
                },
              ),
            ],
          ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: exerciciosFiltrados.length,
                itemBuilder: (context, index) {
                  final ex = exerciciosFiltrados[index];
                  return Card(
                    color: Color(0xFF3E3E3E),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ListTile(
                      title: Text(
                        ex.nome,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      subtitle: Text(
                        'Código: ${ex.codAparelho}\n'
                        'Tipo de Músculo: ${ex.tipoMusculo}\n'
                        'Dificuldade: ${ex.dificuldade}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
