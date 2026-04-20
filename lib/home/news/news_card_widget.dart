import 'package:cached_network_image/cached_network_image.dart';
import 'package:elyoum_elsa2e3/models/news_response.dart';
import 'package:elyoum_elsa2e3/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardWidget extends StatelessWidget{
  final News news;

  const NewsCardWidget({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    final publishedTime = DateTime.tryParse(news.publishedAt ?? '');
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.primaryColor,
          width: 1.5,
        )
      ),
      child: Column(
        spacing: 10,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
              placeholder: (context, url) => MainLoadingWidget(),
              errorWidget: (context, url, error) => Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 32,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          Text(
            news.title ?? "",
            style: theme.textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "By: ${news.author ?? "Unknown"}",
                  style: theme.textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Text(
               publishedTime != null ?
               timeago.format(publishedTime)
                   : "Unknown Time",
                style: theme.textTheme.titleSmall,
              )
            ],
          )
        ],
      ),
    );
  }

}