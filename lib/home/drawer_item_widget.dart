import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget{
  String title ;
  IconData icon;

  DrawerItemWidget({super.key,required this.title,required this.icon});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        spacing: 8,
        children: [
          Icon(icon,color: theme.cardColor,),
          Text(title , style: theme.textTheme.labelMedium,)
        ],
      ),
    );
  }

}