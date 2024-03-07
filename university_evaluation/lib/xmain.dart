import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'add_review.dart';
import 'classUniversity.dart';
import 'university_information_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<University>> futureUniversities;
  List<University>? universities;
  University? selectedUniversity;
  String? selectedDepartment;

  @override
  void initState() {
    super.initState();
    futureUniversities = fetchUniversities();
  }

  Future<List<University>> fetchUniversities() async {
    final response =
        await rootBundle.loadString('lib/assets/universities.json');
    final List<dynamic> list = jsonDecode(response);
    universities = list.map((json) => University.fromJson(json)).toList();
    return list.map((json) => University.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgi = MediaQuery.of(context);
    final double ekranGenislik = ekranBilgi.size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
            child: Text("University Evaluation",
                style: TextStyle(color: Colors.black87))),
        backgroundColor: Colors.grey.shade600,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black87),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: ekranGenislik,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/University.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            Center(
              child: Image.asset(
              "lib/assets/graduate.png",
              width: 100.0,
              height: 100.0,
              color: Colors.black, // You can customize the color if needed
                        ),
            ),


            SizedBox(height: 70,),
            */
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Colors.white,
                child: FutureBuilder<List<University>>(
                  future: futureUniversities,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<University>(
                          value: selectedUniversity,
                          onChanged: (University? newValue) {
                            setState(() {
                              selectedUniversity = newValue;
                            });
                          },
                          items:
                              snapshot.data!.map<DropdownMenuItem<University>>(
                            (University university) {
                              String trimmedName = university.name.length > 50
                                  ? university.name.substring(0, 40) + "..."
                                  : university.name;

                              return DropdownMenuItem<University>(
                                value: university,
                                child: SizedBox(
                                  width: 320.0,
                                  child: Text(trimmedName),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
            SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                child: DropdownButton<String>(
                  value: selectedDepartment,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDepartment = newValue;
                    });
                  },
                  items: <String>[
                    'Computer engineering',
                    'Nutrition and Dietetics',
                    'Dentist',
                    'Electrical electronics Engineering',
                    'Nursing'
                        'Civil Engineering',
                    'Mechanical Engineering',
                    'Architecture',
                    'Veterinary medicine',
                    'Maritime Transpor. Managem. Engineering',
                    'Industrial Engineering',
                    'Mechatronic Engineering',
                    'Software engineering',
                    'Forest engineering',
                    'Healthcare Management',
                    'Business',
                    'Management information systems',
                    'History',
                    'Turkish language and literature',
                    'Social service'
                        'Maths',
                    'Economy',
                    'Philosophy',
                    'Geography',
                    'Biosystems Engineering',
                    'Biology',
                    'Pharmacy'
                        'Physical',
                    'Law',
                    'English Language and Literature',
                    'Interior architecture'
                        'Landscape Architecture',
                    'Psychology',
                    'Sociology',
                    'German language and literature',
                    'French Language and Literature',
                    'Fly',
                    'Child Development',
                    'Plant protection'
                        'Midwifery'
                        'Science teacher',
                    'Physical therapy and rehabilitation',
                    'The food Engineering',
                    'Radio, Television and Cinema',
                    'Social studies teacher',
                    'Tourism management',
                    'Turkish teacher',
                    'International relations',
                    'Classroom teaching',
                    'Pre-school teaching',
                    'Aeronautical Engineering'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedUniversity == null || selectedDepartment == null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Missing Information'),
                        content: Text(
                            'Please select both university and department.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UniversityInformationPage(
                        university: selectedUniversity!,
                        department: selectedDepartment!,
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: const Text(
                'University Information',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        YorumEkle(universities: universities!),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                'Add review',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
