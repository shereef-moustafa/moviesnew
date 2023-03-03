import 'package:flutter/material.dart';

showloading(String message, BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AlertDialog(
              actions: [
                Text(message),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      });
}

void showmessage(
    BuildContext context, String message, String posbth, VoidCallback posaction,
    {String? negbth, VoidCallback? negaction}) {
  showDialog(
      context: context,
      builder: (context) {
        List<Widget> actions = [
          TextButton(onPressed: posaction, child: Text(posbth)),
        ];
        if (negbth != null) {
          actions.add(TextButton(onPressed: negaction, child: Text(negbth)));
        }

        return AlertDialog(
          titleTextStyle: TextStyle(color: Colors.black),
          title: Text('Task Added Successfully'),
          actions: actions,
        );
      });
}

void hidloading(BuildContext context) {
  Navigator.pop(context);
}
