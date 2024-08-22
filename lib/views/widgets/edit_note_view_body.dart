import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/custom_textfield.dart';
import 'custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: checkIcon
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: CustomTextfield(hint: 'Title'),
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextfield(hint: 'Content', maxLines: 5)
        ],
      ),
    );
  }
}
