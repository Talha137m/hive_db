// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class Student extends HiveObject {
  @HiveField(0)
  String department;
  @HiveField(1)
  String name;
  @HiveField(2)
  int rollNo;
  @HiveField(3)
  double fee;

  Student({
    required this.department,
    required this.name,
    required this.rollNo,
    required this.fee,
  });
}
