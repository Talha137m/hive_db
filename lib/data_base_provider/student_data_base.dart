import 'package:hive/hive.dart';
import 'package:hive_data_base/models/student.dart';

class StudentDataBaseProvider {
  static StudentDataBaseProvider? _studentDataBaseProvider;
  StudentDataBaseProvider._internal();
  factory StudentDataBaseProvider() {
    return _studentDataBaseProvider ??= StudentDataBaseProvider._internal();
  }
  String get boxName => 'com.example.student';
  Future<bool> insertStudent({required Student student}) async {
    Box<Student> studentBox = await Hive.openBox<Student>(boxName);
    int effectedRow = await studentBox.add(student);
    print('rows$effectedRow');
    return effectedRow >= 0;
  }

  Future<List<Student>> fetchStudent() async {
    Box<Student> studentBox = await Hive.openBox<Student>(boxName);
    List<Student> studentList = studentBox.values.toList();
    return studentList;
  }

  Future<void> updateStudent(
      {required int index, required Student student}) async {
    Box<Student> studentBox = await Hive.openBox<Student>(boxName);
    studentBox.putAt(index, student);
  }

  Future<void> deleteStudent({required int index}) async {
    Box<Student> studentBox = await Hive.openBox<Student>(boxName);
    studentBox.deleteAt(index);
  }
}
