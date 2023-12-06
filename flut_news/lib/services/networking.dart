import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print('Error: ${response.statusCode}, ${response.reasonPhrase}');
        return null;
      }
    } catch(e) {
      print('Exception during HTTP request: $e');
      return null;
    }
  }
}