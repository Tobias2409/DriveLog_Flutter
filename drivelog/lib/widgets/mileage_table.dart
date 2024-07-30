import 'package:flutter/material.dart';

class MileageTable extends StatelessWidget {
  const MileageTable({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columns: const [
          DataColumn(label: Expanded(child: Icon(Icons.calendar_month))),
          DataColumn(label: Expanded(child: Icon(Icons.speed))),
          DataColumn(label: Expanded(child: Icon(Icons.local_gas_station))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
          DataRow(cells: [
            DataCell(Center(child: Text("22.12"))),
            DataCell(Center(child: Text("450km"))),
            DataCell(Center(child: Text("45l"))),
          ]),
        ]),
    );
  }
}


/*
Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
              },
              children: const [
                TableRow(
                  children: [
                    TableCell(child: Icon(Icons.calendar_month)),
                    TableCell(child: Icon(Icons.speed)),
                    TableCell(child: Icon(Icons.local_gas_station)),
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(child: Text("02.12")),
                    TableCell(child: Text("650km")),
                    TableCell(child: Text("45l")),
                  ]
                ),
              ],
            ),
 */