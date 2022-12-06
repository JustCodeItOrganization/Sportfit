import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Egzersizlerim"),
      ),
      body: Accordion(children: [
        AccordionSection(
            header: Text("Haftalık Egzersizler"),
            content: Column(
              children: [Text("Dumbell Row"), Text("Shoulder Press")],
            )),
        AccordionSection(
            header: Text("Bügün yapılan egzersizler"),
            content: Column(
              children: [Text("Dumbell Row"), Text("Shoulder Press")],
            )),
        AccordionSection(
            header: Text("Bügün yapılmayan egzersizler"),
            content: Column(
              children: [Text("Dumbell Row"), Text("Shoulder Press")],
            ))
      ]),
    );
  }
}
