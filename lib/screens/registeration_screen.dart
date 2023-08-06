import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/my_text_field.dart';
class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});
  static String id = 'RegisterationScreen';

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  @override
  late String email;

  late String password;

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginBackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              //decoration: kLoginBorderDesign,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Comfyz\n'
                        'Where comfort is found',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        backgroundColor: Colors.orange.shade50,
                        fontSize: 30,
                        fontFamily: 'DancingScript'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hintText: 'Email',
                    onChanged: (value) {
                      email = value;
                      //print(email);
                    },
                    isPassword: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    hintText: 'Password',
                    onChanged: (value) {
                      password = value;
                      //print(value);
                    },
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.yellow.shade50)),
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
