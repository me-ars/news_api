import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:news/newsmodal/NewsDetail.dart';
import 'package:news/newsmodal/news.dart';

import '../widgets/category tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> CategoryImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp77tOuE9jNhyS1QHvR1qmB_tYCBKV_BhKGw&usqp=CAU",
    "https://etimg.etb2bimg.com/photo/81478822.cms",
    "https://wallpapercave.com/wp/wp10389671.jpg",
    "https://st.depositphotos.com/1063346/1340/i/450/depositphotos_13409056-stock-photo-assorted-sports-equipment-on-black.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkO9iv52eXExbG1tWmRIC3OWKFGuxHgV6_KA&usqp=CAU",
    "https://t4.ftcdn.net/jpg/05/77/30/41/360_F_577304142_CxvFcMu05tnW4BwGzTMXeymfZGFh5i9p.jpg",
    "https://png.pngtree.com/background/20230417/original/pngtree-medical-colorful-love-picture-image_2447155.jpg"
  ];
  List<String> CategoryNames = [
    "General",
    "Entertainment",
    "Tech",
    "Sports",
    "Business",
    "Health",
    "Science"
  ];
  List<dynamic> articles = [];
  int selectedCategoryIndex = 0;

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=07b467f0e9624fafb9a2a532ecc1afd3";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      if (json["status"] == "ok") {
        setState(() {
          articles = json["articles"];
        });
      } else {
        print("Failed to fetch news: ${json["message"]}");
      }
    } else {
      // Handle HTTP error
      print("HTTP Error: ${response.statusCode}");
    }
  }

  Future<void> getSportsNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=07b467f0e9624fafb9a2a532ecc1afd3";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      if (json["status"] == "ok") {
        setState(() {
          articles = json["articles"];
        });
      } else {
        print("Failed to fetch news: ${json["message"]}");
      }
    } else {
      // Handle HTTP error
      print("HTTP Error: ${response.statusCode}");
    }
  }

  ScrollController _scrollController = ScrollController();

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=${category}&pageSize=100&apiKey=07b467f0e9624fafb9a2a532ecc1afd3";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      if (json["status"] == "ok") {
        setState(() {
          articles = json["articles"];
        });
      } else {
        print("Failed to fetch news: ${json["message"]}");
      }
    } else {
      // Handle HTTP error
      print("HTTP Error: ${response.statusCode}");
    }
  }

  Future<void> getsub() async {
    String url =
        "https://newsapi.org/v2/everything?q=game&apiKey=07b467f0e9624fafb9a2a532ecc1afd3";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      if (json["status"] == "ok") {
        print(json);
      } else {
        print("Failed to fetch news: ${json["message"]}");
      }
    } else {
      // Handle HTTP error
      print("HTTP Error: ${response.statusCode}");
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the scroll controller when done
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    selectedCategoryIndex =
        0; // Set to 0 when the app starts to trigger getNews()
    getNews();
    // getsub();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xff111111),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NewsHive",
                  style:
                      GoogleFonts.singleDay(color: Colors.orange, fontSize: 30),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: NetworkImage("lib/asset/bee.png"),
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CategoryImages.length,
              itemBuilder: (context, index) {
                return CategoryTile(
                  imageLink: CategoryImages[index],
                  name: CategoryNames[index],
                  onTap: () async {
                    setState(() {
                      _scrollController.jumpTo(0);
                      selectedCategoryIndex = index;
                    });
                    if (index == 3) {
                      await getCategoryNews("sports");
                    } else if (index == 1) {
                      await getCategoryNews("entertainment");
                    } else if (index == 2) {
                      await getCategoryNews("technology");
                    } else if (index == 4) {
                      await getCategoryNews("business");
                    } else if (index == 5) {
                      await getCategoryNews("health");
                    } else if (index == 6) {
                      await getCategoryNews("science");
                    } else if (index == 0) {
                      await getNews();
                    } else {
                      await getNews(); // Moved this line inside the 'else' block
                    }
                  },
                  isSelected: selectedCategoryIndex == index,
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewsDetails(
                            imageUrl: articles[index]["urlToImage"].toString(),
                            title: articles[index]["title"].toString(),
                            author: articles[index]["author"],
                            desc: articles[index]["description"],
                            Content: articles[index]["content"],
                            published_on: articles[index]["publishedAt"],
                            Source: articles[index]["source"]["name"],
                            weburl: articles[index]["url"],
                          ),
                        ),
                      );
                    },
                    child: NewsHeadline(
                      imageurl: articles[index]["urlToImage"] ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfOMTch6U7ZOHA_AZjocotgQGmBxtyUZR3XA&usqp=CAU",
                      title: articles[index]["title"] ??
                          "", // Use empty string if title is null
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
