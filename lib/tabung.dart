import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tpm_uts/calendar.dart';
import 'package:tpm_uts/main_page.dart';
import 'package:tpm_uts/trapesium.dart';

class Tabung extends StatefulWidget {
  const Tabung({Key? key}) : super(key: key);

  @override
  State<Tabung> createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController heightController = TextEditingController();
  TextEditingController radiusController = TextEditingController();
  double surfaceArea = 0.0;
  double volume = 0.0;

  void _calculate() {
    double h = double.parse(heightController.text);
    double r = double.parse(radiusController.text);

    if (h <= 0 || r <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dimensions must be positive numbers')),
      );
      return;
    }

    double pi = 3.14159265359;
    surfaceArea = 2 * pi * r * (r + h);
    volume = pi * pow(r, 2) * h;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kalkulator Tabung',
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: radiusController,
                    decoration: const InputDecoration(labelText: 'Radius'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
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
                const SizedBox(height: 20,),
                Text(
                  'Luas Permukaan: $surfaceArea',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Volume: $volume',
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
