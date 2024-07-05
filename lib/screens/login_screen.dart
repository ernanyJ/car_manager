import 'package:car_manager/controllers/login_controller.dart';
import 'package:car_manager/entities/vehicle.dart';
import 'package:car_manager/repositories/user_repository.dart';
import 'package:car_manager/entities/driver.dart';
import 'package:car_manager/repositories/vehicle_repository.dart';
import 'package:car_manager/screens/adm_main_screen.dart';
import 'package:car_manager/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    onEditingComplete: () =>
                        driverAuth(usernameController, passwordController),
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          TextEditingController admLoginCtrl =
                              TextEditingController();
                          TextEditingController admPassCtrl =
                              TextEditingController();
                          Get.dialog(
                            Dialog(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 200,
                                height: 300,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 50),
                                    const Text('Acesso como administrador'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Form(
                                            child: TextFormField(
                                              obscureText: false,
                                              controller: admLoginCtrl,
                                              decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.person),
                                                hintText: 'Login',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              obscureText: true,
                                              controller: admPassCtrl,
                                              decoration: const InputDecoration(
                                                prefixIcon: Icon(Icons.lock),
                                                hintText: 'Senha',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FilledButton(
                                      onPressed: () {
                                        admAuth(admLoginCtrl, admPassCtrl);
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Colors.indigo)),
                                      child: const Text('Entrar'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Entrar como administrador',
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                    const SizedBox(
                      width: 40,
                    )
                  ],
                ),
                const SizedBox(
                  width: 1,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
        FilledButton(
          onPressed: () => driverAuth(usernameController, passwordController),
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.indigo)),
          child: const Text("Entrar"),
        )
      ],
    );
  }

  driverAuth(usernameController, passwordController) async {
    LoginController controller = LoginController();

    bool authConfirmation = await controller.authDriver(
        usernameController.text, passwordController.text);

    if (authConfirmation) {
      UserRepository repository = UserRepository();
      Driver? driver = await repository.getUserByLogin(usernameController.text);

      VehicleRepository vehicleRepository = VehicleRepository();
      Vehicle? car = await vehicleRepository.getCarById(driver!.veiculo);

      List b = [driver, car];
      // TODO mudar para get.off depois
      Get.to(() => MainScreen(), arguments: b);
    } else {
      Get.showSnackbar(const GetSnackBar(
        title: 'Usuário não encontrado',
        duration: Duration(seconds: 4),
        message: "Verifique se o login ou senha foram digitados corretamente.",
      ));
    }
  }

  admAuth(admLoginCtrl, admPassCtrl) async {
    LoginController controller = LoginController();
    bool auth = await controller.authAdm(admLoginCtrl.text, admPassCtrl.text);

    if (auth) {
      Get.snackbar('Sucessfull', 'Login');
      Get.to(AdmMainScreen(), arguments: admLoginCtrl.text);
    } else {
      Get.snackbar('Failed', 'Login');
    }
  }
}
