import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils.dart';

import 'package:tpm_uts/main_page.dart';
import 'package:tpm_uts/tabung.dart';
import 'package:tpm_uts/trapesium.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Timer _timer;
  String _timeString = '';

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime = DateFormat('h:mm:ss a').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jam & Kalender',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ExpansionTile(
                leading: const Icon(Icons.calculate),
                title: const Text('Bangun Datar'),
                childrenPadding: const EdgeInsets.only(left: 20),
                children: [
                  ListTile(
                    title: const Text('Trapesium'),
                    onTap: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Trapesium();
                          })
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Tabung'),
                    onTap: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Tabung();
                          })
                      );
                    },
                  )
                ],
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Kalender'),
                onTap: () {

                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MainPage();
                      })
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              _timeString,
              style: const TextStyle(
                fontSize: 50
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TableCalendar(
              focusedDay: _focusedDay,
              firstDay: kFirstDay,
              lastDay: kLastDay,
              calendarFormat: _calendarFormat,
            ),
          )
        ],
      ),
    );
  }
}
