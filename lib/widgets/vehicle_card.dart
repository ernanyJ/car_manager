import 'package:car_manager/constants/colors.dart';
import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/auth.dart';

class VehicleCard extends StatelessWidget {
  var data;

  @override
  Widget build(BuildContext context) {
    VehicleController controller = VehicleController();

    return Column(
      children: [
        FutureBuilder(
          future: controller.getCars(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                      onTap: () async {
                        SupabaseClient supabase = Supabase.instance.client;

                        final String publicUrl = supabase.storage
                            .from('car-manager-pngs')
                            .getPublicUrl('joseoliveira.jpg');

                        print(publicUrl);
                      },
                      child: Box(snapshot, index));
                },
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  Widget Box(AsyncSnapshot<List<Map<String, dynamic>>> snapshot, int index) {
    double defaultPad = 40.0;
    return Padding(
      padding: EdgeInsets.only(left: defaultPad, right: defaultPad, bottom: 40),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: bgGrey),
        width: 340,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                      'Modelo: ${snapshot.data![index]['marca'].toString()} ${snapshot.data![index]['placa'].toString()}'),
                  const SizedBox(width: 12),
                  Text('Disponibilidade:'),
                  const SizedBox(width: 5),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          height: 10,
                          width: 10,
                          color: snapshot.data![index]['disponibilidade']
                                      .toString() ==
                                  'Disponível'
                              ? Colors.green
                              : Colors.red))
                ],
              ),
              const SizedBox(height: 12),
              Text(
                  'Secretaria: ${snapshot.data![index]['secretaria'].toString()}'),
         
            ],
          ),
        ),
      ),
    );
  }
}
