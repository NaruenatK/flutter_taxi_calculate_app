import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/taxi_home_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterSpeedUi());
}

class FlutterSpeedUi extends StatefulWidget {
  const FlutterSpeedUi({super.key});

  @override
  State<FlutterSpeedUi> createState() => _FlutterSpeedUiState();
}

class _FlutterSpeedUiState extends State<FlutterSpeedUi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaxiHomeUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
