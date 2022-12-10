import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Package extends StatefulWidget {
  const Package({Key? key}) : super(key: key);

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  String selectTime = '';
  String selectDay = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: Center(child: Text("Hello World", style: GoogleFonts.monteCarlo())),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    selectTime =
                        '${value?.hour ?? TimeOfDay.now().hour} : ${value?.minute ?? TimeOfDay.now().minute}';
                    setState(() {});
                  });
                },
                child: Text("Selected time: $selectTime")),
            Text(
              TimeOfDay.now().toString(),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              DateTime.now().toString(),
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(
                      Duration(days: 365 * 10),
                    ),
                    lastDate: DateTime.now().add(
                      Duration(days: 365 * 10),
                    ),
                  ).then((value) {
                    selectDay =
                        "${value?.year ?? 0}- ${value?.month ?? 0} - ${value?.day ?? 0}";
                    setState(() {});
                  });
                },
                child: Text("Selected day: $selectDay")),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CupertinoTimerPicker(
                            onTimerDurationChanged: (Duration value) {
                          print(value);
                        });
                      });
                },
                child: Text("Cupertino Time")),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            onDateTimeChanged: (value) {
                              print(value);
                            });
                      });
                },
                child: Text("Cupertino Date"))
          ],
        ),
      ),
    );
  }
}
