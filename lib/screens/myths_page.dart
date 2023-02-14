import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MythsScreen extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  final imgPath;

  final Color color;

  List<Map<String, String>> myths = [
    {
      "myth": "La maladie SRAS-CoV-2 NE PEUT PAS être transmise par les piqûres de moustiques.",
      "desc": "Il s'agit d'un virus respiratoire qui se propage principalement par les gouttelettes provenant de la toux ou des éternuements d'une personne infectée, de la salive ou de l'écoulement nasal.",
      "imgPath": "assets/myths/mosquito.png",
    },
    {
      "myth":
          "Le virus COVID-19 peut être transmis dans les régions au climat chaud et humide",
      "desc":
          "Il n'y a aucune raison de croire que le temps chaud peut tuer le nouveau coronavirus" +
              " ou d'autres maladies. Il peut être transmis dans n'importe quel climat.",
      "imgPath": "assets/myths/hot.png",
    },
    {
      "myth": "L'ail ne protège pas contre l'infection par le coronavirus.",
      "desc": "L'ail peut avoir certaines propriétés anti-microbiennes. Cependant, aucune preuve ne suggère que l'ail puisse protéger les personnes contre le virus COVID-19.",
      "imgPath": "assets/myths/garlic.png",
    },
    {
      "myth": "Les antibiotiques ne fonctionnent PAS contre les virus, seulement contre les bactéries.",
      "desc": "Le nouveau coronavirus (2019-nCoV) est un virus et, par conséquent, les antibiotiques ne doivent pas être utilisés comme moyen de prévention ou de traitement.",
      "imgPath": "assets/myths/antibiotics.png",
    },
    {
      "myth": "Les colis en provenance de Chine NE PEUVENT PAS propager le coronavirus",
      "desc":
          "Les scientifiques pensent que le virus ne peut pas survivre sur les lettres ou les colis pendant une période prolongée. Le risque de propagation à partir de produits ou de colis expédiés est très faible.",
      "imgPath": "assets/myths/package.png",
    },
    {
      "myth": "Les chats et les chiens ne propagent pas le coronavirus",
      "desc":
          "À l'heure actuelle, il existe peu d'éléments indiquant que le SRAS-CoV-2 peut infecter les chats et les chiens. Les scientifiques débattent toujours de l'importance de ce cas dans l'épidémie..",
      "imgPath": "assets/myths/dogs.png",
    },
    {
      "myth": "Tous les groupes d'âge PEUVENT entrer en contact avec le SRAS-CoV-2",
      "desc": "Elle peut infecter des personnes de tout âge, y compris des enfants. Cependant, les adultes plus âgés et les personnes ayant déjà des problèmes de santé sont plus susceptibles de tomber gravement malades.",
      "imgPath": "assets/myths/ages.png",
    },
  ];

  MythsScreen({ Key? key, this.imgPath, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: color,
              size: 28,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //Cover Image Container
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              color: color.withOpacity(0.2),
            ),
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (ctx, constraint) => Stack(
                children: <Widget>[
                  //Title
                  Positioned(
                    top: constraint.maxHeight * 0.45,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: constraint.maxWidth * 0.55,
                        child: AutoSizeText(
                          "Mythes sur le Covid",
                          style: TextStyle(
                            color: color,
                            fontFamily: "Montserrat",
                            fontSize: 31,
                            fontWeight: FontWeight.w700,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 31,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),

                  //Image
                  Positioned.fill(
                    bottom: -17.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: imgPath,
                            child: Image(
                              image: AssetImage(imgPath),
                              height: constraint.maxHeight * 0.93,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Myth card
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
              width: MediaQuery.of(context).size.width > 360.0
                  ? MediaQuery.of(context).size.width - 31.0
                  : MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    //Details
                    Flexible(
                      fit: FlexFit.loose,
                      child: PageView.builder(
                          controller: controller,
                          physics: const BouncingScrollPhysics(),
                          itemCount: myths.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(23, 35, 23, 15),
                              child: LayoutBuilder(
                                builder: (ctx, constraint) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight*0.27,
                                      child: Image(
                                        image: AssetImage(
                                            "${myths[index]["imgPath"]}"),
                                        height: 100.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraint.maxHeight*0.11,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight*0.17,
                                      child: AutoSizeText(
                                        "${myths[index]["myth"]}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          height: 1.1,
                                          fontFamily: "Montserrat",
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxFontSize: 20,
                                        stepGranularity: 2,
                                        maxLines: 3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight*0.45,
                                      child: AutoSizeText(
                                        "${myths[index]['desc']}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 16.5,
                                          height: 1.4,
                                          fontFamily: "Montserrat",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxFontSize: 16.5,
                                        stepGranularity: 1.5,
                                        maxLines: 6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),

                    //Dot Indicator
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: myths.length,
                        effect: const WormEffect(
                            dotHeight: 11,
                            dotWidth: 11,
                            spacing: 12.0,
                            strokeWidth: 1.2,
                            dotColor: Colors.grey,
                            paintStyle: PaintingStyle.stroke,
                            activeDotColor: Colors.redAccent),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
