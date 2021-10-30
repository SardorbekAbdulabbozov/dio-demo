import 'package:dio_retrofit_demo/models/news_feed.dart';
import 'package:dio_retrofit_demo/widget/news_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    NewsFeed feedController = Get.put(NewsFeed());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('NEWS'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await feedController.fetchFeed();
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 500,
          height: size.height * 0.9,
          child: FutureBuilder(
              future: feedController.fetchFeed(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: feedController.getNewsFeed().length,
                        itemBuilder: (ctx, index) {
                          return NewsCard(
                            title: feedController.getNewsFeed()[index].title,
                            author: feedController.getNewsFeed()[index].author,
                            description:
                                feedController.getNewsFeed()[index].description,
                            content:
                                feedController.getNewsFeed()[index].content,
                            urlToImage:
                                feedController.getNewsFeed()[index].urlToImage,
                          );
                        });
              }),
        ),
      ),
    );
  }
}
