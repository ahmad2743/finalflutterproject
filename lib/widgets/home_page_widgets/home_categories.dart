import 'package:flutter/material.dart';
import 'home_category.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class HomeCategories extends StatelessWidget {
  const HomeCategories();
  static AutoSizeGroup titleGrp=AutoSizeGroup();
  static AutoSizeGroup descGrp=AutoSizeGroup();

  static List<Map<String,dynamic>> categoryData=[
    {
      "imgLeft": 5.0,
      "imgBottom": 19.0,
      "imgHeight": 122.0,
      "imgPath": "assets/stats.png",
      "tabName": "Statistiques",
      "tabDesc": "stats global",
      "color": Colors.deepPurpleAccent,
    },
    {
      "imgLeft": 15.0,
      "imgBottom": -8.0,
      "imgHeight": 150.0,
      "imgPath": "assets/symptoms/symptoms.png",
      "tabName": "Symptomes",
      "tabDesc": "les principaux symptômes du covid",
      "color": Colors.teal[800],
    },
    {
      "imgPath": "assets/prevention/boy.png",
      "imgHeight": 140.0,
      "imgLeft": 15.0,
      "imgBottom": 0.0,
      "tabName": "Précautions",
      "tabDesc": "Comment éviter d'être le covid",
      "color": Colors.lightBlue[700],
    },
    {
      "imgPath": "assets/myths/myths.png",
      "tabName": "Mythes",
      "imgBottom": -30.0,
      "imgLeft": 20.0,
      "imgHeight": 170.0,
      "tabDesc": "les fausses hypothèses",
      "color": Colors.redAccent[700],
    },
    {
      "imgBottom": 10.0,
      "imgLeft": 3.0,
      "tabName": "Covid",
      "imgHeight": 130.0,
      "tabDesc": "En savoir plus sur le virus",
      "imgPath": "assets/corona.png",
      "color": Colors.orange[700],
    },
    {
      "imgBottom": -4.0,
      "imgLeft": 8.0,
      "imgPath": "assets/updates/updates.png",
      "tabName": "News",
      "imgHeight": 146.0,
      "tabDesc": "les dernières nouvelles concernant le virus",
      "color": Colors.greenAccent[700],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryData.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index){
        var cat=categoryData[index];
        return CategoryTab(
          titleGrp: titleGrp,
          descGrp: descGrp,
          imgPath: cat["imgPath"],
          imgBottom: cat["imgBottom"],
          imgHeight: cat["imgHeight"],
          imgLeft: cat["imgLeft"],
          tabDesc: cat["tabDesc"],
          tabName: cat["tabName"],
          color: cat["color"],
        );
      },
    );
  }

}
