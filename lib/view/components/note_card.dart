import 'package:flutter/material.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/view/components/note_list.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatefulWidget {
  final Note? note;

  const NoteCard({Key? key, this.note}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  late String titleStr;
  late String bodyStr;
  late String timeStr;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleStr = widget.note!.title ?? "";
      bodyStr = widget.note!.text ?? "";
      timeStr = DateFormat('E, MMM dd').format(widget.note!.time);
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
