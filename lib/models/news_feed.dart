import 'package:dio_retrofit_demo/models/news_content.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NewsFeed extends GetxController {
  final _newsFeed = [].obs;
  final Dio _dio = Dio();
  final String url = 'https://fir-dd4c8-default-rtdb.firebaseio.com/data.json';

  RxList getNewsFeed() {
    return _newsFeed;
  }

  Future<void> fetchFeed() async {
    _newsFeed.clear(); // to avoid duplication while fetching
    final Response<Map<String, dynamic>> response =
        await _dio.getUri(Uri.parse(url));

    await Future.delayed(const Duration(seconds: 2));
    response.data!.forEach((key, value) {
      _newsFeed.add(
        NewsContent(
          response.data![key]['title'],
          response.data![key]['author'],
          response.data![key]['description'],
          response.data![key]['content'],
          response.data![key]['urlToImage'],
        ),
      );
    });
  }
}
