import 'package:flut_news/services/networking.dart';
import 'package:flut_news/utilities/constants.dart';


class NewsModel {
  Future<dynamic> getNews(String countryName) async {
    NetworkHelper networkHelper = NetworkHelper(url: '$kNewsApiURL?country=$countryName&apiKey=$kApiKey');
    var newsData = await networkHelper.getData();
    return newsData;
  }
}