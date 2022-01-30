import 'package:flutter/material.dart';
import 'package:rumi_notes/view/components/backdrop/defines.dart';

const double _kFlingVelocity = 2.0;

class BackDrop extends StatefulWidget {
  final ValueNotifier<bool> onMenuOpen;

  /// the active index of the scaffold
  final int currentIndex;

  /// front layer
  final Widget frontLayer;

  /// the back layer or the controller part of scaffold
  final Widget backLayer;

  const BackDrop(
      {Key? key,
      required this.currentIndex,
      required this.frontLayer,
      required this.backLayer,
      required this.onMenuOpen})
      : super(key: key);

  @override
  _BackDropState createState() => _BackDropState();
}

class _BackDropState extends State<BackDrop> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didUpdateWidget(BackDrop old) {
    /// called whenever the content of scaffold changes which happens when you select item from controller
    super.didUpdateWidget(old);

    /// if index changes then the scaffold is expanded and must be closed
    /// otherwise the scaffold should simply close
    if (widget.currentIndex != old.currentIndex) {
      _toggleBackDropLayerVisibility();
    } else if (!_isFrontLayerExpanded) {
      _controller.fling(velocity: _kFlingVelocity);
    }
  }

  // initialise the controller.
  // this works only once when widget is added to the widget tree
  @override
  initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      value: 1.0,
      vsync: this,
    );
    super.initState();
  }

  // this runs only once when the widget is removed from the widget tree
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// gets the current expansion status of the front layer
  /// this depends on the current progress of the animation
  bool get _isFrontLayerExpanded {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackDropLayerVisibility() {
    _controller.fling(
        velocity: _isFrontLayerExpanded ? -_kFlingVelocity : _kFlingVelocity);
  }

  // our main backdrop stack
  // we need BoxConstraints to get the size of the box
  Widget _buildBackDropStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 50;
    final Size layerSize = Size(constraints.maxWidth, 50 * (menuItemCount + 2));
    final double layerTop = layerSize.height - layerTitleHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(
      _controller.view,
    );

    return Stack(
      children: <Widget>[
        // this allows the backLayers menu items from being included in the semantics tree
        // when the front layer is not expanded
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _isFrontLayerExpanded,
        ),

        PositionedTransition(
          rect: layerAnimation,
          child: GestureDetector(
            /// move according to the finger's position
            onVerticalDragUpdate: (details) {
              if (details.primaryDelta! > 0) {
                _controller.value -= details.primaryDelta! / layerSize.height;
              } else {
                _controller.value -= details.primaryDelta! / layerSize.height;
              }
              widget.onMenuOpen.value = !_isFrontLayerExpanded;
            },

            /// when the drag ends, we get the velocity with which the gesture was stopped
            /// we then use this velocity to finish the rest of the animation according to our location
            onVerticalDragEnd: (DragEndDetails details) {
              if (details.primaryVelocity! < 0) {
                _controller.fling(
                  velocity: -details.primaryVelocity! / layerSize.height,
                );
              } else {
                _controller.fling(
                  velocity: -details.primaryVelocity! / layerSize.height,
                );
              }
              widget.onMenuOpen.value = !_isFrontLayerExpanded;
            },

            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: Container(
                color: Colors.transparent,
                child: _FrontLayer(child: widget.frontLayer),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // here we use a layout builder because we need to calculate the size of the
      // parent widget to lay itself out
      body: LayoutBuilder(builder: _buildBackDropStack),
    );
  }
}

class _FrontLayer extends StatelessWidget {
  final Widget child;

  const _FrontLayer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 26.0,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Expanded(child: child),
    );
  }
}
