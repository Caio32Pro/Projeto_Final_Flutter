import 'package:projeto_final_flutter/cadastrar.dart';
import 'package:projeto_final_flutter/esqueci.dart';
import 'package:projeto_final_flutter/usuario.dart';
import 'package:projeto_final_flutter/remember_me_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_final_flutter/homepage.dart';

bool isHidden = true;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  final RememberMeController controller = Get.put(RememberMeController());

  GlobalKey<FormState> login = GlobalKey<FormState>();

  TextEditingController senhaController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  List<Usuario> loginFake = [
    Usuario(
      nome: 'Caio', 
      email: 'caio32823@gmail.com', 
      senha: 'Caca28081.'
    ),
    Usuario (
      nome: 'Lucas', 
      email: 'lucashenrique@gmail.com',
      senha: '12345678'
    ),
    Usuario(
      nome: 'Ray',
      email: 'rayanthony@gmail.com',
      senha: '12345678'
    )
  ];

  void realizarLogin(String emailDigitado, String senhaDigitada, BuildContext context) async {
    if (emailDigitado.isEmpty || senhaDigitada.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    // Verifica login pré-cadastrado
    bool loginSucesso = loginFake.any((usuario) =>
        usuario.email == emailDigitado && usuario.senha == senhaDigitada);

    if (loginSucesso) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login realizado com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
      return;
    }

    // Verifica login salvo localmente
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedSenha = prefs.getString('senha');

    if (savedEmail == emailDigitado && savedSenha == senhaDigitada) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login realizado com sucesso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email ou senha incorretos')),
      );
      emailController.clear();
      senhaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset('assets/images/iconepng.png', width: screenWidth * 0.5),
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Form(
                key: login, // Associa a chave ao Form
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.9,
                      child: TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFc8c8c8),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              color: Color(0xFFFF5500),
                              width: 1.0,
                            ),
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O email não pode ser vazio';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Insira um email válido';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(
                      width: screenWidth * 0.9,
                      child: TextFormField(
                        controller: senhaController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFc8c8c8),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Color(0xFFFF5500), width: 1.0),
                          ),
                          hintText: 'Senha',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
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
                          if (value == null || value.isEmpty) {
                            return 'A senha não pode ser vazia';
                          } else if (value.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
                /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                  checkColor: const Color.fromARGB(255, 255, 255, 255),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                    _isChecked = value!;
                    });
                  },
                  ),
                  SizedBox(height: 10),
                  Text('Remember me', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                  SizedBox(height: 50),
                ],
                ),*/
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                () => Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: (value){
                    controller.toggleRememberMe(value!);
                  },
                )
              ),
              Text('Remember me', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
              SizedBox(height: 20),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: screenWidth * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    realizarLogin(emailController.text, senhaController.text, context);
                    setState(() {
                      emailController.text = '';
                      senhaController.text = '';
                    });                  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF5500),
                    fixedSize: Size(screenWidth * 0.9, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EsqueciSenha()),
                  );
                },
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastro()),
                  );
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}