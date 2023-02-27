import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Pages/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _psController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                    color: Color.fromRGBO(156, 39, 176, 1),
                    fontSize: 35,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(
                  height: 50,
                  child: Image.asset("images/logo_paw.png"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 170,
                child: Image.asset("images/login.png"),
              ),

              SizedBox(height: 25),
              TextField(
                controller: _nomeController,
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
                  prefixIcon: Icon(Icons.person_rounded),
                  hintText: "Insira seu nome"
                ),
              ),

              SizedBox(height: 10),
              TextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Endereço",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
                  prefixIcon: Icon(Icons.location_pin),
                  hintText: "Insira seu endereço"
                ),
              ),

              SizedBox(height: 10),
              TextField(
                autofocus: false,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Telefone",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Insira seu telefone"
                ),
              ),

              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
                  prefixIcon: Icon(Icons.mail),
                  hintText: "Insira o email"
                ),
              ),

              SizedBox(height: 10),
              TextField(
                controller: _psController,
                obscureText: _showPassword == false ? true : false,
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
                  prefixIcon: Icon(Icons.key),
                  hintText: "Insira sua senha",
                  suffixIcon: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Icon( _showPassword == false ? Icons.visibility_off : Icons.visibility, color: Colors.grey,),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;});
                      }
                    ),
                  )
                ),
              ),

              SizedBox(height: 60),

              Container(
                height:60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end:Alignment.bottomRight,
                    stops:[0.3,1],
                    colors:[
                      Color.fromARGB(255, 115, 44, 148),
                      Color.fromARGB(255, 65, 96, 142),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )
                ),
                child:SizedBox.expand(
                  child: TextButton(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(                          
                          "   Cadastre-se",
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize:18,
                          ),
                          textAlign: TextAlign.left,
                          ),
                          Container(
                            child:SizedBox(
                              child:Image.asset("images/login_paw.png"),
                              height: 30,
                            ),
                          ),
                      ],
                    ),
                    onPressed: () => {
                      cadastrar()
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _psController.text);
      if (userCredential != null) {
        userCredential.user?.updateDisplayName(_nomeController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mas forte'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('este e-mail ja foi cadastrado, tente outro e-mail'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}

