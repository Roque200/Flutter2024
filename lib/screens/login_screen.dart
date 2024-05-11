import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Correo electronico',
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );

    final txtPwd = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.key),
        hintText: 'Contraseña',
        hintStyle: TextStyle(fontWeight: FontWeight.bold)
      ),
    );


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:const BoxDecoration(
          image: DecorationImage(
            opacity: .5,
            fit: BoxFit.fill,
            image: AssetImage("assets/mustang.jpg")
          )
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              height: 300,
              width: 200,
              child: Image.asset('assets/mustang.jpg',)
            ),
            Positioned(
              bottom: 150,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  color:  const Color.fromARGB(255, 135, 236, 157).withOpacity(.3),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    txtUser,
                    txtPwd
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              child: ElevatedButton.icon(
                onPressed: (){
                  isValidating=!isValidating;
                  setState(() {});
                  Future.delayed(const Duration(
                    milliseconds: 3000
                  )).then((value) => Navigator.push(
                      context, 
                      MaterialPageRoute(builder:(context) => HomeScreen(),
                      )
                    ) 
                  );
                }, 
                label: const Text('Validar usuario'),
                icon: const Icon(Icons.login),
                )
            ),
            Positioned(
              top: 200,
              child: SizedBox(
                height: 200,
                width: 200,
                child: isValidating 
                ? Image.asset('assets/loading.gif')
                : Container()
                )
              )
          ],
        ),
      )
    );
  }
}