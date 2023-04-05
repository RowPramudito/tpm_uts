import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tpm_uts/calendar.dart';
import 'package:tpm_uts/main_page.dart';
import 'package:tpm_uts/tabung.dart';

class Trapesium extends StatefulWidget {
  const Trapesium({Key? key}) : super(key: key);

  @override
  State<Trapesium> createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController base1Controller = TextEditingController();
  TextEditingController base2Controller = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double area = 0.0;
  double circumference = 0.0;

  void _calculate() {
    double b1 = double.parse(base1Controller.text);
    double b2 = double.parse(base2Controller.text);
    double h = double.parse(heightController.text);

      if (b1 <= 0 || b2 <= 0 || h <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sisi harus memiliki angka positif.')),
        );
        return;
      }

    double c = sqrt(pow((b1 - b2) / 2, 2) + pow(h, 2));
    double perimeter = b1 + b2 + 2 * c;
    area = ((b1 + b2) / 2) * h;
    circumference = perimeter;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kalkulator Trapesium',
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Calendar();
                      })
                  );
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: base1Controller,
                    decoration: const InputDecoration(labelText: 'Sisi 1'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: base2Controller,
                    decoration: const InputDecoration(labelText: 'Sisi 2'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: heightController,
                    decoration: const InputDecoration(labelText: 'Tinggi'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 110,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculate();
                      }
                    },
                    child: const Text('Hitung'),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Luas: $area',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Keliling: $circumference',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
