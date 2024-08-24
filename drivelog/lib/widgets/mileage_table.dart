import 'package:drivelog/helpers/delimiter_helper.dart';
import 'package:drivelog/helpers/observer.dart';
import 'package:drivelog/services/car_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';

class MileageTable extends StatefulWidget {
  const MileageTable({super.key, this.onlyHeader = false,});

  final bool onlyHeader;

  @override
  State<MileageTable> createState() => _MileageTableState();
}

class _MileageTableState extends State<MileageTable> {

  late final Observer observer;
  final CarService carService = CarService.getInstance();

  List<Event> events = [];
  String delimiter = "x";
  bool oneTypeOnly = false;

  @override
  void initState() {
    super.initState();

    DelimiterHelper.getDelimiter(context).then((x) => setState(() {
      delimiter = x;
    }));

    updateData();
    observer = Observer(updateData);
    carService.subscribe(observer);

  }

  updateData() async {
    var data = await carService.getEvents(1);

    setState(() {
      oneTypeOnly = !(data.map((x) => x.eventType).toSet().length != 1);
      if(!widget.onlyHeader) {
        events = data;
      }
    });
  }
  
  double calculateWidth(BuildContext context){
    if(oneTypeOnly){
      return MediaQuery.sizeOf(context).width / 5;
    }

    return MediaQuery.sizeOf(context).width / 10 + 8 * MediaQuery.of(context).devicePixelRatio;
  }

  DataRow mapEvent(Event event,  BuildContext context){
    return DataRow(cells: [
      if(!oneTypeOnly)
      DataCell(SizedBox(width: calculateWidth(context) - 21 * MediaQuery.of(context).devicePixelRatio, child: const Center(child:  Icon(Icons.directions_car)))),
      DataCell(SizedBox(width: calculateWidth(context), child: Center(child: Text(DateFormat('dd.MM').format(event.dateAdded),)))),
      DataCell(SizedBox(width: calculateWidth(context), child: Center(child: Text("${event.distance??"-- "}km".replaceAll(".", delimiter))))),
      DataCell(SizedBox(width: calculateWidth(context), child: Center(child: Text("${event.fuelConsumption??"-- "}l".replaceAll(".", delimiter))))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columns: [
          if(!oneTypeOnly)
          DataColumn(label: SizedBox(width: calculateWidth(context) - 21 * MediaQuery.of(context).devicePixelRatio, child: null)),
          DataColumn(label: SizedBox(width: calculateWidth(context), child: const Center(child: Icon(Icons.calendar_month,)))),
          DataColumn(label: SizedBox(width: calculateWidth(context), child: const Center(child: Icon(Icons.speed)))),
          DataColumn(label: SizedBox(width: calculateWidth(context), child: const Center(child: Icon(Icons.local_gas_station)))),
        ],
        rows: events.map((x) => mapEvent(x, context)).toList(growable: false),
      ),
    );
  }
}

