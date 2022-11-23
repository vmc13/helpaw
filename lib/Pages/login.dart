import 'package:flutter/material.dart';

import 'cadastro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Helpaw',
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
              SizedBox(height: 30),
              SizedBox(
                height: 230,
                child: Image.asset("images/login.png"),
              ),
              SizedBox(height: 25),
              TextField(
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
                  prefixIcon: Icon(Icons.person_rounded),
                  hintText: "Insira o email"
                ),
              ),

              SizedBox(height: 15),

              TextField(
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

              SizedBox(height: 5),

              Container(
                height:40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Recuperar Senha",
                  ),
                  onPressed: (){}
                ),
              ),

              SizedBox(height: 15),

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
                          "   Login",
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
                    onPressed: () => {},
                  ),
                ),
              ),

              SizedBox(height: 15),

              Container(
                height:60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 184, 28, 28),
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
                          "   Login com Google",
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            color:Colors.white,
                            fontSize:18,
                          ),
                          textAlign: TextAlign.left,
                          ),
                          Container(
                            child:SizedBox(
                              child:Image.asset("images/google_logo.png"),
                              height: 30,
                            ),
                          ),
                      ],
                    ),
                    onPressed: () => {},
                  ),
                ),
              ),

              SizedBox(height: 30),

              Container(
                height: 40,
                child: TextButton(
                  child: Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=> SignUp()),
                  );},
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}