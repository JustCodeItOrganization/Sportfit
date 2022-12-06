import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home_page_view.dart';
import 'package:flutter_application_2/view_model/input_view_model.dart';
import 'package:flutter_application_2/widgets/dropdown_button.dart';
import 'package:provider/provider.dart';

class InputModuleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InputViewModel inputViewModel = context.watch<InputViewModel>();
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const InputTextField(
                labelText: 'Weight(kg)',
              ),
              const InputTextField(labelText: 'Heigh(cm)'),
              const InputTextField(labelText: 'Age'),
              DropDownMenu(
                  items: dropDownMenuItems,
                  onChangedCallBack: (String) => {},
                  currentItem: "Male"),
              const inputElevatedButton()
            ],
          ),
        ));
  }

  List<String> get dropDownMenuItems => ["Male", "Female"];
}

class inputElevatedButton extends StatelessWidget {
  const inputElevatedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50), // NEW
          ),
          onPressed: (() => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    //builder: (context) => const HomeView(),
                    builder: (context) => const PageHomeView(),
                  ),
                )
              }),
          child: Text("Submit Values")),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.labelText,
    this.isEnabled = true,
  }) : super(key: key);
  final bool isEnabled;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
          decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        enabled: isEnabled,
      )),
    );
  }
}
