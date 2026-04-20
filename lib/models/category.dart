import 'package:elyoum_elsa2e3/utils/app_images.dart';

class Category {
  String id;
  String title;
  String image;
  Category({required this.id,required this.title,required this.image});

  static List<Category> getCategoriesList({required bool isDark}){
    return [
      Category(id: "general", title: "General", image: isDark ?
      AppImages.generalLight : AppImages.generalDark),
      Category(id: "business", title: "Business", image: isDark ?
      AppImages.businessLight : AppImages.businessDark),
      Category(id: "sports", title: "Sports", image: isDark ?
      AppImages.sportLight : AppImages.sportDark),
      Category(id: "health", title: "Health", image: isDark ?
      AppImages.healthLight : AppImages.healthDark),
      Category(id: "entertainment", title: "Entertainment", image: isDark ?
      AppImages.entertainmentLight : AppImages.entertainmentDark),
      Category(id: "technology", title: "Technology", image: isDark ?
      AppImages.technologyLight : AppImages.technologyDark),
      Category(id: "science", title: "Science", image: isDark ?
      AppImages.scienceLight : AppImages.scienceDark),
    ];
  }
}