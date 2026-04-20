import 'package:flutter/material.dart';

class MainLoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(
          color: theme.primaryColor,
        ),
      ),
    );
  }

}