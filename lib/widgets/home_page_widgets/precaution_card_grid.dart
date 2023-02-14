import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrecautionCardGrid extends StatefulWidget {
  @override
  _PrecautionCardGridState createState() => _PrecautionCardGridState();
}

class _PrecautionCardGridState extends State<PrecautionCardGrid> {
  int selectedIndex=0;
  final List<Map<String, String>> preventions = const [
    {
      "prevention": "Porter un masque",
      "desc":
      "toujours porter un masque pour sortir.",
      "imgPath": "assets/prevention/mask.png",
    },
    {
      "prevention": "Se laver les mains",
      "desc": "Se laver les mains avec de l'eau et du savon regulièrement.",
      "imgPath": "assets/prevention/wash.png",
    },
    {
      "prevention": "Couvrir la toux",
      "desc": "Toussez ou éternuez dans votre coude ou couvrez-vous la bouche avec une serviette jetable.",
      "imgPath": "assets/prevention/coughCover.png",
    },
    {
      "prevention": "Se désinfectant souvent",
      "desc": "Utilisez un désinfectant à base d'alcool si vous ne disposez pas d'eau et de savon..",
      "imgPath": "assets/prevention/sanitizer.png",
    },
    {
      "prevention": "Pas de contact avec le visage",
      "desc": "Ne vous touchez pas les yeux, le nez ou la bouche souvent et avec des mains non lavées.",
      "imgPath": "assets/prevention/touch.png",
    },
    {
      "prevention": "Distanciation Sociale",
      "desc":
      "Gardez une distance de 70 m avec les autres personnes. Restez chez vous et évitez les rassemblements.",
      "imgPath": "assets/prevention/socialDistance.png",
    },
  ];

  static AutoSizeGroup titleGrp=AutoSizeGroup();
  static AutoSizeGroup descGrp=AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding:
        const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 15.0,
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        scrollDirection: Axis.vertical,
        itemCount: preventions.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex=index;
              });
            },
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 5,
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 650),
                decoration: BoxDecoration(
                  color: index==selectedIndex? Colors.teal[50]:Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                child: LayoutBuilder(
                  builder: (ctx, constraint) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image(
                        image: AssetImage(preventions[index]["imgPath"]!),
                        height: constraint.maxHeight * 0.46,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight * 0.1,
                        child: AutoSizeText(
                          "${preventions[index]["prevention"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          maxFontSize: 14,
                          maxLines: 1,
                          minFontSize: 11,
                          stepGranularity: 1,
                          group: titleGrp,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight*0.30,
                        child: AutoSizeText(
                          "${preventions[index]['desc']}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          maxFontSize: 12,
                          minFontSize: 9,
                          group: descGrp,
                          stepGranularity: 1,
                          maxLines: 4,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
