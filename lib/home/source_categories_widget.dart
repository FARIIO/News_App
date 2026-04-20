import 'package:elyoum_elsa2e3/home/news/news_widget.dart';
import 'package:elyoum_elsa2e3/home/source_tab_item.dart';
import 'package:elyoum_elsa2e3/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../models/source_response.dart';

class SourceCategoriesWidget extends StatefulWidget{
  final List<Source> sourceList;

  SourceCategoriesWidget({super.key,required this.sourceList});

  @override
  State<SourceCategoriesWidget> createState() => _SourceCategoriesWidgetState();
}

class _SourceCategoriesWidgetState extends State<SourceCategoriesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
  var theme = Theme.of(context);

   return DefaultTabController(
       length: widget.sourceList.length,
       child: Column(
         children: [
           TabBar(
             isScrollable: true,
               overlayColor: WidgetStatePropertyAll(AppColors.transparent),
               dividerColor: AppColors.transparent,
               tabAlignment: TabAlignment.start,
               indicatorColor: theme.primaryColor,
               onTap: (index) {
                 selectedIndex = index;
                 setState(() {

                 });
               },
               tabs: widget.sourceList.map((source) {
                 return SourceTabItem(
                     source: source,
                     isSelected: selectedIndex == widget.sourceList.indexOf(source)
                 );
               },).toList()
           ),
           Expanded(
               child: Padding(
                 padding: EdgeInsets.symmetric(
                   vertical: 20
                 ),
                 child: NewsWidget(
                     source: widget.sourceList[selectedIndex]
                 ),
               )
           ),
         ],
       )
   );
  }
}