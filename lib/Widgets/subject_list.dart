import 'package:cgpa_calc/Widgets/subject_tile.dart';
import 'package:cgpa_calc/data.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  final List<Task> tasks;
  SubjectList(this.tasks);

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SubjectTile(
            selectedGrade: widget.tasks[index].grade,
            counterValue: widget.tasks[index].credit,
            counterbuttonCallback: (int val) {
              setState(() {
                widget.tasks[index].counter(val);
              });
            },
            dropdownbuttonCallback: (String value) {
              setState(() {
                widget.tasks[index].dropdown(value);
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
