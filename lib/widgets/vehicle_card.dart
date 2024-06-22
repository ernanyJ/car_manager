import 'package:car_manager/constants/colors.dart';
import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/auth.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    VehicleController controller = VehicleController();

    return FutureBuilder(
      future: controller.getBrands(),
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (BuildContext context, int index){
            return Expanded(child: VehicleCard());
          },);
          //Text(snapshot.data![1].toString());
        }
        return const CircularProgressIndicator();
      },
    );

    // Padding(
    //   padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(20),
    //     child: Container(
    //       width: 340,
    //       height: 120,
    //       color: bgGrey,
    //       child: Text(),
    //     ),
    //   ),
    // );
  }
}
