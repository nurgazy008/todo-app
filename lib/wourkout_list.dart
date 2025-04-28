import 'package:flutter/material.dart';
import 'package:flutter_application_9/domain/wourkout.dart';

class WourkoutList extends StatelessWidget {
  final workouts = <Wourkout>[
    Wourkout(
      title: "test1",
      author: 'Max1',
      description: 'Test Wourkout1',
      level: 'beginner',
    ),
    Wourkout(
      title: "test2",
      author: 'Max2',
      description: 'Test Wourkout2',
      level: 'intermediate',
    ),
    Wourkout(
      title: "test3",
      author: 'Max3',
      description: 'Test Wourkout3',
      level: 'pre-intermediate',
    ),
    Wourkout(
      title: "test4",
      author: 'Max4',
      description: 'Test Wourkout4',
      level: 'upper-intermediate',
    ),
    Wourkout(
      title: "test5",
      author: 'Max5',
      description: 'Test Wourkout5',
      level: 'advanced',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                leading: Container(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.fitness_center_outlined,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1, color: Colors.white),
                    ),
                  ),
                ),
                title: Text(
                  workouts[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                ),
                subtitle: subtitle(context, workouts[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget subtitle(BuildContext context, Wourkout wourkout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (wourkout.level) {
    case 'beginner':
      color = Colors.indigo;
      indicatorLevel = 0.25;
      break;
    case 'intermediate':
      color = Colors.deepPurple;
      indicatorLevel = 0.50;
      break;
    case 'pre-intermediate':
      color = Colors.green;
      indicatorLevel = 0.75;
      break;
    case 'advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: [ 
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Colors.blueAccent,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Text(wourkout.level, style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}
