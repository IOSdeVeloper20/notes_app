part of 'add_note_cubit.dart';

sealed class AddNoteState extends Equatable {
  const AddNoteState();

  @override
  List<Object> get props => [];
}

//States of my Cubit
final class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errorMessage;

  const AddNoteFailure(this.errorMessage);
}
