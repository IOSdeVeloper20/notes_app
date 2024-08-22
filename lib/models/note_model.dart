import 'package:hive/hive.dart';

//the name of the generated file
part 'note_model.g.dart';
/* run this command in the terminal: flutter packages pub run build_runner build
to generate the file */

//this ID is unique per class 
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  //this ID is only unique per field in the class
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.color});
}
