import 'package:flutter/material.dart';

import '../api/api_manager.dart';

class MainErrorWidget extends StatelessWidget{
  String errorMessage;
  VoidCallback onPressed;

  MainErrorWidget({super.key,required this.errorMessage,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      children: [
        Text(errorMessage,style: TextStyle(color: theme.primaryColor),),
        ElevatedButton(onPressed: onPressed, child: Text("Try again"))
      ],
    );
  }

}