import 'package:elyoum_elsa2e3/api/api_manager.dart';
import 'package:elyoum_elsa2e3/models/news_response.dart';
import 'package:elyoum_elsa2e3/models/source_response.dart';
import 'package:elyoum_elsa2e3/utils/app_text_style.dart';
import 'package:elyoum_elsa2e3/widgets/main_error_widget.dart';
import 'package:elyoum_elsa2e3/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';

import 'news_card_widget.dart';

class NewsWidget extends StatelessWidget{
  final Source source;

  NewsWidget({super.key, required this.source});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(source.id ?? ""),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return MainLoadingWidget();
          }else if (snapshot.hasError){
            return MainErrorWidget(
                errorMessage: "Something Went Wrong",
                onPressed: () {
                  ApiManager.getNewsBySourceId(source.id??"");
                },
            );
          }else if (snapshot.data!.status != "ok"){
            return MainErrorWidget(
                errorMessage: snapshot.data!.message!,
                onPressed: () {
                  ApiManager.getNewsBySourceId(source.id ?? "");
                },
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return
            newsList.isEmpty ?
                Center(
                  child: Text(
                    "No News Yet !",
                    style: theme.textTheme.bodyLarge,
                  ),
                )
                :
            ListView.separated(
              itemBuilder: (context, index) {
                return NewsCardWidget(news: newsList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16,
                );
              },
              itemCount: newsList.length
          );
        },
    );
  }

}