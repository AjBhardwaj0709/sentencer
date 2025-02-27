import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetcher {
  // final String apiUrl = "https://api.quotable.io/random";

  
  final String apiUrl = "https://zenquotes.io/api/random";

  Future<String> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data[0]['q']; 
      } else {
        return 'Failed to load sentence';
      }
    } catch (e) {
      print("Error fetching data: $e");
      return 'An error occurred while fetching data';
    }
  }
}
