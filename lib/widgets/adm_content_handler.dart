// ignore_for_file: must_be_immutable

import 'package:car_manager/constants/colors.dart';
import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:car_manager/repositories/brand_repository.dart';
import 'package:car_manager/repositories/model_repository.dart';
import 'package:car_manager/repositories/secretary_repository.dart';
import 'package:car_manager/repositories/vehicle_repository.dart';
import 'package:car_manager/widgets/trip_card.dart';
import 'package:car_manager/widgets/vehicle_info.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdmContentHandler extends StatelessWidget {
  AdmContentHandler({
    super.key,
    required this.currentOption,
  });
  VehicleController controller = VehicleController();
  int currentOption = 0;
  double defaultPad = 40.0;
  @override
  Widget build(BuildContext context) {
    final repository = VehicleRepository();
    final secretary_repository = SecretaryRepository();
    final model_repository = ModelRepository();

    RxString selectedBrand = "Chevrolet".obs;
    RxInt selectedModel = 1.obs;
    RxString selectedSecretary = "SEMUC".obs;

    switch (currentOption) {
      case 1:
        return TripFunctions();
      case 2:
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 40),
                  GestureDetector(
                    onTap: () async {
                      final modelCtrl = TextEditingController();
                      final placaCtrl = TextEditingController();
                      final yearCtrl = TextEditingController();
                      final kmCtrl = TextEditingController();
                      final secretaries =
                          await secretary_repository.getAllSecretaries();
                      final vehicles = await repository.getBrandsAsList();
                      final models = await model_repository.getModels();

                      List<DropdownMenuItem> b = [];
                      for (int i = 0; i < models.length; i++) {
                        final drp = DropdownMenuItem(
                          value: models[i]['id'],
                          child: Text(models[i]['nome']),
                        );
                        b.add(drp);
                      }
                      Get.dialog(
                        Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              width: 200,
                              height: 307,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Adicionar um veículo',
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.5)),

                                  Obx(
                                    () => DropdownButton(
                                      value: selectedModel.value,
                                      items: b,
                                      onChanged: (b) {
                                        selectedModel.value = b;
                                      },
                                    ),
                                  ),
                                  // TextFormField(
                                  //   controller: modelCtrl,
                                  //   decoration: const InputDecoration(
                                  //     hintText: 'Modelo',
                                  //     border: OutlineInputBorder(),
                                  //   ),
                                  // ),
                                  Obx(
                                    () => DropdownButton(
                                      value: selectedBrand.value,
                                      items: vehicles
                                          .map(
                                            (vehicle) => DropdownMenuItem(
                                              value: vehicle,
                                              child: Text(vehicle),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (vehicle) {
                                        selectedBrand.value = vehicle!;
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 100,
                                        child: TextFormField(
                                          controller: placaCtrl,
                                          decoration: const InputDecoration(
                                            hintText: 'Placa',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        height: 50,
                                        width: 100,
                                        child: TextFormField(
                                          controller: yearCtrl,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            hintText: 'Ano',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        height: 50,
                                        width: 140,
                                        child: TextFormField(
                                          controller: kmCtrl,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            hintText: 'Quilometragem',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => DropdownButton(
                                          value: selectedSecretary.value,
                                          items: secretaries
                                              .map(
                                                (secretary) => DropdownMenuItem(
                                                  value: secretary,
                                                  child: Text(secretary),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (secretary) {
                                            selectedSecretary.value =
                                                secretary!;
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FilledButton(
                                            onPressed: () async {
                                              List? status;
                                              final r = BrandRepository();
                                              final brand =
                                                  await r.getBrandIdByName(
                                                      selectedBrand.value);

                                              final repo = VehicleRepository();

                                              status = await repo.addModel(
                                                  selectedModel.value,
                                                  brand,
                                                  placaCtrl.text,
                                                  selectedSecretary.value,
                                                  kmCtrl.text);
                                              print('status => ${status[1]}');
                                              if (status[0] == true) {
                                                Get.showSnackbar(
                                                  const GetSnackBar(
                                                    title: 'Sucesso.',
                                                    duration:
                                                        Duration(seconds: 3),
                                                    message:
                                                        "O veículo foi adicionado a lista.",
                                                  ),
                                                );
                                              } else {
                                                Get.showSnackbar(
                                                  GetSnackBar(
                                                    title: 'Falha.',
                                                    duration: const Duration(
                                                        seconds: 3),
                                                    message: status[1],
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Text("Adicionar"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: bgGrey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20),
                            Icon(Icons.add),
                            SizedBox(width: 5),
                            Text('Adicionar'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              VehicleInfo(),
            ],
          ),
        );
      case 3:
        return const Center(
          child: Text('dsadsa'),
        );
    }
    return const Placeholder();
  }
}

Expanded TripFunctions() {
  return Expanded(
    child: ListView(
      children: [
        optionTile('Fazer solicitação'),
        const SizedBox(height: 20),
        optionTile('Ver histórico de viagens'),
      ],
    ),
  );
}

Padding optionTile(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgGrey,
      ),
      width: double.maxFinite,
      height: 80,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
