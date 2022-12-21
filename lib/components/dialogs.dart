import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osamasmovies/components/i_text.dart';

import '../generated/l10n.dart';
import 'custom_colors.dart';

void showMessageDialog(
    String message, {
      String? title,
      VoidCallback? onPressed,
    }) =>
    Get.dialog(
      CupertinoAlertDialog(
        title: title == null
            ? null
            : Text(
          title,
          style: const TextStyle(
            fontFamily: 'Tajawal',
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Tajawal',
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPressed ?? () => Get.back(),
            child: Text(S.current.ok),
          ),
        ],
      ),
      barrierDismissible: onPressed == null,
    );

void showErrorDialog(
    String? message, {
      String? title,
      VoidCallback? onPressed,
    }) => showMessageDialog(message??S.current.somethingWentWrong, onPressed: onPressed,);

Future<T?> showCustomBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  required String title,
  BoxConstraints? constraints,
  bool isScrollControlled = true,
}) {
  return showModalBottomSheet<T>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    backgroundColor: CustomColors.trans,
    context: context,
    isScrollControlled: isScrollControlled,
    constraints: constraints,
    builder: (context) => Container(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize:
        constraints == null ? MainAxisSize.min : MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 3,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.gray6,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Builder(builder: (context) {
            return (isScrollControlled && constraints == null)
                ? getBo(
              title: title,
              isScrollControlled: isScrollControlled,
              constraints: constraints,
              child: child,
            )
                : Expanded(
                child: getBo(
                  title: title,
                  isScrollControlled: isScrollControlled,
                  constraints: constraints,
                  child: child,
                ));
          }),
        ],
      ),
    ),
  );
}

Widget getBo({
  required Widget child,
  required String title,
  BoxConstraints? constraints,
  bool isScrollControlled = true,
}) =>
    Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: CustomColors.white,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize:
          constraints == null ? MainAxisSize.min : MainAxisSize.max,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
                color: CustomColors.colorPrimary,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: IText(
                title,
                color: CustomColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Builder(builder: (context) {
              return (isScrollControlled && constraints == null)
                  ? child
                  : Expanded(child: child);
            }),
          ],
        ),
      ),
    );

