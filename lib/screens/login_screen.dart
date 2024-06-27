import 'package:car_manager/controllers/login_controller.dart';
import 'package:car_manager/repositories/user_repository.dart';
import 'package:car_manager/entities/driver.dart';
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
                  hintText: 'Login',
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
          onPressed: () async {
            LoginController controller = LoginController();

            bool authConfirmation = await controller.auth(
                usernameController.text, passwordController.text);

            if (authConfirmation) {
              UserRepository repository = UserRepository();
              Driver? driver =
                  await repository.getUserByLogin(usernameController.text);

              Get.off(() => MainScreen(), arguments: driver);
            } else {
              Get.showSnackbar(const GetSnackBar(
                title: 'Usuário não encontrado',
                duration: Duration(seconds: 4),
                message:
                    "Verifique se o login ou senha foram digitados corretamente.",
              ));
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
