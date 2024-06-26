// ignore_for_file: must_be_immutable

import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:car_manager/widgets/trip_card.dart';
import 'package:car_manager/widgets/vehicle_info.dart';

import 'package:flutter/material.dart';

class ContentHandler extends StatelessWidget {
  ContentHandler({
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
        return Expanded(
          child: ListView(
            children: const [
              TripCard(),
              TripCard(),
            ],
          ),
        );
      case 2:
        return VehicleInfo();
      case 3:
        return const Center(
          child: Text('Notificações'),
        );
    }
    return const Placeholder();
  }
}
