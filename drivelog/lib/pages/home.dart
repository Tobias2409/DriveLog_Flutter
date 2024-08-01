import 'package:drivelog/modals/add_entry.dart';
import 'package:drivelog/widgets/car_display.dart';
import 'package:drivelog/widgets/mileage_table.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _scrolled = false;

  _handleScroll(){
    if(_scrollController.offset >= 230 && !_scrolled) {
      setState(() {
        _scrolled = true;
      });
    }
    else if(_scrollController.offset < 230 && _scrolled){
      setState(() {
        _scrolled = false;
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: const Column(
                      children: [
                        SizedBox(height: 15,),
                        CarDisplay(),
                        SizedBox(height: 15,),
                        Text("150.000 km", style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 10,),
                        MileageTable(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 116,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  if(_scrolled)
                    const Row(
                      children: [
                        SizedBox(width: 40,),
                        SizedBox(width: 50,height: 60, child: CarDisplay(),),
                        Spacer(),
                        Text("150.000 km", style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(width: 30,),
                      ],
                    ),
                  if(_scrolled)
                    const MileageTable(onlyData: true,),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {print("Add Entry");},
        child: Transform.scale(scale: 1.5, child: const Icon(Icons.add),),
      ),
    );
  }
}
