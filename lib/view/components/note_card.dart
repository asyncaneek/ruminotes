import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/view/components/card/card_bar.dart';
import 'package:rumi_notes/view/components/card/card_body.dart';
import 'package:rumi_notes/view/components/card/card_details.dart';
import 'package:rumi_notes/view/components/card/card_title.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:intl/intl.dart';
import 'package:rumi_notes/view/components/skeleton.dart';

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

  bool isExpanded = false;

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
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: isExpanded && bodyStr.isNotEmpty
              ? buildExpandedCard()
              : buildCollapsedCard(),
        ));
  }

  Widget buildExpandedCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildCardBar(),
        CardTitle(titleStr: titleStr),
        const Skeleton(height: defaultPadding / 2, opacity: 0),
        CardBody(bodyStr: bodyStr),
        const Skeleton(height: defaultPadding / 4, opacity: 0),
        const CardDetails(),
        const Skeleton(height: defaultPadding / 4, opacity: 0),
      ],
    );
  }

  Widget buildCollapsedCard() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildCardBar(),
          CardTitle(titleStr: titleStr),
          const Skeleton(height: defaultPadding / 2, opacity: 0),
        ]);
  }

  Widget buildCardBar() {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding),
      child: CardBar(
        timeStr: timeStr,
        isExpanded: isExpanded,
        showDropDown: bodyStr.isNotEmpty,
      ),
    );
  }
}
