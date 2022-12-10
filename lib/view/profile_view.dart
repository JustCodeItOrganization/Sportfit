import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_application_2/view/input_module_view.dart';
import 'package:flutter_application_2/widgets/dropdown_button.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class Profile {
  final String weight;
  final String height;

  Profile(this.weight, this.height);

  Profile.fromJson(Map<String, dynamic> json): weight = json['weight'], height = json['height'];

  Map<String, dynamic> toJson() => {
    'weight' : weight,
    'height' : height,
  };
}

class ProfileStorage{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Accordion(
            children: [
              AccordionSection(
                header: Text('Vücut  özellikleri'),
                content: Column(
                  children: [
                    const InputTextField(
                      labelText: 'Ağırlık(kg)',
                    ),
                    const InputTextField(labelText: 'Uzunluk(cm)'),
                    const InputTextField(labelText: 'Yaş'),
                    DropDownMenu(
                        items: dropDownMenuItems,
                        onChangedCallBack: (String) => {},
                        currentItem: "Male"),
                    const inputElevatedButton()
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
