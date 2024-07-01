// ignore_for_file: must_be_immutable

import 'package:car_manager/constants/colors.dart';
import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:car_manager/widgets/trip_card.dart';
import 'package:car_manager/widgets/vehicle_info.dart';

import 'package:flutter/material.dart';

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
    switch (currentOption) {
      case 1:
        return TripFunctions();
      case 2:
        return Expanded(
            child: Column(
          children: [
            VehicleInfo(),
          ],
        ));
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
