import 'package:elyoum_elsa2e3/models/source_response.dart';
import 'package:flutter/material.dart';

class SourceTabItem extends StatelessWidget{
  final Source source;
  bool isSelected;
  SourceTabItem({super.key, required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
  var theme = Theme.of(context);

    return Text(
      source.name ?? " ",
      style: isSelected ? theme.textTheme.bodyMedium : theme.textTheme.bodySmall,
    );
  }

}