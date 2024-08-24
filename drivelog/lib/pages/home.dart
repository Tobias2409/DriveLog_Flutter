import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/helpers/observer.dart';
import 'package:drivelog/modals/add_entry.dart';
import 'package:drivelog/services/car_service.dart';
import 'package:drivelog/widgets/car_display.dart';
import 'package:drivelog/widgets/mileage_table.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  late final Observer _observer;

  bool _scrolled = false;
  var _mileage = 0;

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
    _getEventData();
    _scrollController.addListener(_handleScroll);

    _observer = Observer(_getEventData);
    _carService.subscribe(_observer);
    super.initState();
  }

  @override
  void dispose() {
    _carService.unsubscribe(_observer);
    super.dispose();
  }

  _getCars() async{
    var result = await _carService.getCars();
    setState(() {
      _cars = result;
    });
  }

  _getEventData() async{
    var result = await _carService.getMileage(1);
    setState(() {
      _mileage = result.round();
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
                         Text("$_mileage km", style: const TextStyle(
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
                          Text("$_mileage km", style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(width: 30,),
                        ],
                      ),
                      const MileageTable(onlyHeader: true,),
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
