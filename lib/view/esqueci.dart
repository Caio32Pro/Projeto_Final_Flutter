import 'package:flutter/material.dart';
//import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:projeto_final_flutter/view/login.dart';

class EsqueciSenha extends StatefulWidget {
  const EsqueciSenha({super.key});

  @override
  EsqueciSenhaState createState() => EsqueciSenhaState();
}

void sendEmail() async {
  String username = 'gymgurumail@gmail.com';
  String password = 'GymGuru123';

  final smtpServer = gmail(username, password);

  // Create the email message
  final message = Message()
    ..from = Address(username, 'GymGuru')
    ..recipients.add('recipient@example.com')
    ..subject = 'Password Reset Request'
    ..text = 'This is an automated email to reset your password.';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. \n' + e.toString());
  }
}

class EsqueciSenhaState extends State<EsqueciSenha> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3E3E),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/iconepng.png', width: 250),
              SizedBox(height: 20),
              Text(
                'Esqueci minha senha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 90),
              Text(
                'Insira seu e-mail abaixo e\nenviaremos um link para\n        alterar sua senha',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
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
                        hintText: 'Email',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    // Send the email
                    sendEmail();
                    // Show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Email enviado com sucesso!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    // Navigate to the login page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFc8c8c8),
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text('Enviar', style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
