import 'package:flutter/material.dart';
import 'package:platzi_store/core/components/app_button.dart';
import 'package:platzi_store/core/const/asset_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsucre = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AssetConst.blurImage),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Platzi Store\nPlease login to continue',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: isObsucre,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: isObsucre
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            isObsucre = !isObsucre;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Recover Password?',
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      label: 'Login',
                      onPressed: () {
                        // untuk validasi password dan email tidak boleh kosong
                        if (emailController.text != '' &&
                            passwordController.text != '') {

                          //validasi email harus mengandung @
                          if (emailController.text.contains('@')) {
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            //jika email tidak mengandung @ maka muncul snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                action: SnackBarAction(
                                    label: 'Oke', onPressed: () {}),
                                backgroundColor: Colors.red,
                                content: Text('Format Email tidak Valid'),
                              ),
                            );
                          }
                        } else {
                          // jika email dan password kosong maka muncul snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              action: SnackBarAction(
                                  label: 'Oke', onPressed: () {}),
                              backgroundColor: Colors.red,
                              content:
                                  Text('Email dan Password tidak boleh kosong'),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
