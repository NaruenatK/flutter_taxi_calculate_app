// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/taxi_result_ui.dart';

class TaxiHomeUi extends StatefulWidget {
  const TaxiHomeUi({super.key});

  @override
  State<TaxiHomeUi> createState() => _TaxiHomeUiState();
}

class _TaxiHomeUiState extends State<TaxiHomeUi> {
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController carstuckController = TextEditingController();

  _warningDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
        ),
        content: Text(
          msg,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            onPressed: () {
              Navigator.pop(context); //ปิด Dialog
            },
            child: Text(
              'Ok',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'คำนวนค่าแท็กซี่',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 16.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/taxi.png',
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  'assets/images/taxi1.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: distanceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                    labelText: 'ระยะทาง (กิโลเมตร)',
                    hintText: 'ป้อนระยะทาง',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: carstuckController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                    labelText: 'เวลารถติดวง (นาที)',
                    hintText: 'ป้อนเวลารถติด (ไม่มีป้อน 0)',
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (distanceController.text.isEmpty) {
                      _warningDialog('ป้อนเวลารถติด..!!!');
                    } else if (carstuckController.text.isEmpty) {
                      _warningDialog('ป้อนอระยะทางด้วย..!!!');
                    } else {
                      double distance = double.parse(distanceController.text);
                      double carstuck = double.parse(carstuckController.text);
                      double firstDistance = 35;
                      double secondDistance = distance - 1;
                      double total = firstDistance +
                          (secondDistance * 5.5) +
                          (carstuck * 0.5);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaxiResultUi(
                            total: total,
                            distance: distance,
                            carstuck: carstuck,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('คํานวน',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    minimumSize: Size(400, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    distanceController.clear();
                    carstuckController.clear();
                  },
                  child: Text('ยกเลิก',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(400, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
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
