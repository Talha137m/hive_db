import 'package:hive/hive.dart';
import 'package:hive_data_base/models/student.dart';

class StudentAdaptor extends TypeAdapter<Student> {
  @override
  Student read(BinaryReader reader) {
    Student student = reader.read(0);
    return Student(
        department: student.department,
        name: student.name,
        rollNo: student.rollNo,
        fee: student.fee);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Student obj) {
    writer.write(obj.name);
    writer.write(obj.department);
    writer.write(obj.fee);
    writer.write(obj.rollNo);
  }
}
