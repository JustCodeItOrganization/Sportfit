import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_application_2/core/init/database_manager.dart';
import 'package:flutter_application_2/model/profile_model.dart';
import 'package:flutter_application_2/view_model/utility_functions_view_model.dart';
import 'package:flutter_application_2/widgets/dropdown_button.dart';
import './profile_storage.dart';
import './../widgets/styled_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

List<String> goalSelectionItems = [
  "Kilo Almak",
  "Kilo Vermek",
  "Stabil Kalmak"
];
List<String> genderSelectionItems = ["Erkek", "Kadın"];
//List<String> fitnessLevelSelectionItems = ['1', '2', '3', '4', '5'];
List<String> fitnessLevelSelectionItems = <String>[
  'Sedanter (0 gün spor)',
  'Az aktif (1-3 gün spor)',
  'Ortalama akttif (3-5 gün spor)',
  'Çok aktif (6-7 gün spor)',
  'Ekstra aktif (profesyonel performans)'
];

class _ProfileViewState extends State<ProfileView> {
  bool genderF = true;
  int fitnesslevelF = 1;
  int goalF = 0;
  double target_calorie = 0;

  String fitnessLevel = fitnessLevelSelectionItems.first;
  double weight = 0;
  double height = 0;
  int age = 0;

  String selectedGender = 'Erkek';
  String gender = 'Erkek';
  bool isProfileFetched = false;
  String goal = "Kilo Almak";
  final _formKey = GlobalKey<FormState>();
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  final _ageTextController = TextEditingController();
  late Future<Profile> futureProfile;
  final DatabaseManager _db = DatabaseManager();
  bool fitnessLevelReady = false;
  bool goalReady = false;
  bool bodyReady = false;
  List<Map>? data;
  // 1 -> sedentary (little to no exercise)
  // 2 -> lightly active (light exercise 1–3 days per week)
  // 3 -> moderately active (moderate exercise 3–5 days per week)
  // 4 -> very active (hard exercise 6–7 days per week)
  // 5 -> extra active (very hard exercise, training, or a physical job)

  @override
  void initState() {
    super.initState();
    futureProfile = Profile.readProfileFromStorage();
  }

  Future<Profile> getProfile() async {
    data = await _db.get('Profile');

    return Profile(
        data![0]['weight'],
        data![0]['height'],
        data![0]['age'],
        data![0]['fitnessLevel'].toString(),
        data![0]['gender'],
        (data![0]['calorieGoal']));
  }

  Future<Profile> getProfileFromStorage() async {
    await initDatabase();
    List<Map>? data = await _db.get('Profile');
    print("MY DATA:  " + data.toString());
    print(data!.length);
    if (data!.length > 0) {
      setState(() {
        isProfileFetched = true;
      });
    }
    return Profile.readProfileFromStorage();
  }

  Future<void> insertProfile(Profile2 p) async {
    print(p.toJson());
    _db.insert("Profile", p.toJson());
  }

  Future<void> initDatabase() async {
    await _db.init();
  }

