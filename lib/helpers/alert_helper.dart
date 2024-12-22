
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test_flutter_sr/common/extensions.dart';

class AlertHelper {

  static Future<bool> confirmDeleteTask(BuildContext context, bool isDarkMode) async {
    final l10n = context.l10n;

    bool? shouldDelete;

    if (Platform.isIOS) {
      shouldDelete = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(l10n.confirmDeleteTitle),
            content: Text(
              l10n.confirmDeleteMessage,
              style: TextStyle(
                color: isDarkMode ? Colors.white : const Color(0xFF252529),
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  GoRouter.of(context).pop(false);
                },
                child: Text(l10n.cancelButton),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  GoRouter.of(context).pop(true);
                },
                child: Text(l10n.confirmButton),
              ),
            ],
          );
        },
      );
    } else {
      shouldDelete = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(l10n.confirmDeleteTitle),
            content: Text(
              l10n.confirmDeleteMessage,
              style: TextStyle(
                color: isDarkMode ? Colors.white : const Color(0xFF252529),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop(false);
                },
                child: Text(l10n.cancelButton),
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop(true);
                },
                child: Text(l10n.confirmButton),
              ),
            ],
          );
        },
      );
    }

    return shouldDelete ?? false;
  }

}
