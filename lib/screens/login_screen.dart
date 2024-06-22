import 'package:car_manager/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 40;
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "CarManager",
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: defaultPadding,
                  top: MediaQuery.of(context).size.height / 4),
              child: const Text(
                "Insira seus dados:",
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.indigo,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Usuário',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        FilledButton(
          onPressed: () {
            if (passwordController.text != '1234' &&
                usernameController.text != 'joseoliveira') {
              Get.showSnackbar(const GetSnackBar(
                duration: Duration(seconds: 4),
                message: "Verifique se o usuário ou senha estão corretos.",
              ));
            } else {
              // TODO mudar para get.off depois
              Get.to(const MainScreen());
            }
          },
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.indigo)),
          child: const Text("Entrar"),
        )
      ],
    );
  }
}
