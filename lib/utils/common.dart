import 'package:news_feed/utils/strings.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'images.dart';

AppBar homeAppbar(BuildContext context, String title){
  return AppBar(
    elevation: 7,
    foregroundColor: primaryColor,
    backgroundColor: backgroundColor,
    leading: const Padding(padding: EdgeInsets.all(7), child: Image(image: AssetImage(ic_logo), fit: BoxFit.contain, height: 50, width: 50,),),
    title: text(text: title, color: primaryColor, size: 18),
  );
}

Widget text({required String text, double size = 17, Color? color, bool bold = false, align = TextAlign.start}){
  return Text(text,
    textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Comfortaa",
        color: color ?? primaryColor,
        fontWeight: bold ? FontWeight.w900 : FontWeight.w700
    ),
  );
}

Widget matchParentText({required BuildContext context, required String text, double size = 17, Color? color, bool bold = false, align = TextAlign.start}){
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Text(text,
      textAlign: align,
      style: TextStyle(
          fontSize: size,
          fontFamily: "Comfortaa",
          color: color ?? primaryColor,
          fontWeight: bold ? FontWeight.w900 : FontWeight.w700
      ),
    ),
  );
}

void loadingDialog(BuildContext context){
  showDialog(context: context, barrierDismissible: false, useSafeArea: true, builder: (_) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  });
}

void messageDialog(BuildContext context, String message, bool isError){
  showDialog(context: context, barrierDismissible: false, useSafeArea: true, builder: (_) {
    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 50,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(isError ? Icons.report_gmailerrorred_rounded : Icons.task_alt_rounded, color: primaryColor, size: 63,),
                const SizedBox(height: 16,),
                text(text: message, bold: false, color: primaryColor, align: TextAlign.center),
                const SizedBox(height: 16,),
                TextButton(child: text(text: ok), onPressed: () => Navigator.pop(context))
              ],
            ),
          ),
        ),
      ),
    );
  });
}

Widget remoteImage(BuildContext context, String image){
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(7)),
    child: Image(image: NetworkImage(image), fit: BoxFit.fill,),
  );
}