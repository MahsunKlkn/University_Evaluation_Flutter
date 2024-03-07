class University {
  String name;
  String? city;
  String? country;
  String? type;
  int? foundedYear;
  String? website;
  int Computer_Engineering;
  int Nutrition_and_Dietetics;
  int Dentistry;
  int Electrical_and_Electronics_Engineering;
  int Nursing;
  int Civil_Engineering;
  int Mechanical_Engineering;
  int Architecture;
  int Veterinary_Medicine;
  int Industrial_Engineering;
  int Mechatronics_Engineering;
  int Software_Engineering;
  int Forest_Engineering;
  int Health_Management;
  int Business_Administration;
  int Management_Information_Systems;
  int History;
  int Turkish_Language_and_Literature;
  int Social_Work;
  int Mathematics;
  int Economics;
  int Philosophy;
  int Geography;
  int Biosystems_Engineering;
  int Biology;
  int Pharmacy;
  int Physics;
  int Law;
  int English_Language_and_Literature;
  int Interior_Architecture;
  int Landscape_Architecture;
  int Psychology;
  int Sociology;
  int German_Language_and_Literature;
  int French_Language_and_Literature;
  int Medicine;
  int Child_Development;
  int Plant_Protection;
  int Midwifery;
  int Science_Education;
  int Physiotherapy_and_Rehabilitation;
  int Food_Engineering;
  int Radio_Television_and_Cinema;
  int Social_Studies_Education;
  int Tourism_Management;
  int Turkish_Language_Education;
  int International_Relations;
  int Elementary_Education;
  int Preschool_Education;
  int Aircraft_Engineering;

  University({
    required this.name,
    required this.city,
    required this.foundedYear,
    required this.website,
    required this.type,
    required this.country,
    this.Computer_Engineering = 0,
    this.Nutrition_and_Dietetics = 0,
    this.Dentistry = 0,
    this.Electrical_and_Electronics_Engineering = 0,
    this.Nursing = 0,
    this.Civil_Engineering = 0,
    this.Mechanical_Engineering = 0,
    this.Architecture = 0,
    this.Veterinary_Medicine = 0,
    this.Industrial_Engineering = 0,
    this.Mechatronics_Engineering = 0,
    this.Software_Engineering = 0,
    this.Forest_Engineering = 0,
    this.Health_Management = 0,
    this.Business_Administration = 0,
    this.Management_Information_Systems = 0,
    this.History = 0,
    this.Turkish_Language_and_Literature = 0,
    this.Social_Work = 0,
    this.Mathematics = 0,
    this.Economics = 0,
    this.Philosophy = 0,
    this.Geography = 0,
    this.Biosystems_Engineering = 0,
    this.Biology = 0,
    this.Pharmacy = 0,
    this.Physics = 0,
    this.Law = 0,
    this.English_Language_and_Literature = 0,
    this.Interior_Architecture = 0,
    this.Landscape_Architecture = 0,
    this.Psychology = 0,
    this.Sociology = 0,
    this.German_Language_and_Literature = 0,
    this.French_Language_and_Literature = 0,
    this.Medicine = 0,
    this.Child_Development = 0,
    this.Plant_Protection = 0,
    this.Midwifery = 0,
    this.Science_Education = 0,
    this.Physiotherapy_and_Rehabilitation = 0,
    this.Food_Engineering = 0,
    this.Radio_Television_and_Cinema = 0,
    this.Social_Studies_Education = 0,
    this.Tourism_Management = 0,
    this.Turkish_Language_Education = 0,
    this.International_Relations = 0,
    this.Elementary_Education = 0,
    this.Preschool_Education = 0,
    this.Aircraft_Engineering = 0,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['Adı'] ?? '',
      city: json['İli'] ?? '',
      country: 'Türkiye',
      type: json['Türü'] ?? '',
      foundedYear: json['Kuruluş'] != null ? int.parse(json['Kuruluş']) : null,
      website: json['İnternet Sitesi'] ?? '',
      Computer_Engineering: json['Bilgisayar Mühendisliği'] != null
          ? int.parse(json['Bilgisayar Mühendisliği'])
          : 0,
      Nutrition_and_Dietetics: json['Beslenme ve Diyetetik'] != null
          ? int.parse(json['Beslenme ve Diyetetik'])
          : 0,
      Dentistry:
          json['Diş Hekimliği'] != null ? int.parse(json['Diş Hekimliği']) : 0,
      Electrical_and_Electronics_Engineering:
          json['Elektrik-Elektronik Mühendisliği'] != null
              ? int.parse(json['Elektrik-Elektronik Mühendisliği'])
              : 0,
      Nursing: json['Hemşirelik'] != null ? int.parse(json['Hemşirelik']) : 0,
      Civil_Engineering: json['İnşaat Mühendisliği'] != null
          ? int.parse(json['İnşaat Mühendisliği'])
          : 0,
      Mechanical_Engineering: json['Makine Mühendisliği'] != null
          ? int.parse(json['Makine Mühendisliği'])
          : 0,
      Architecture: json['Mimarlık'] != null ? int.parse(json['Mimarlık']) : 0,
      Veterinary_Medicine:
          json['Veterinerlik'] != null ? int.parse(json['Veterinerlik']) : 0,
      Industrial_Engineering: json['Endüstri Mühendisliği'] != null
          ? int.parse(json['Endüstri Mühendisliği'])
          : 0,
      Mechatronics_Engineering: json['Mekatronik Mühendisliği'] != null
          ? int.parse(json['Mekatronik Mühendisliği'])
          : 0,
      Software_Engineering: json['Yazılım Mühendisliği'] != null
          ? int.parse(json['Yazılım Mühendisliği'])
          : 0,
      Forest_Engineering: json['Orman Mühendisliği'] != null
          ? int.parse(json['Orman Mühendisliği'])
          : 0,
      Health_Management: json['Sağlık Yönetimi'] != null
          ? int.parse(json['Sağlık Yönetimi'])
          : 0,
      Business_Administration:
          json['İşletme'] != null ? int.parse(json['İşletme']) : 0,
      Management_Information_Systems: json['Yönetim Bilişim Sistemleri'] != null
          ? int.parse(json['Yönetim Bilişim Sistemleri'])
          : 0,
      History: json['Tarih'] != null ? int.parse(json['Tarih']) : 0,
      Turkish_Language_and_Literature: json['Türk Dili ve Edebiyatı'] != null
          ? int.parse(json['Türk Dili ve Edebiyatı'])
          : 0,
      Social_Work:
          json['Sosyal Hizmet'] != null ? int.parse(json['Sosyal Hizmet']) : 0,
      Mathematics: json['Matematik'] != null ? int.parse(json['Matematik']) : 0,
      Economics: json['İktisat'] != null ? int.parse(json['İktisat']) : 0,
      Philosophy: json['Felsefe'] != null ? int.parse(json['Felsefe']) : 0,
      Geography: json['Coğrafya'] != null ? int.parse(json['Coğrafya']) : 0,
      Biosystems_Engineering: json['Biyosistem Mühendisliği'] != null
          ? int.parse(json['Biyosistem Mühendisliği'])
          : 0,
      Biology: json['Biyoloji'] != null ? int.parse(json['Biyoloji']) : 0,
      Pharmacy: json['Eczacılık'] != null ? int.parse(json['Eczacılık']) : 0,
      Physics: json['Fizik'] != null ? int.parse(json['Fizik']) : 0,
      Law: json['Hukuk'] != null ? int.parse(json['Hukuk']) : 0,
      English_Language_and_Literature: json['İngiliz Dili ve Edebiyatı'] != null
          ? int.parse(json['İngiliz Dili ve Edebiyatı'])
          : 0,
      Interior_Architecture:
          json['İç Mimarlık'] != null ? int.parse(json['İç Mimarlık']) : 0,
      Landscape_Architecture: json['Peysaj Mimarlığı'] != null
          ? int.parse(json['Peysaj Mimarlığı'])
          : 0,
      Psychology: json['Psikoloji'] != null ? int.parse(json['Psikoloji']) : 0,
      Sociology: json['Sosyoloji'] != null ? int.parse(json['Sosyoloji']) : 0,
      German_Language_and_Literature: json['Alman Dili ve Edebiyatı'] != null
          ? int.parse(json['Alman Dili ve Edebiyatı'])
          : 0,
      French_Language_and_Literature: json['Fransız Dili ve Edebiyatı'] != null
          ? int.parse(json['Fransız Dili ve Edebiyatı'])
          : 0,
      Medicine: json['Tıp'] != null ? int.parse(json['Tıp']) : 0,
      Child_Development: json['Çocuk Gelişimi'] != null
          ? int.parse(json['Çocuk Gelişimi'])
          : 0,
      Plant_Protection:
          json['Bitki Koruma'] != null ? int.parse(json['Bitki Koruma']) : 0,
      Midwifery: json['Ebelik'] != null ? int.parse(json['Ebelik']) : 0,
      Science_Education: json['Fen Bilgisi Öğretmenliği'] != null
          ? int.parse(json['Fen Bilgisi Öğretmenliği'])
          : 0,
      Physiotherapy_and_Rehabilitation:
          json['Fizyoterapi ve Rehabilitasyon'] != null
              ? int.parse(json['Fizyoterapi ve Rehabilitasyon'])
              : 0,
      Food_Engineering: json['Gıda Mühendisliği'] != null
          ? int.parse(json['Gıda Mühendisliği'])
          : 0,
      Radio_Television_and_Cinema: json['Radyo, Televizyon ve Sinema'] != null
          ? int.parse(json['Radyo, Televizyon ve Sinema'])
          : 0,
      Social_Studies_Education: json['Sosyal Bilgiler Öğretmenliği'] != null
          ? int.parse(json['Sosyal Bilgiler Öğretmenliği'])
          : 0,
      Tourism_Management: json['Turizm İşletmeciliği'] != null
          ? int.parse(json['Turizm İşletmeciliği'])
          : 0,
      Turkish_Language_Education: json['Türkçe Öğretmenliği'] != null
          ? int.parse(json['Türkçe Öğretmenliği'])
          : 0,
      International_Relations: json['Uluslararası İlişkiler'] != null
          ? int.parse(json['Uluslararası İlişkiler'])
          : 0,
      Elementary_Education: json['Sınıf Öğretmenliği'] != null
          ? int.parse(json['Sınıf Öğretmenliği'])
          : 0,
      Preschool_Education: json['Okul Öncesi Öğretmenliği'] != null
          ? int.parse(json['Okul Öncesi Öğretmenliği'])
          : 0,
      Aircraft_Engineering: json['Uçak Mühendisliği'] != null
          ? int.parse(json['Uçak Mühendisliği'])
          : 0,
    );
  }
}