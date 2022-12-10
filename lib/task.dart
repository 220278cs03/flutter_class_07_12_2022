import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  String data = '';
  String time = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Date time picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Choose Data"),
            SizedBox(height: 70,),
            InkWell(
              child: Container(
                color:Colors.grey.withOpacity(0.4),
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    data
                  ),
                ),
              ),
              onTap: (){
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
                    data =
                    "${value?.month ?? DateTime.now().month}/${value?.day ?? DateTime.now().day}/${value?.year
                        ?? DateTime.now().year}";
                  setState(() {});
                });
              },
            ),
            SizedBox(height: 200,),
            Text("Choose Time"),
            SizedBox(height: 70,),
            InkWell(
              child: Container(
                color:Colors.grey.withOpacity(0.4),
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                      time
                  ),
                ),
              ),
              onTap: (){
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  time =
                  "${value?.hour ?? TimeOfDay.now().hour}:${value?.minute ?? TimeOfDay.now().minute}";
                  setState(() {});
                });
              },
            )
          ],
        ),
      ),
    ));
  }
}
