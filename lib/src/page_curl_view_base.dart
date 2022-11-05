import 'package:flutter/material.dart';
import 'package:page_curl_view/src/page_turn/page_turn_widget.dart';

final PageController _defaultPageController = PageController();

class PageCurlView extends StatefulWidget {
  PageCurlView({
    super.key,
    PageController? controller,
    required List<Widget> children,
  })  : controller = controller ?? _defaultPageController,
        childrenDelegate = SliverChildListDelegate(children);

  PageCurlView.builder({
    super.key,
    PageController? controller,
    required IndexedWidgetBuilder pageBuilder,
    required int itemCount,
  })  : controller = controller ?? _defaultPageController,
        childrenDelegate = SliverChildBuilderDelegate(pageBuilder);

  /// A delegate that provides the children for the [PageCurlView].
  final SliverChildDelegate childrenDelegate;

  /// An object that can be used to control the position to which this page
  /// curl view is scrolled.
  final PageController controller;

  @override
  State<PageCurlView> createState() => _PageCurlViewState();
}

class _PageCurlViewState extends State<PageCurlView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          //swiping right
        }
        if (details.delta.dx < 0) {
          //swiping left
        }
      },
      // child: PageView,
      child: Stack(
        children: [
          PageTurnWidget(
            child: AlicePage1(),
          ),
        ],
      ),
    );
  }
}
