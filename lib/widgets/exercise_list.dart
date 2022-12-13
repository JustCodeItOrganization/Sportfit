import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/exercise.dart';

class ExerciseList extends StatefulWidget {
  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  List<Exercise> _data = [];

  _ExerciseListState() {
    _data.add(
      Exercise(
          description: "description",
          title: "Deadlift",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4),
    );
    _data.add(
      Exercise(
          description: "description",
          title: "Squat",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 3),
    );
    _data.add(
      Exercise(
          description: "description",
          title: "Row",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4),
    );
    _data.add(
      Exercise(
          description: "description",
          title: "Push up",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4),
    );
    _data.add(
      Exercise(
          description: "description",
          title: "Pull up",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4),
    );
    _data.add(
      Exercise(
          description: "description",
          title: "Walking high knees",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4),
    );
    _data.add(
      Exercise(
          description: "description",
          title: "Knee push ups",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4),
    );
    _data.add(
      Exercise(
          description: "description",
          title: "Jumping jacks",
          videoUrl: "www.",
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
          metabolicEquivalent: 5,
          numOfSets: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _data.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Dismissible(
                key: Key(_data[index].title),
                onDismissed: (direction) {
                  setState(() {
                    _data.removeAt(index);
                    print(_data);
                  });
                },
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(_data[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.black, Colors.black.withOpacity(0.3)],
                        ),
                      ),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_data[index].title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w800)),
                                  Text(
                                    _data[index].numOfSets.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 28),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  foregroundColor: Colors.red,
                                  backgroundColor:
                                      Color.fromARGB(255, 59, 59, 59)),
                              child: Icon(
                                Icons.ondemand_video,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Add New Workout",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ],
    ));
  }
}

List<Exercise> generateItem(int num) {
  return List.generate(num, (index) {
    return Exercise(
        description: "Egzersiz açıklaması $index",
        metabolicEquivalent: 5,
        numOfSets: 3,
        videoUrl: "www.",
        imagePath:
            "https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
        title: "Egzersiz adı $index",
        isExpanded: false);
  });
}
