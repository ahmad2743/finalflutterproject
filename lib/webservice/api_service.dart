class ApiService{
  static const String apiKey="apiKey=9a6b23ce65b04ba89cdd76d09e25bddc";
  final String _newsUrl="http://newsapi.org/v2/everything?";
  final String _statsUrl="https://disease.sh/v3/covid-19/";
  final String _query="q=covid%2019%20vaccine";
  final String _limit="pageSize=10&page=1";

  String get query => _query;
  String get newsUrl => _newsUrl;
  String get statsUrl => _statsUrl;
  String get limit => _limit;
  String get apikey => apiKey;
}
