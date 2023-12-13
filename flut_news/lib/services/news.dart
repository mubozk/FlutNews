import 'package:flut_news/services/networking.dart';
import 'package:flut_news/utilities/constants.dart';


class NewsModel {
  Future<dynamic> getNews(String countryCode) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
          url: '$kNewsApiURL?country=$countryCode&apiKey=$kApiKey');
      var newsData = await networkHelper.getData();
      return newsData;
    } catch(e) {
      print('error fetching news: $e');
      return null;
    }
  }
  Future<dynamic> getNewsByCategory(String category) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
          url: '$kNewsApiURL?category=$category&apiKey=$kApiKey');
      var newsData = await networkHelper.getData();
      return newsData;
    } catch (e) {
      print('Error fetching news by category: $e');
      return null;
    }
  }
}