import 'package:flutter/material.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/view/components/note_list.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  static const String errorString = "error - no data";
  String titleStr = errorString;
  String bodyStr = errorString;
  String timeStr = errorString;

  NoteCard({Key? key, required Note? note}) : super(key: key) {
    if (note != null) {
      titleStr = note.title ?? "";
      bodyStr = note.text ?? "";
      timeStr = DateFormat('E, MMM dd').format(note.time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          defPadding, defPadding, defPadding, defPadding / 2),
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            titleStr,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: defPadding / 2),
          Text(
            bodyStr,
            maxLines: null,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: defPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(timeStr, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
