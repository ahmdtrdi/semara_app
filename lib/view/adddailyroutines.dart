import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semara_app/components/inputdaily.dart';
import 'package:semara_app/components/inputroutines.dart';
import 'package:semara_app/utils.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:semara_app/view/dailyroutines_2.dart';

class AddDailyRoutines extends StatefulWidget {
  const AddDailyRoutines({super.key});

  @override
  State<AddDailyRoutines> createState() => _AddDailyRoutinesState();
}

class _AddDailyRoutinesState extends State<AddDailyRoutines> {
  final TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: turbo300,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80, left: 20),
            height: 250,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Buat Aktivitas",
                        style: mobileH4.copyWith(color: Colors.black),
                      ),
                      Image.asset(
                        "assets/icons/calender.png",
                        width: 45,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InputRoutines(
                      hint: "Nama Kegiatan", controller: _titleController),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        "Detail Aktifivitas",
                        style: bodyText14.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InputDaily(
                    title: "Tanggal",
                    width: 360.0,
                    hint: DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                        onPressed: () {
                          _getDataFromUser();
                        },
                        icon: Image.asset(
                          "assets/icons/calendar.png",
                          width: 24,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InputDaily(
                    title: "Waktu Mulai",
                    width: 150.0,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartTime: true);
                      },
                      icon: Image.asset(
                        "assets/icons/clock.png",
                        width: 30,
                      ),
                    ),
                    hint: _startTime,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InputDaily(
                    title: "Waktu Selesai",
                    hint: _endTime,
                    width: 150.0,
                    widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Image.asset(
                          "assets/icons/clock.png",
                          width: 30,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 49,
              ),
              Row(
                children: [
                  InputDaily(
                    title: "Remind",
                    width: 360.0,
                    hint: "$_selectedRemind minutes early",
                    widget: DropdownButton(
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      },
                      icon: Image.asset(
                        "assets/icons/chevron-down.png",
                        width: 30,
                      ),
                      items:
                          remindList.map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 41,
              ),
              Row(
                children: [
                  InputDaily(
                    title: "Repeat",
                    width: 360.0,
                    hint: "$_selectedRepeat",
                    widget: DropdownButton(
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      },
                      icon: Image.asset(
                        "assets/icons/chevron-down.png",
                        width: 30,
                      ),
                      items: repeatList
                          .map<DropdownMenuItem<String>>((String? Value) {
                        return DropdownMenuItem<String>(
                          value: Value,
                          child: Text(
                            Value!,
                            style: bodyText17.copyWith(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 44,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  width: 385,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DailyRoutines2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: turbo950),
                    child: Text(
                      "Selesai",
                      style: bodyText16.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _getDataFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2124));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print("It's Null or Something Wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) {
    var pickedTime = _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("time canceled");
    } else if (isStartTime == true) {
      _startTime = _formatedTime;
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(hour: 9, minute: 10));
  }
}
