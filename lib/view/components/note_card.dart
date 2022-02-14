import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rumi_notes/model/note.dart';
import 'package:rumi_notes/view/components/card/card_bar.dart';
import 'package:rumi_notes/view/components/card/card_body.dart';
import 'package:rumi_notes/view/components/card/card_details.dart';
import 'package:rumi_notes/view/components/card/card_title.dart';
import 'package:rumi_notes/view/components/colors.dart';
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

  void setExpanded(bool expanded) {
    setState(() {
      isExpanded = expanded;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleStr = widget.note!.title ?? "";
      bodyStr = widget.note!.text ?? "";
      if (widget.note!.time != null) {
        timeStr = DateFormat('E, MMM dd hh:mm aaa').format(widget.note!.time!);
      }
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
          // dismissible: DismissiblePane(onDismissed: () {}),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
                autoClose: true,
                onPressed: null,
                backgroundColor: const Color(0xFFFE4A49).withOpacity(0.5),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete'),
            SlidableAction(
                autoClose: true,
                onPressed: null,
                backgroundColor: const Color(0xFFDB9825).withOpacity(0.5),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit'),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          dragDismissible: true,
          dismissible: DismissiblePane(onDismissed: () {}),
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
                autoClose: true,
                onPressed: null,
                backgroundColor: accentColor.withOpacity(0.5),
                foregroundColor: Colors.white,
                icon: Icons.copy,
                label: 'Duplicate')
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: buildCard(isExpanded && bodyStr.isNotEmpty));
  }

  Widget buildCard(bool isExpanded) {
    List<Widget> children = [];

    children.add(buildCardBar());
    children.add(CardTitle(titleStr: titleStr));
    children.add(const Skeleton(height: defaultPadding / 2, opacity: 0));

    if (isExpanded) {
      children.add(CardBody(bodyStr: bodyStr));
      children.add(const Skeleton(height: defaultPadding / 4, opacity: 0));
    }

    children.add(const CardDetails());
    children.add(const Skeleton(height: defaultPadding / 4, opacity: 0));

    return InkWell(
      onTap: () => setExpanded(!isExpanded),
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setExpanded(details.delta.dy >= 0);
        },
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children),
      ),
    );
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
