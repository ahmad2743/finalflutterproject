import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VirusDetailsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  static List<Map<String, String>> details = [
    {
      "detail": "Introduction",
      "desc":
      "Coronavirus est un virus à ARN simple brin positif et enveloppé. Il appartient à la sous-famille des Coronavirus, comme son nom l'indique, avec les pointes caractéristiques en forme de couronne à leur surface",    },
    {
      "detail": "Origine",
      "desc": "Le virus serait né à la fin de l'année dernière dans un marché alimentaire de la ville chinoise de Wuhan qui vendait illégalement des animaux sauvages. Les experts de la santé pensent qu'il pourrait avoir trouvé son origine chez les chauves-souris et être passé à l'homme, probablement par l'intermédiaire d'une autre espèce animale."
    },
    {
      "detail": "C'est dangereux ?",
      "desc": "Les infections à coronavirus se manifestent par plusieurs symptômes, dont la fièvre, la toux, l'essoufflement \n\n et les difficultés respiratoires. Bien que les cas graves puissent entraîner une pneumonie et la mort, il se peut que de nombreux cas de maladie plus bénigne ne soient pas détectés. La plupart des personnes décédées souffraient de problèmes médicaux antérieurs ou étaient des personnes âgées dont le système immunitaire était affaibli.",
    },
    {
      "detail": "Transmission",
      "desc": "Le nouveau coronavirus peut se transmettre d'une personne à l'autre, bien que la facilité avec laquelle cela se produit ne soit pas claire.\NLa transmission se fait le plus souvent par contact étroit avec une personne infectée, par l'intermédiaire de particules dans l'air provenant de la toux ou des éternuements, ou par le contact d'une personne ou d'un objet infecté portant le virus, puis par contact avec la bouche, le nez ou les yeux.",
    },
    {
      "detail": "Existe-t-il des vaccins contre le coronavirus ?",
      "desc": "À ce jour, aucun médicament spécifique n'est recommandé pour prévenir ou traiter le nouveau coronavirus, mais les personnes infectées par le virus doivent recevoir les soins appropriés pour soulager et traiter les symptômes. Certains médecins essaient un mélange puissant d'antirétroviraux et de médicaments contre la grippe pour traiter les personnes infectées, mais les données scientifiques ne permettent pas de savoir s'ils sont efficaces.",
    },
  ];

  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  const VirusDetailsScreen({ Key? key, this.imgPath, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
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
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: pageHeight,
        child: Column(
          children: <Widget>[
            //image tag container
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: color.withOpacity(0.2)),
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
                            "SARS-CoV-2",
                            style: TextStyle(
                              color: color,
                              fontFamily: "Montserrat",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            stepGranularity: 2,
                            maxFontSize: 30,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -90,
                      bottom: -30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                              tag: imgPath,
                              child: Image(
                                image: AssetImage(imgPath),
                                height: constraint.maxHeight * 0.92,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Details List
            Container(
              height: pageHeight - 220,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: LayoutBuilder(
                      builder: (ctx, constraint) => LimitedBox(
                        maxWidth: constraint.maxWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            AutoSizeText(
                              "${details[index]["detail"]}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "Montserrat",
                                color: color,
                                fontWeight: FontWeight.w700,
                              ),
                              maxFontSize: 28,
                              stepGranularity: 2,
                              maxLines: 3,
                              group: titleGrp,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              "${details[index]['desc']}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                fontFamily: "Montserrat",
                                color: Colors.grey[850],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                              maxFontSize: 18,
                              group: descGrp,
                              stepGranularity: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
