import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../values/default_country_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cases_progress_bars.dart';
import 'new_case_boxes.dart';

// ignore: must_be_immutable
class CountryCardDetails extends StatefulWidget {
  Color color;
  int totalCases;
  final countryName, countryCode, flagPath, isIncreasing;
  Map<String, dynamic> todayJson, yestJson;

  CountryCardDetails(
      {super.key, required this.color,
      required this.todayJson,
      required this.yestJson,
      required this.totalCases,
      this.countryName,
      this.countryCode,
      this.flagPath,
      this.isIncreasing});

  @override
  _CountryCardDetailsState createState() => _CountryCardDetailsState();
}

class _CountryCardDetailsState extends State<CountryCardDetails>
    with TickerProviderStateMixin {
  late AnimationController _controller1, _controller2;
  late Duration textScaleDuration;
  final formatter = NumberFormat("#,###");
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    textScaleDuration = const Duration(milliseconds: 200);
    _controller1 = AnimationController(
        vsync: this,
        duration: textScaleDuration,
        lowerBound: 0.7,
        upperBound: 1);
    _controller2 = AnimationController(
        vsync: this,
        duration: textScaleDuration,
        lowerBound: 0.7,
        upperBound: 1);
    _controller1.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        //Today / Yesterday Title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _controller1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    _controller2.reverse();
                    _controller1.forward();
                  });
                },
                child: AutoSizeText(
                  "Aujourd'hui",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: selectedIndex == 0
                          ? FontWeight.w700
                          : FontWeight.w600,
                      color: Colors.grey[800],
                      fontSize: 22.0,
                  ),
                  maxFontSize: 22,
                ),
              ),
            ),
            const SizedBox(width: 5),
            ScaleTransition(
              scale: _controller2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                    _controller1.reverse();
                    _controller2.forward();
                  });
                },
                child: AutoSizeText(
                  "Hier",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: selectedIndex == 0
                          ? FontWeight.w600
                          : FontWeight.w700,
                      color: Colors.grey[800],
                      fontSize: 22.0,
                  ),
                  maxFontSize: 22,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        //New case boxes
        selectedIndex == 0
            ? NewCaseBoxes(
                color: widget.color,
                affected: widget.todayJson["todayCases"],
                deaths: widget.todayJson["todayDeaths"],
                recovered: widget.todayJson["recovered"] -
                    widget.yestJson["recovered"],
                tested: widget.todayJson["tests"],
                totalCases: widget.todayJson["cases"],
                today: true,
              )
            : NewCaseBoxes(
                color: widget.color,
                affected: widget.yestJson["todayCases"],
                deaths: widget.yestJson["todayDeaths"],
                recovered: widget.todayJson["recovered"],
                tested: widget.yestJson["tests"],
                totalCases: widget.todayJson["cases"],
                today: false,
              ),

        const SizedBox(height: 25),

        //Total Case Bars
        selectedIndex == 0
            ? CaseBars(
                color: widget.color,
                totalActive: widget.todayJson["active"],
                totalDeaths: widget.todayJson["deaths"],
                totalCases: widget.todayJson["cases"],
                totalRecovered: widget.todayJson["recovered"],
              )
            : CaseBars(
                color: widget.color,
                totalActive: widget.yestJson["active"],
                totalDeaths: widget.yestJson["deaths"],
                totalCases: widget.yestJson["cases"],
                totalRecovered: widget.yestJson["recovered"],
              ),

        const Expanded(child: SizedBox(height: 35)),

        //Set as default button
        defaultCountry.countryName != widget.countryName
            ? InkWell(
                onTap: () async {
                  defaultCountry.countryName = widget.countryName;
                  defaultCountry.countryCode = widget.countryCode;
                  defaultCountry.color = widget.color.value;
                  defaultCountry.flagPath = widget.flagPath;
                  defaultCountry.totalCases = widget.todayJson["cases"];
                  defaultCountry.isIncreasing =
                      widget.todayJson["cases"] > widget.yestJson["cases"];
                  var jsonMap = defaultCountry.toJson();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("defaultCountry", json.encode(jsonMap));
                  Navigator.of(context).pop();
                  // ignore: use_build_context_synchronously
                  Flushbar(
                    messageText: AutoSizeText(
                      "${widget.countryName} mettre par defaut",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17,
                        color: Colors.white
                      ),
                      maxFontSize: 17,
                    ),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    icon: Icon(
                      Icons.info_outline,
                      size: 28.0,
                      color: widget.color,
                    ),
                    flushbarStyle: FlushbarStyle.FLOATING,
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    shouldIconPulse: false,
                    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                    duration: const Duration(seconds: 3),
                    leftBarIndicatorColor: widget.color,
                  ).show(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Center(
                    child: AutoSizeText(
                      "Mettre par defaut",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxFontSize: 20,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
