import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/view/input_module_view.dart';
import 'package:flutter_application_2/widgets/dropdown_button.dart';
import 'package:flutter/cupertino.dart';
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
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  final _ageTextController = TextEditingController();
  late Future<Profile> futureProfile;

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
                          StyledText('Fitness Level:${fitnessLevel.toString()}')
                        ],
                      ),
                      Accordion(
                        children: [
                          AccordionSection(
                            header: const Text('Vücut özellikleri'),
                            content: Column(
                              children: [
                                TextField(
                                    controller: _weightTextController,
                                    decoration: const InputDecoration(
                                      hintText: 'Ağırlık(kg)',
                                    )),
                                TextField(
                                    controller: _heightTextController,
                                    decoration: InputDecoration(
                                        hintText: 'Uzunluk(cm)')),
                                TextField(
                                    controller: _ageTextController,
                                    decoration:
                                        InputDecoration(hintText: 'Yaş')),
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
                                      setState(() {
                                        weight = double.parse(
                                            _weightTextController.text);
                                        height = double.parse(
                                            _heightTextController.text);
                                        age =
                                            int.parse(_ageTextController.text);
                                        gender = selectedGender;
                                      });
                                    },
                                    child: Text('Verileri kaydet'))
                              ],
                            ),
                          ),
                          AccordionSection(
                            header: Text('Fitness Level'),
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
                        ],
                      ),
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
