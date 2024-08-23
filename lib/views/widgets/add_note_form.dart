import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  //the unique key for this form
  final GlobalKey<FormState> formKey = GlobalKey();
  //for validation purposes
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  //form inputs variables
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextfield(
            //a call back function triggered when the form is saved
            onSaved: (value) {
              //title decalred above
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextfield(
            onSaved: (value) {
              //subtitle declared above
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  //check if the input from the form
                  //get the form key current state and validate it
                  if (formKey.currentState!.validate()) {
                    //get the current state of the form key and save it
                    formKey.currentState!.save();

                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subTitle!,
                        date: DateTime.now().toString(),
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    //if there was a values with null
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 44,
          )
        ],
      ),
    );
  }
}
