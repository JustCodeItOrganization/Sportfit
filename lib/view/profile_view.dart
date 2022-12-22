import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_application_2/widgets/dropdown_button.dart';
import './profile_storage.dart';
import './../widgets/styled_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  double weight = 0;
  double height = 0;
  int age = 0;
  String fitnessLevel = "1";
  String selectedGender = 'Erkek';
  String gender = 'Erkek';
  bool isProfileFetched = false;
  String goal = "Kilo alma";
  final _formKey = GlobalKey<FormState>();
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  final _ageTextController = TextEditingController();
  late Future<Profile> futureProfile;

  List<String> goalSelectionItems = ["Kilo alma", "Kilo verme", "Stabil kalma"];
  List<String> genderSelectionItems = ["Erkek", "Kadın"];
  List<String> fitnessLevelSelectionItems = ['1', '2', '3', '4', '5'];

  @override
  void initState() {
    super.initState();
    futureProfile = Profile.readProfileFromStorage();
  }

  Future<Profile> getProfileFromStorage() async {
    return Profile.readProfileFromStorage();
  }

  _ProfileViewState() {
    getProfileFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text('Profilim')),
            body: FutureBuilder(
                future: futureProfile,
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    if (isProfileFetched) {
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

                    return Column(children: [
                      Column(children: [
                        Row(children: [
                          StyledText('Ağırlık:${weight.toString()}'),
                          StyledText('Uzunluk:${height.toString()}')
                        ])
                      ]),
                      Row(
                        children: [
                          StyledText('Cinsiyet:${gender.toString()}'),
                          StyledText('Yaş:${age.toString()}')
                        ],
                      ),
                      Row(
                        children: [
                          StyledText(
                              'Fitness Level:${fitnessLevel.toString()}'),
                          StyledText('Hedef:${goal}'),
                        ],
                      ),
                      Row(children: [
                        StyledText('Alınması Gereken Kalori Miktarı:')
                      ],),
                      Form(
                          key: _formKey,
                          child: Accordion(children: [
                            AccordionSection(
                              header: const Text('Vücut özellikleri'),
                              content: Column(
                                children: [
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
                                  TextFormField(
                                      controller: _heightTextController,
                                      decoration: InputDecoration(
                                          hintText: 'Uzunluk(cm)'),
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
                                  TextFormField(
                                      controller: _ageTextController,
                                      decoration:
                                          InputDecoration(hintText: 'Yaş'),
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
                                        selectedGender = value;
                                      })
                                    },
                                    currentItem: selectedGender,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text('Kaydedildi')),
                                          );
                                        }
                                        setState(() {
                                          weight = double.parse(
                                              _weightTextController.text);
                                          height = double.parse(
                                              _heightTextController.text);
                                          age = int.parse(
                                              _ageTextController.text);
                                          gender = selectedGender;
                                        });
                                      },
                                      child: Text('Verileri kaydet'))
                                ],
                              ),
                            ),
                            AccordionSection(
                              header: const Text('Fitness Level'),
                              content: Column(
                                children: [
                                  DropDownMenu(
                                      items: fitnessLevelSelectionItems,
                                      onChangedCallBack: (selected) {
                                        String value = '';
                                        if (selected == null) {
                                          value = '1';
                                        } else {
                                          value = selected;
                                        }
                                        setState(() {
                                          fitnessLevel = value;
                                        });
                                      },
                                      currentItem: fitnessLevel.toString()),
                                ],
                              ),
                            ),
                            AccordionSection(header: const Text('Hedef'), content: Column(
                              children: [
                                DropDownMenu(items: goalSelectionItems, onChangedCallBack:
                                (selected){
                                  String value = '';
                                  if(selected == null){
                                    value = 'Kilo alma';
                                  }
                                  else{
                                    value = selected;
                                  }
                                  setState(() {
                                    goal = value;
                                  });
                                }
                                    , currentItem: goal)
                              ],
                            ))
                          ])),

                    ]);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  }
                  return const Center();
                })));
  }
}
