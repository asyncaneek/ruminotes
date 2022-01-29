import 'package:flutter/widgets.dart';
import 'package:rumi_notes/view/components/defines.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
    required this.bodyStr,
  }) : super(key: key);

  final String bodyStr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: defaultPadding, left: defaultPadding),
      child: Text(
        bodyStr,
        maxLines: null,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