  _ProfileViewState() {
    getProfileFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //appBar: AppBar(title: const Text('Profilim')),
            body: SingleChildScrollView(
      child: FutureBuilder(
          future: futureProfile,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              if (isProfileFetched) {
                Profile profile = snapshot.data as Profile;
                weight = profile.weight;
                height = profile.height;
                age = profile.age;
                gender = profile.gender;
                fitnessLevel = profile.fitnessLevel.toString();
                isProfileFetched = true;
                goal = profile.goal;

                print(weight);
                /*
                  height = data![data!.length - 1]['height'];
                  age = data![data!.length - 1]['age'];
                  fitnessLevel = data![data!.length - 1]['fitnessLevel'];
                  gender = data![data!.length - 1]['gender'];
                  goal = data![data!.length - 1]['calorieGoal'];
                  */
              } else {
                Profile profile = snapshot.data as Profile;
                weight = profile.weight;
                height = profile.height;
                age = profile.age;
                gender = profile.gender;
                fitnessLevel = profile.fitnessLevel.toString();
                isProfileFetched = true;
                goal = profile.goal;
              }
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Vücut Özellikleri",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Column(children: [
                            TextFormField(
                              controller: _weightTextController,
                              decoration: const InputDecoration(
                                hintText: 'Ağırlık(kg)',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ağırlık boş olamaz';
                                }
                                try {
                                  double.parse(value);
                                } on FormatException {
                                  return 'Lütfen geçerli bir ağırlık giriniz';
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                controller: _heightTextController,
                                decoration:
                                    InputDecoration(hintText: 'Uzunluk(cm)'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Uzunluk boş olamaz';
                                  }

                                  try {
                                    double.parse(value);
                                  } on FormatException {
                                    return 'Lütfen geçerli bir uzunluk giriniz';
                                  }
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                controller: _ageTextController,
                                decoration: InputDecoration(hintText: 'Yaş'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Yaş boş olamaz';
                                  }

                                  try {
                                    int.parse(value);
                                  } on FormatException {
                                    return 'Lütfen geçerli bir yaş giriniz';
                                  }
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownMenu(
                              items: genderSelectionItems,
                              onChangedCallBack: (selected) => {
                                setState(() {
                                  String value;
                                  if (selected == null) {
                                    value = 'Erkek';
                                  } else {
                                    value = selected;
                                  }
                                  bodyReady = true;
                                  selectedGender = value;
                                })
                              },
                              currentItem: selectedGender,
                            ),
                          ]),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Fitness Yoğunluğu",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              DropdownButtonFormField<String>(
                                disabledHint:
                                    Text(fitnessLevelSelectionItems.first),
                                value: fitnessLevelSelectionItems.first,
                                icon: const Icon(Icons.sports),
                                elevation: 16,
                                onChanged: (selected) {
                                  String? value = '';
                                  print(selected);
                                  value = selected;
                                  setState(() {
                                    fitnessLevel = value!;
                                    if (fitnessLevel[0] == 'S') {
                                      fitnesslevelF = 1;
                                    } else if (fitnessLevel[0] == 'A') {
                                      fitnesslevelF = 2;
                                    } else if (fitnessLevel[0] == 'O') {
                                      fitnesslevelF = 3;
                                    } else if (fitnessLevel[0] == 'Ç') {
                                      fitnesslevelF = 4;
                                    } else if (fitnessLevel[0] == 'E') {
                                      fitnesslevelF = 5;
                                    }

                                    double target_calorie = calorie_decision(
                                        genderF,
                                        age,
                                        weight,
                                        height,
                                        fitnesslevelF,
                                        goalF);
                                    fitnessLevelReady = true;
                                  });
                                },
                                items: fitnessLevelSelectionItems
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Fitness Hedefi",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              DropdownButtonFormField<String>(
                                disabledHint: Text(goalSelectionItems.first),
                                value: goalSelectionItems.first,
                                icon: const Icon(Icons.sports),
                                elevation: 16,
                                onChanged: (selected) {
                                  String value = '';
                                  if (selected == null) {
                                    value = 'Kilo Almak';
                                  } else {
                                    value = selected;
                                  }
                                  setState(() {
                                    goal = value;
                                    if (goal == "Stabil Kalmak") {
                                      goalF = 0;
                                    } else if (goal == "Kilo Almak") {
                                      goalF = 1;
                                    } else if (goal == "Kilo Vermek") {
                                      goalF = 2;
                                    }
                                    goalReady = true;
                                  });
                                },
                                items: goalSelectionItems
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight =
                                      double.parse(_weightTextController.text);
                                  height =
                                      double.parse(_heightTextController.text);
                                  age = int.parse(_ageTextController.text);
                                  gender = selectedGender;
                                  if (gender == "Erkek") {
                                    genderF = true;
                                  } else {
                                    genderF = false;
                                  }
                                  insertProfile(Profile2(
                                      age: age,
                                      weight: weight,
                                      height: height,
                                      gender: genderF,
                                      fitnessLevel: fitnesslevelF,
                                      calorieGoal: goalF));
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 16)),
                              child: const Text("Profili Güncelle")),
                        ],
                      ))
                    ]),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }
            return const Center();
          }),
    )));
  }
}
