const List<String> gradeList = ['O', 'A+', 'A', 'B+', 'B', 'C', 'I', 'F', 'Ab'];

class Task {
  late String grade;
  late int credit;
  Task({required this.grade, required this.credit});

  void counter(val) {
    if (val != 0) {
      credit = val;
    }
  }

  void dropdown(value) {
    grade = value!;
  }
}
