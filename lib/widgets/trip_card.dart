import 'package:car_manager/constants/colors.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            width: 340,
            height: 120,
            color: bgGrey,
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Partida: ${'SEED RR'}'),
                      Text('Destino: ${'Palácio Sen. H'}'),
                      Text('Veículo: ${'Corolla XRS 2.0'}'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Veículo: ${'Corolla XRS 2.0'}'),
                      Text('24/05/2024, 13h28'),
                    ],
                  ),
                
                ],
              ),
            )),
      ),
    );
  }
}
