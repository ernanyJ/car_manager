// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:car_manager/entities/vehicle.dart';
import 'package:car_manager/repositories/user_repository.dart';
import 'package:car_manager/entities/driver.dart';
import 'package:car_manager/repositories/vehicle_repository.dart';
import 'package:car_manager/widgets/adm_content_handler.dart';
import 'package:car_manager/widgets/content_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../constants/colors.dart';

class AdmMainScreen extends StatelessWidget {
  AdmMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt currentOption = 1.obs;

    VehicleRepository vehicleRepository = VehicleRepository();
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
                    child: Image.asset('images/man.jpg'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
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
            () => AdmContentHandler(currentOption: currentOption.value),
          ),
        ],
      ),
    );
  }
}

Widget VehicleInfo(Driver? currentDriver, Vehicle? assignedVehicle) {
  if (assignedVehicle != null) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "Informações do veículo:",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        Text(assignedVehicle!.modelo),
        Text("Placa: ${assignedVehicle.placa}"),
        Text(
          "Quilometragem: ${assignedVehicle.placa}",
          style: TextStyle(fontSize: 13),
        ),
        Text(
          "Consumo médio: ${'12km/l'}",
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
  return Placeholder();
}
