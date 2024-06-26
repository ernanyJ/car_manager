import 'package:car_manager/constants/colors.dart';
import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VehicleInfo extends StatelessWidget {
  VehicleInfo({super.key});
  VehicleController controller = VehicleController();
  double defaultPad = 40.0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getCars(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: defaultPad, right: defaultPad, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: bgGrey),
                    width: 340,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    'Modelo: ${snapshot.data![index]['marca'].toString()} ${snapshot.data![index]['modelo'].toString()}'),
                                const SizedBox(width: 12),
                                Text('Disponibilidade:'),
                                const SizedBox(width: 5),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        height: 10,
                                        width: 10,
                                        color: snapshot.data![index]
                                                        ['disponibilidade']
                                                    .toString() ==
                                                'Disponível'
                                            ? Colors.green
                                            : Colors.red))
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                    'Secretaria: ${snapshot.data![index]['sec'].toString()}'),
                                const SizedBox(width: 12),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                                'Placa: ${snapshot.data![index]['placa'].toString()}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
