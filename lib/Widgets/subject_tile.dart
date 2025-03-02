import 'package:cgpa_calc/data.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class SubjectTile extends StatefulWidget {
  final String selectedGrade;
  final int counterValue;
  final Function counterbuttonCallback;
  final Function dropdownbuttonCallback;
  const SubjectTile(
      {Key? key,
      required this.selectedGrade,
      required this.counterValue,
      required this.counterbuttonCallback,
      required this.dropdownbuttonCallback})
      : super(key: key);
  @override
  State<SubjectTile> createState() => _SubjectTileState(
        selectedGrade: this.selectedGrade,
        counterValue: this.counterValue,
        counterbuttonCallback: this.counterbuttonCallback,
        dropdownbuttonCallback: this.dropdownbuttonCallback,
      );
}

class _SubjectTileState extends State<SubjectTile> {
  String selectedGrade;
  int counterValue;
  final Function counterbuttonCallback;
  final Function dropdownbuttonCallback;
  _SubjectTileState({
    required this.selectedGrade,
    required this.counterValue,
    required this.counterbuttonCallback,
    required this.dropdownbuttonCallback,
  });

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String grade in gradeList) {
      var newItem = DropdownMenuItem(
        child: Text(grade),
        value: grade,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        color: Colors.grey,
        child: Center(
          child: DropdownButton<String>(
            value: widget.selectedGrade,
            items: getDropdownItems(),
            onChanged: (value) {
              dropdownbuttonCallback(value);
            },
          ),
        ),
      ),
      trailing: CounterButton(
        loading: false,
        onChange: (int val) {
          counterbuttonCallback(val);
        },
        count: widget.counterValue,
        countColor: Colors.purple,
        buttonColor: Colors.purpleAccent,
        progressColor: Colors.purpleAccent,
      ),
    );
  }
}
