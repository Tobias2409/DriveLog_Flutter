import 'package:drivelog/helpers/delimiter_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';

class MileageTable extends StatefulWidget {
  const MileageTable({super.key, required this.events});

  final List<Event> events;

  @override
  State<MileageTable> createState() => _MileageTableState();
}

class _MileageTableState extends State<MileageTable> {

  String delimiter = "x";

  @override
  void initState() {
    super.initState();

    DelimiterHelper.getDelimiter(context).then((x) => setState(() {
      delimiter = x;
    }));
  }

  DataRow mapEvent(Event event,  BuildContext context){
    return DataRow(cells: [
      DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: Center(child: Text(DateFormat('dd.MM').format(event.dateAdded),)))),
      DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: Center(child: Text("${event.distance}km".replaceAll(".", delimiter))))),
      DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: Center(child: Text("${event.fuelConsumption}l")))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columns: [
          DataColumn(label: SizedBox(width: MediaQuery.sizeOf(context).width / 5, child: const Center(child: Icon(Icons.calendar_month,)))),
          DataColumn(label: SizedBox(width: MediaQuery.sizeOf(context).width / 5, child: const Center(child: Icon(Icons.speed)))),
          DataColumn(label: SizedBox(width: MediaQuery.sizeOf(context).width / 5, child: const Center(child: Icon(Icons.local_gas_station)))),
        ],
        rows: widget.events.map((x) => mapEvent(x, context)).toList(growable: false),
      ),
    );
  }
}

