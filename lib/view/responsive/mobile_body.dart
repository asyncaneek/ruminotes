import 'package:flutter/material.dart';
import 'package:rumi_notes/model/data_store_interface.dart';
import 'package:rumi_notes/view/components/card/card_create_new.dart';
import 'package:rumi_notes/view/components/colors.dart';
import 'package:rumi_notes/view/components/defines.dart';
import 'package:rumi_notes/view/components/appbar.dart';
import 'package:rumi_notes/view/components/note_list.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MobileBody extends StatelessWidget {
  final ValueNotifier<bool> isMenuOpen;

  const MobileBody({Key? key, required this.storage, required this.isMenuOpen})
      : super(key: key);

  final IDataStore storage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorApp,
      appBar: RuminoteAppBar(appName, isMenuOpen),
      body: SlidingSheet(
        duration: const Duration(milliseconds: 500),
        elevation: 16,
        cornerRadius: defaultCornerRadius,
        closeOnBackButtonPressed: true,
        closeOnBackdropTap: true,
        isBackdropInteractable: false,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [SnapSpec.headerSnap, SnapSpec.expanded],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: defMaxWidth),
            child: CardList(storage: storage),
          ),
        ),
        builder: (context, state) {
          return const CardCreateNewForm();
        },
        headerBuilder: (context, state) {
          return InkWell(
              onTap: () {
                var controller = SheetController.of(context);
                state.isCollapsed
                    ? controller!.expand()
                    : controller!.collapse();
              },
              child: const CardCreateNewHeader());
        },
      ),
    );
  }
}
