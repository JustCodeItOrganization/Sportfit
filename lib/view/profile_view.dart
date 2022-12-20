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
  double weight = 0;
  double height = 0;
  int age = 0;
  int fitnessLevel = 1;
  String selectedGender = 'Erkek';
  String gender = 'Erkek';
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  final _ageTextController = TextEditingController();
  List<String> genderSelectionItems = ["Erkek", "Kadın"];
  List<String> fitnessLevelSelectionItems = ['1', '2', '3', '4', '5'];

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
          Row(children: [StyledText('Fitness Level:${fitnessLevel.toString()}')],),
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
                        items: genderSelectionItems,
                        onChangedCallBack: (selected) => {setState(() {
                          String value;
                          if(selected == null){
                            value = 'Erkek';
                          }
                          else{
                            value = selected;
                          }
                              selectedGender = value;
                        })},
                        currentItem: selectedGender,

                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        weight = double.parse(_weightTextController.text);
                        height = double.parse(_heightTextController.text);
                        age = int.parse(_ageTextController.text);
                        gender = selectedGender;
                      });
                    }, child: Text('Verileri kaydet'))
                  ],
                ),
              ),
              AccordionSection(
                header: Text('Fitness Level'),
                content: Column(
                  children: [
                    DropDownMenu(items: fitnessLevelSelectionItems, onChangedCallBack: (selected) {
                      String value = '';
                      if(selected == null){
                        value = '1';
                      }
                      else{
                        value = selected;
                      }
                      setState(() {
                        fitnessLevel = int.parse(value);
                      });
                    }, currentItem: fitnessLevel.toString()),
                  ],
                ),
              ),
            ],
          ),
          ],
      );
  }
}
