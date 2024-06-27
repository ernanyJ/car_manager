import 'package:car_manager/entities/vehicle.dart';
import 'package:car_manager/repositories/user_repository.dart';
import 'package:car_manager/entities/driver.dart';
import 'package:car_manager/repositories/vehicle_repository.dart';
import 'package:car_manager/widgets/content_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../constants/colors.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt currentOption = 1.obs;
    Driver? currentDriver = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: GestureDetector(
                        onTap: () async {
                          VehicleRepository vehicleRepository =
                              VehicleRepository();
                              List<Map<String, dynamic>>? vehicle = await vehicleRepository.getVehicleById(5);
                             var actualVehicle = Vehicle.fromJson(vehicle![0]);
                          print(actualVehicle.placa);
                        },
                        child: Image.asset('images/man.jpg')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentDriver!.nome),
                      Row(
                        children: [
                          Text("Status:"),
                          Text(
                              ' ${currentDriver!.disponivel.toString() == 'false' ? 'Indisponível' : 'Disponível'}',
                              style: TextStyle(
                                  color: currentDriver!.disponivel
                                      ? Colors.green
                                      : Colors.red)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Informações do veículo:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                      Text("Corolla XRS 2.0"),
                      Text("Placa: ${'NAU-9211'}"),
                      Text(
                        "Quilometragem: ${'32.229km'}",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "Consumo médio: ${'12km/l'}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 340,
              height: 70,
              color: bgGrey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          currentOption.value = 1;
                        },
                        child: Text(
                          'Viagens',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: currentOption.value == 1
                                  ? Colors.indigo
                                  : Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          currentOption.value = 2;
                        },
                        child: Text(
                          'Veículos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: currentOption.value == 2
                                ? Colors.indigo
                                : Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          currentOption.value = 3;
                        },
                        child: Text(
                          'Notificações',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: currentOption.value == 3
                                ? Colors.indigo
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => ContentHandler(currentOption: currentOption.value),
          ),
        ],
      ),
    );
  }
}
