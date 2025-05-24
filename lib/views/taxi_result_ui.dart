// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaxiResultUi extends StatefulWidget {
  final double? distance;

  final double? carstuck;

  final double? total;

  TaxiResultUi({super.key, this.distance, this.carstuck, this.total});

  @override
  State<TaxiResultUi> createState() => _TaxiResultUiState();
}

class _TaxiResultUiState extends State<TaxiResultUi> {
  @override
  Widget build(BuildContext context) {
    NumberFormat fm = NumberFormat('#,###,##0.0#');
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
                  height: 20,
                ),
                Text(
                  '---ค่าแท็กซี่---',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ระยะทาง : ${widget.distance} กม.',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'เวลารถติด : ${widget.carstuck} นาที',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ค่าแท็กซี่รวม : ${fm.format(widget.total)} บาท',
                  style: TextStyle(
                    fontSize: 25,
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
