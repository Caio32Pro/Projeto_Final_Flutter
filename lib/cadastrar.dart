
import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isHidden = true;
bool isHidden2 = true;

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool isChecked = false;
  bool isChecked2 = false;
  GlobalKey<FormState> usuario = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  Future<void> cadastrarUsuario() async {
    // Verifica se o formulário é válido
    if (usuario.currentState!.validate()) {
      // Obtém uma instância de SharedPreferences
      final prefs = await SharedPreferences.getInstance();

      // Salva os dados do usuário localmente
      await prefs.setString('nome', nomeController.text);
      await prefs.setString('email', emailController.text);
      await prefs.setString('senha', senhaController.text);
      await prefs.setString('cpf', cpfController.text);
      await prefs.setString('genero', isChecked ? 'M' : 'F');

      // Exibe uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );

      // Navega para a tela de login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3E3E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
        title: Text(
          'Cadastre-se',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(color: Color.fromARGB(255, 0, 0, 0), height: 1.0),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/iconepng.png', width: screenWidth * 0.5),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(
                width: screenWidth * 0.9,
                child: Form(
                  key: usuario,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nomeController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFc8c8c8),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            ),
                          ),
                          hintText: 'insira seu nome:',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("O nome não pode ser vazio");
                          } else if (value.length < 3) {
                            return ("O nome deve ter mais de 3 caracteres");
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFc8c8c8),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            ),
                          ),
                          hintText: 'insira seu email:',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("O email não pode ser vazio");
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return ("Insira um email válido");
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: senhaController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFc8c8c8),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            ),
                          ),
                          hintText: 'insira sua senha:',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isHidden = !isHidden;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                        ),
                        obscureText: isHidden,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("A senha não pode ser vazia");
                          } else if (value.length < 6) {
                            return ("A senha deve ter mais de 6 caracteres");
                          }
                          else if (value != confirmarSenhaController.text) {
                            return ("As senhas não coincidem");
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: confirmarSenhaController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFc8c8c8),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            ),
                          ),
                          hintText: 'confirme sua senha:',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isHidden2 = !isHidden2;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                        ),
                        obscureText: isHidden2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("A senha não pode ser vazia");
                          } else if (value.length < 6) {
                            return ("A senha deve ter mais de 6 caracteres");
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: cpfController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFc8c8c8),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            ),
                          ),
                          hintText: 'insira seu CPF: XXX.XXX.XXX-XX',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("O CPF não pode ser vazio");
                          } else if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$').hasMatch(value)) {
                            return ("Insira um CPF válido");
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            checkColor: Color.fromARGB(255, 255, 255, 255),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                if (isChecked = value!) {
                                  isChecked2 = false;
                                }
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Text('M', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                          SizedBox(height: 50),
                          Checkbox(
                            checkColor: Color.fromARGB(255, 255, 255, 255),
                            value: isChecked2,
                            onChanged: (value) {
                              setState(() {
                                if (isChecked2 = value!) {
                                  isChecked = false;
                                }
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Text('F', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                          SizedBox(height: 50),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: cadastrarUsuario, //Chama a função de cadastro
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF5500),
                          fixedSize: Size(screenWidth * 0.9, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}