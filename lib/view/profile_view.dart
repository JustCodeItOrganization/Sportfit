import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_application_2/view/input_module_view.dart';
import 'package:flutter_application_2/widgets/dropdown_button.dart';
import 'package:flutter/cupertino.dart';
import './profile_storage.dart';



class ProfileView extends StatefulWidget{
  const ProfileView({super.key});
  @override
  _ProfileViewState createState() => _ProfileViewState();
}



class _ProfileViewState extends State<ProfileView> {
  int weight = 0;
  int height = 0;
  final _weightTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  final _ageTextController = TextEditingController();
  void getProfileFromStorage() async{
    Profile profile = await Profile().readProfileFromStorage();
    setState(() {
      weight = profile.weight;
      height = profile.height;
    });
  }

  _ProfileViewState(){
    getProfileFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(children: [Text(weight.toString()), Text(height.toString())]),
          Accordion(
            children: [
              AccordionSection(
                header:const Text('Vücut  özellikleri'),
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
                        onChangedCallBack: (String) => {},
                        currentItem: "Male"),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        weight = int.parse(_weightTextController.text);
                        height = int.parse(_heightTextController.text);
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
                header: Text('Fitness Level Hesaplayıcı'),
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
          InputTextField(
            labelText: 'Fitness Level Output',
            isEnabled: false,
          ),
          ],
      );
  }
  List<String> get dropDownMenuItems => ["Male", "Female"];
}
