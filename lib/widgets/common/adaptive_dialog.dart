import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveDialog extends StatelessWidget {
  final String title;
  final String content;
  final String actionLabel;
  final void Function() onPressed;

  const AdaptiveDialog({
    Key key,
    @required this.title,
    @required this.content,
    @required this.onPressed,
    @required this.actionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              CupertinoButton(
                onPressed: onPressed,
                child: Text(actionLabel),
              )
            ],
          )
        : AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                onPressed: onPressed,
                child: Text(actionLabel),
              )
            ],
          );
  }
}

showAdaptiveDialog({
  @required BuildContext context,
  @required AdaptiveDialog adaptiveDialog,
  bool barrierDismissible = true,
}) =>
    showDialog(
      context: context,
      builder: (_) => adaptiveDialog,
      barrierDismissible: barrierDismissible,
    );
