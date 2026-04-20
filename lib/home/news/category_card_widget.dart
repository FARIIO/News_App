import 'package:elyoum_elsa2e3/home/category_details.dart';
import 'package:elyoum_elsa2e3/models/category.dart';
import 'package:elyoum_elsa2e3/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget{
  final Category category;
  final int index;

  const CategoryCard({super.key, required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    var isEven = index%2 == 0;
    var theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: isEven ? Alignment.centerRight : Alignment.centerLeft,
          children: [
            Image.asset(category.image),
            Column(
              spacing: 16,
              children: [
                Text(category.title,style: theme.textTheme.labelLarge,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    overlayColor: WidgetStatePropertyAll(AppColors.transparent),
                    onTap: () => onCardTap(context),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(85)
                          ),
                          child: Row(
                            textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
                            spacing: 4,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                isEven ?
                                EdgeInsets.only(left: 16)
                                    : EdgeInsets.only(right: 16) ,
                                child: Text(
                                  "View All",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                              IconButton.filled(
                                  onPressed: (){},
                                  highlightColor: AppColors.transparent,
                                  padding: EdgeInsetsGeometry.zero,
                                  alignment: Alignment.center,
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(theme.cardColor),
                                  ),
                                  icon: Icon(
                                    isEven ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                                    color: theme.primaryColor,
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ]
      ),
    );
  }


  void onCardTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CategoryDetails(
          categoryId: category.id
      ),
    )
    );
  }
}