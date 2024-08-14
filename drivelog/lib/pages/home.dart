import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/modals/add_entry.dart';
import 'package:drivelog/services/car_service.dart';
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

  final _carService = CarService.getInstance();
  List<CarDAO> _cars = [];

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
    _getCars();
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  _getCars() async{
    var result = await _carService.getCars();

    setState(() {
      _cars = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _cars.isEmpty ? const Text("no items") : Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        const SizedBox(height: 15,),
                        CarDisplay(color: _cars[0].modelColor,),
                        const SizedBox(height: 15,),
                        const Text("150.000 km", style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 10,),
                        const MileageTable(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: _scrolled,
              child: Container(
                height: 116,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                      Row(
                        children: [
                          const SizedBox(width: 40,),
                          SizedBox(width: 50,height: 60, child: CarDisplay(color: _cars[0].modelColor,),),
                          const Spacer(),
                          const Text("150.000 km", style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(width: 30,),
                        ],
                      ),
                      const MileageTable(onlyData: true,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
          AddEntryModal.show(context);
        },
        child: Transform.scale(scale: 1.5, child: const Icon(Icons.add),),
      ),
    );
  }
}
