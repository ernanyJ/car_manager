import 'package:car_manager/widgets/trip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt currentOption = 1.obs;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
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
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("José Oliveira"),
                      Row(
                        children: [
                          Text("Status:"),
                          Text(" Disponível",
                              style: TextStyle(color: Colors.green)),
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
                padding: EdgeInsets.all(12.0),
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
          Expanded(
            child: ListView(children: const [
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
            ]),
          ),
        ],
      ),
    );
  }
}
