import 'package:flutter/material.dart';

class TopNavigationToolbar extends StatelessWidget {
  static const toolbarHeight = 48.0;

  final Color backgroundColor;
  final String title;
  final List<Widget> startActions;
  final List<Widget> endActions;

  const TopNavigationToolbar({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.title = '',
    this.startActions = const [],
    this.endActions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final viewPaddingTop = MediaQuery.of(context).viewPadding.top;
    return Container(
        color: backgroundColor,
        height: viewPaddingTop + toolbarHeight,
        child: Column(children: [
          SizedBox(height: viewPaddingTop),
          SizedBox(
            height: toolbarHeight,
            child: Row(
              children: [
                Expanded(child: Row(children: startActions)),
                const SizedBox(width: 8),
                Expanded(
                    child: Center(
                        child: Text(title,
                            overflow: TextOverflow.fade, softWrap: false))),
                const SizedBox(width: 8),
                Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: endActions)),
              ],
            ),
          )
        ]));
  }
}

class ImageButtonSl extends StatelessWidget {
  final Color backgroundColor;
  final bool hideFocus;
  final Icon icon;
  final VoidCallback onTap;

  const ImageButtonSl({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.hideFocus = true,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
        elevation: 0,
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: backgroundColor),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onTap,
            highlightColor: hideFocus ? Colors.transparent : null,
            splashColor: hideFocus ? Colors.transparent : null,
            child: icon,
          ),
        ));
  }
}
