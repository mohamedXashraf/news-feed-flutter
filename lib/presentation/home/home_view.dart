import 'package:flutter/material.dart';
import 'package:news_feed/presentation/details/details_view.dart';
import 'package:news_feed/presentation/home/home_view_intent.dart';
import 'package:news_feed/presentation/home/home_view_state.dart';
import 'package:news_feed/utils/colors.dart';
import 'package:news_feed/utils/common.dart';
import 'package:news_feed/utils/strings.dart';
import 'package:news_feed/utils/time_date_converter.dart';
import '../../data/model/news.dart';
import '../../utils/images.dart';
import 'home_viewmodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _viewModel = HomeViewModel();
  List<News>? articles;

  @override
  void initState() {
    super.initState();
    _viewModel.subscribe((state) {
      Navigator.pop(context);
      switch (state.runtimeType){
        case NewsDataState:{
          setState(() {
            articles = (state as NewsDataState).articles;
          });
        }
        break;
        case ErrorState:{
          messageDialog(context, (state as ErrorState).error, true);
        }
        break;
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      loadingDialog(context);
      _viewModel.doIntent(GetNewsFeedIntent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: homeAppbar(context, app_name),
      body: SafeArea(
        child: (articles == null || articles!.isEmpty) ? _emptyView() : ListView.builder(itemBuilder: (context, position) {
          News article = articles![position];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return Details(article: article); })),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  remoteImage(context, article.urlToImage ?? ""),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(text: article.title ?? "", bold: true, color: primaryColor),
                        const SizedBox(height: 10,),
                        text(text: article.author ?? "", bold: false, color: secondaryColor, size: 15),
                        const SizedBox(height: 10,),
                        matchParentText(context: context, text: parseDate(article.publishedAt ?? ""), bold: false, color: secondaryColor, size: 13, align: TextAlign.end),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _emptyView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(ic_logo), fit: BoxFit.contain, height: 150, width: 150,),
          text(text: empty_view_note),
        ],
      ),
    );
  }
}
