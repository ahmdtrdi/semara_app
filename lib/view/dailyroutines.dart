import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/adddailyroutines.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DailyRoutines extends StatefulWidget {
  const DailyRoutines({super.key});

  @override
  State<DailyRoutines> createState() => _DailyRoutinesState();
}

class _DailyRoutinesState extends State<DailyRoutines> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: turbo300,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 85, left: 40),
                child: Text(
                  "Halo\nSahabat Senja",
                  style: mobileH4.copyWith(color: turbo950),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 140, // Adjust button width as needed
                height: 50, // Adjust button height as needed
                child: ElevatedButton(
                  onPressed: () {
                    //  Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => //),
                    //);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Adjust corner radius
                      ),
                      backgroundColor: turbo950 // Adjust button color
                      ),
                  child: Text(
                    "Jelajahi", // Replace with your button text
                    style: bodyText14.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600), // Adjust text color
                  ),
                ),
              ),
              SizedBox(
                width: 140, // Adjust button width as needed
                height: 50, // Adjust button height as needed
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddDailyRoutines()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Adjust corner radius
                      ),
                      backgroundColor: turbo950 // Adjust button color
                      ),
                  child: Text(
                    "Buat Rutinitas", // Replace with your button text
                    style: bodyText14.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600), // Adjust text color
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 354,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hari Ini",
                          style: mobileH2.copyWith(color: turbo950),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Expanded(
                        child: DatePicker(
                      DateTime.now(),
                      width: 48,
                      height: 68,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: turbo900,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        _selectedDate = date;
                      },
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
