import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpm_uts/calendar.dart';
import 'package:tpm_uts/tabung.dart';
import 'package:tpm_uts/trapesium.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Main Page',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
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

                },
              )
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  'assets/images/rowang.jpg',
                  fit: BoxFit.cover,
                  width: 200, height: 200,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  'Rowang Pramudito',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'NIM: 123200098',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Kelas: IF-H',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Tempat, tanggal lahir: Klaten, 21 Desember 2001',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Cita-cita: Graphic designer, seniman, animator, web-developer, AI engineer',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
