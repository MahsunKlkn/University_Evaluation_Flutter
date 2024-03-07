import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'classUniversity.dart';
import 'firebase_islemler.dart';

class YorumEkle extends StatefulWidget {
  final List<University> universities;

  const YorumEkle({
    Key? key,
    required this.universities,
  }) : super(key: key);

  @override
  _YorumEkleState createState() => _YorumEkleState();
}

class _YorumEkleState extends State<YorumEkle> {
  var Adi = TextEditingController();
  var Soyadi = TextEditingController();
  var kullaniciMail = TextEditingController();
  var kategori1 = "Dentist";
  var unvan = false;
  var yorum = TextEditingController();
  int? _satisfactionRating;

  University? selectedUniversity;
  late Future<List<University>> futureUniversities;

  @override
  void initState() {
    super.initState();
    futureUniversities = fetchUniversities();
  }

  Future<List<University>> fetchUniversities() async {
    final response =
        await rootBundle.loadString('lib/assets/universities.json');
    final List<dynamic> list = jsonDecode(response);
    return list.map((json) => University.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgi = MediaQuery.of(context);
    final double ekranGenislik = ekranBilgi.size.width;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Yorum Ekle"),
        backgroundColor: Colors.grey.shade600,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: ekranGenislik,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/University.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: Adi,
                  decoration: const InputDecoration(
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: Soyadi,
                  decoration: const InputDecoration(
                    hintText: "FullName",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: kullaniciMail,
                  decoration: const InputDecoration(
                    hintText: "Mail",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: FutureBuilder<List<University>>(
                  future: futureUniversities,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        children: [
                          Expanded(
                            child: DropdownButton<University>(
                              value: selectedUniversity,
                              onChanged: (University? newValue) {
                                setState(() {
                                  selectedUniversity = newValue;
                                });
                              },
                              items: snapshot.data!
                                  .map<DropdownMenuItem<University>>(
                                (University university) {
                                  String trimmedName = university.name.length >
                                          50
                                      ? university.name.substring(0, 40) + "..."
                                      : university.name;

                                  return DropdownMenuItem<University>(
                                    value: university,
                                    child: SizedBox(
                                      width: 340.0,
                                      child: Text(trimmedName),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField<String>(
                  value: kategori1,
                  onChanged: (newValue) {
                    setState(() {
                      kategori1 = newValue!;
                    });
                  },
                  items: [
                    'Computer engineering',
                    'Nutrition and Dietetics',
                    'Dentist',
                    'Electrical electronics Engineering',
                    'Nursing',
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
                    'Social service',
                    'Maths',
                    'Economy',
                    'Philosophy',
                    'Geography',
                    'Biosystems Engineering',
                    'Biology',
                    'Pharmacy',
                    'Physical',
                    'Law',
                    'English Language and Literature',
                    'Interior architecture',
                    'Landscape Architecture',
                    'Psychology',
                    'Sociology',
                    'German language and literature',
                    'French Language and Literature',
                    'Fly',
                    'Child Development',
                    'Plant protection',
                    'Midwifery',
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
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bir bölüm seçin.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Öğrencimisiniz ?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Checkbox(
                        value: unvan,
                        onChanged: (value) {
                          setState(() {
                            unvan = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: 'üniversiteye vereceğiniz puan',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  items: <int>[1, 2, 3, 4, 5].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onSaved: (value) {
                    _satisfactionRating = value;
                  },
                  onChanged: (int? value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: yorum,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Lütfen Yorumunuzu Belirtiniz",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedUniversity == null) {
                      print('Lütfen bir üniversite seçiniz.');
                      return;
                    }

                    String fullname = "${Adi.text} ${Soyadi.text}";
                    FirestoreIslemler()
                        .veriEklemeAdd(
                            departmentName: kategori1,
                            universityName: selectedUniversity!.name,
                            reviewerFullName: fullname,
                            reviewText: yorum.text,
                            mailAdress: kullaniciMail.text,
                            score: _satisfactionRating != null
                                ? _satisfactionRating.toString()
                                : '0',
                            isStudent: unvan)
                        .then((_) {
                      print('Yorum başarıyla eklendi.');

                      yorum.clear();
                      kullaniciMail.clear();
                      Adi.clear();
                      Soyadi.clear();
                      selectedUniversity = null;
                    }).catchError((error) {
                      print('Hata oluştu: $error');
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Kaydet"),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(120, 50),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
