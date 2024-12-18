import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final Function()? onTap;
  final Function()? onLongPress;

  const NoteWidget({
    required this.note,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      title: Text(note.title),
      subtitle: Text(note.description),
      trailing: const Icon(Icons.edit),
    );
  }
}
