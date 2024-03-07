import 'package:flutter/material.dart';

import 'classUniversity.dart';
import 'firebase_islemler.dart';

class UniversityInformationPage extends StatefulWidget {
  final University university;
  final String department;
  const UniversityInformationPage(
      {Key? key, required this.university, required this.department})
      : super(key: key);
  @override
  _UniversityInformationPageState createState() =>
      _UniversityInformationPageState();
}

class _UniversityInformationPageState extends State<UniversityInformationPage> {
  final _firestoreIslemler = FirestoreIslemler();

  @override
  Widget build(BuildContext context) {
    var ekranBilgi = MediaQuery.of(context);
    final double ekranGenislik = ekranBilgi.size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: null,
              centerTitle: false,
              background: Container(
                width: ekranGenislik,
                height: 150,
                child: Image.asset(
                  "lib/assets/unilogo/${widget.university.name}.jpg",
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name: ${widget.university.name}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('City: ${widget.university.city}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('Country: ${widget.university.country}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            'Founded Year: ${widget.university.foundedYear}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Website: ${widget.university.website}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('Type: ${widget.university.type}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  'Student Reviews',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _firestoreIslemler.yorumGetir(
                      widget.university.name, widget.department),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Hata: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    final yorumlar = snapshot.data!
                        .where((yorum) =>
                            yorum['universityName'] == widget.university.name)
                        .toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: yorumlar.length,
                      itemBuilder: (context, index) {
                        final yorum = yorumlar[index];
                        return Card(
                          color: Colors.green.shade200,
                          margin: EdgeInsets.all(8),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Student",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "lib/assets/student.png"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(yorum['reviewText']),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(Icons.thumb_up,
                                        color: Colors.blue, size: 28),
                                    const SizedBox(width: 4),
                                    Icon(Icons.thumb_down,
                                        color: Colors.red, size: 28),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
