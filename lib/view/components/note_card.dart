import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: const [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: null,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: cardWithBody(),
    );
  }

  Widget cardWithoutBody() {
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

  Widget cardWithBody() {
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
