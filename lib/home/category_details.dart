import 'package:elyoum_elsa2e3/api/api_manager.dart';
import 'package:elyoum_elsa2e3/home/source_categories_widget.dart';
import 'package:elyoum_elsa2e3/models/source_response.dart';
import 'package:elyoum_elsa2e3/widgets/main_error_widget.dart';
import 'package:elyoum_elsa2e3/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget{
  final String categoryId;

  const CategoryDetails({super.key, required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryId,style: theme.textTheme.bodyLarge),
        backgroundColor: Colors.transparent,
        foregroundColor: theme.primaryColor,
        centerTitle: true,
      ),
      body: FutureBuilder<SourceResponse>(
          future: ApiManager.getSourcesByCategory(widget.categoryId),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
             return MainLoadingWidget();
            }else if(snapshot.hasError){
              return Column(
                children: [
                  Text("Something Went Wrong",style: TextStyle(color: theme.primaryColor),),
                ],
              );
            }
            //todo: get response => error
            if(snapshot.data?.status != "ok"){
              return MainErrorWidget(
                  errorMessage: snapshot.data!.message!,
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },);
            }
            //todo: get response => ok
            List<Source> sourceList = snapshot.data?.sources ?? [];
           return SourceCategoriesWidget(sourceList: sourceList);
          },
      ),
    );
  }
}