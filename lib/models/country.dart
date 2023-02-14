class Country {
   String? country;
   String? code;
   String? flagPath;
   int? todayCases;
   int? totalCases;
   int? newDeaths;
   int? critical;
   int? active;
   int? totalDeaths;
   int? totalRecovered;
   bool? isIncreasing;
   int? testsConducted;

  Country({
     this.country,
     this.code,
     this.flagPath,
     this.todayCases,
     this.totalCases,
     this.active,
     this.newDeaths,
     this.totalDeaths,
     this.totalRecovered,
     this.isIncreasing,
     this.critical,
     this.testsConducted
  });

  Country formMap(Map<String,dynamic> data){
    String countryName =  data["country"];
    Map<String,dynamic> countryInfo=data["countryInfo"];
    String code=countryInfo["iso2"];
    return Country(
        country: countryName,
        code : code,
        flagPath: "assets/flags/${code.toLowerCase()}.png",
        todayCases: data["todayCases"],
        totalCases: data['cases'],
        active: data["active"],
        newDeaths: data['todayDeaths'],
        totalDeaths: data['deaths'],
        totalRecovered: data['recovered'],
        critical: data["critical"],
        testsConducted: data["tests"],
        isIncreasing: data["todayCases"]>0? true : false
    );
  }
}