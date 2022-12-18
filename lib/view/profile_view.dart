import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/view/input_module_view.dart';
import 'package:flutter_application_2/widgets/dropdown_button.dart';
import 'package:flutter/cupertino.dart';
import './profile_storage.dart';
import './../widgets/styled_text.dart';



class ProfileView extends StatefulWidget{
  const ProfileView({super.key});
  @override
  _ProfileViewState createState() => _ProfileViewState();
}



class _ProfileViewState extends State<ProfileView> {
  int weight = 0;
  int height = 0;
  int age = 0;
  int fitnessLevel = 0;
  String gender = 'Erkek';
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  final _ageTextController = TextEditingController();
  void getProfileFromStorage() async{
    Profile profile = await Profile.readProfileFromStorage();
    setState(() {
      weight = profile.weight;
      height = profile.height;
      age = profile.age;
      fitnessLevel = profile.fitnessLevel;
    });
  }

  _ProfileViewState(){
    getProfileFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Column(
              children: [
                Row(children: [
                  StyledText('Ağırlık:${weight.toString()}'),
                  StyledText('Uzunluk:${height.toString()}')])]),
          Row(children: [StyledText('Cinsiyet:${gender.toString()}'), StyledText('Yaş:${age.toString()}')],),
          Accordion(
            children: [
              AccordionSection(
                header:const Text('Vücut özellikleri'),
                content: Column(
                  children: [
                    TextField(
                      controller: _weightTextController,
                      decoration:const InputDecoration(
                        hintText: 'Ağırlık(kg)',
                      )
                    ),
                    TextField(controller: _heightTextController,decoration: InputDecoration(hintText: 'Uzunluk(cm)')),
                    TextField(controller: _ageTextController,decoration: InputDecoration(hintText: 'Yaş')),
                    DropDownMenu(
                        items: dropDownMenuItems,
                        onChangedCallBack: (selected) => {setState(() {
                          String value;
                          if(selected == null){
                            value = 'Erkek';
                          }
                          else{
                            value = selected;
                          }
                              gender = value;
                        })},
                        currentItem: "Erkek",

                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        weight = int.parse(_weightTextController.text);
                        height = int.parse(_heightTextController.text);
                        age = int.parse(_ageTextController.text);
                      });
                    }, child: Text('Verileri kaydet'))
                  ],
                ),
              ),
              AccordionSection(
                header: Text('Hedef Kalori'),
                content: Column(
                  children: [
                    const InputTextField(
                      labelText: 'Hedef Kalori (kcal)',
                    ),
                    const inputElevatedButton()
                  ],
                ),
              ),
              AccordionSection(
                header: Text('Antrenman Hacmi'),
                content: Column(
                  children: [
                    const InputTextField(
                      labelText: 'Set',
                    ),
                    const InputTextField(
                      labelText: 'Tekrar',
                    ),
                    const InputTextField(
                      labelText: 'Ağırlık (kg)',
                    ),
                    const inputElevatedButton()
                  ],
                ),
              ),
              AccordionSection(
                header: Text('Fitness Leveli'),
                content: Column(
                  children: [
                    const InputTextField(
                      labelText: 'Set',
                    ),
                    const InputTextField(
                      labelText: 'Tekrar',
                    ),
                    const InputTextField(
                      labelText: 'Ağırlık (kg)',
                    ),
                    const inputElevatedButton()
                  ],
                ),
              ),
            ],
          ),
          ],
      );
  }
  List<String> get dropDownMenuItems => ["Erkek", "Kadın"];
}
