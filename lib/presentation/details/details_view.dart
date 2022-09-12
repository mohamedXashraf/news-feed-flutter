import 'package:flutter/material.dart';
import 'package:news_feed/utils/common.dart';
import 'package:news_feed/utils/strings.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../data/model/news.dart';
import '../../utils/colors.dart';

class Details extends StatelessWidget {

  News article;

  Details({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 7,
        foregroundColor: primaryColor,
        backgroundColor: backgroundColor,
        leading: IconButton(icon: const Icon(Icons.arrow_back_rounded, color: primaryColor,), onPressed: () { Navigator.pop(context); },),
        title: text(text: app_name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          remoteImage(context, article.urlToImage ?? ""),
          const SizedBox(height: 10,),
          text(text: article.title ?? "", bold: true, color: primaryColor),
          const SizedBox(height: 10,),
          text(text: article.author ?? "", bold: false, color: secondaryColor, size: 15),
          const SizedBox(height: 50,),
          text(text: article.description ?? "", bold: false, color: secondaryColor, size: 13),
          const SizedBox(height: 50,),
          ElevatedButton(
            onPressed: () async { await canLaunchUrlString(article.url ?? "") ? await launchUrlString(article.url ?? "") : print("Could not launch ${article.url}"); },
            style: ElevatedButton.styleFrom(primary: primaryColor, elevation: 1, minimumSize: const Size(40, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3),),),
            child: text(text: open_website, color: Colors.white),
          )
        ],
      ),
    );
  }
}
