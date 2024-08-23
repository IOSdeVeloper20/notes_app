import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    //notify all listeners of this state
    emit(AddNoteLoading());

    try {
      //get the hive box
      var noteBox = Hive.box<NoteModel>(notesBox);
      //save the note to the hive DB
      await noteBox.add(note);
      //notify all listeners of this state
      //This can be used to show a success message
      emit(AddNoteSuccess());
    } catch (e) { 
      emit(AddNoteFailure(e.toString()));
    }
  }
}
