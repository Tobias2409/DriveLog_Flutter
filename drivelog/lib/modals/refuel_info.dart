import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../models/event.dart';

class RefuelInfo extends StatefulWidget {
  const RefuelInfo._({super.key, required this.eventData});

  final Event eventData;

  static show(BuildContext context, Event eventData){
    showBarModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => RefuelInfo._(eventData: eventData,),
    );
  }

  @override
  State<RefuelInfo> createState() => _RefuelInfoState();
}

class _RefuelInfoState extends State<RefuelInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 213,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Refuel Stop",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_month),
                          const Spacer(),
                          Text(
                            DateFormat('dd.MM.yyyy').format(widget.eventData.dateAdded),
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.route, size: 30,),
                          const Spacer(),
                          Text(
                            "${widget.eventData.distance!.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '')}km",
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.local_gas_station),
                          const Spacer(),
                          Text(
                            "${widget.eventData.fuelConsumption!.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '')}l",
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.local_gas_station_outlined),
                          const Spacer(),
                          Text(
                            "${(((widget.eventData.fuelConsumption ?? 1.0) / (widget.eventData.distance ?? 1.0)) * 100).toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '')} l/100km",
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
