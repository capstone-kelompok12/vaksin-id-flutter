import 'package:flutter/material.dart';

void snackbarMessage(BuildContext context, String msg,) {
  print('snackbar - $msg');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg),),
  );
}