import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MileageTable extends StatelessWidget {
  const MileageTable({super.key, this.onlyData = false});

  final bool onlyData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columns: [
          DataColumn(label: SizedBox(width: MediaQuery.sizeOf(context).width / 5, child: const Center(child: Icon(Icons.calendar_month,)))),
          DataColumn(label: SizedBox(width: MediaQuery.sizeOf(context).width / 5, child: const Center(child: Icon(Icons.speed)))),
          DataColumn(label: SizedBox(width: MediaQuery.sizeOf(context).width / 5, child: const Center(child: Icon(Icons.local_gas_station)))),
        ],
        rows: onlyData?[]: [
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("1")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("2")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("3")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("5")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("6")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("7")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("8")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("22.12")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("22.12")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("22.12")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("22.12")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("22.12")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("22.12")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
          ]),
          DataRow(cells: [
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("22.12")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("4500km")))),
            DataCell(SizedBox(width: MediaQuery.sizeOf(context).width / 5,child: const Center(child: Text("45l")))),
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