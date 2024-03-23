import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/pages/WebView.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetails extends StatelessWidget {
  String imageUrl;
  String title;
  String desc;
  String Content;
  String author;
  String published_on;
  String weburl;
  String Source;

  NewsDetails(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.Content,
      required this.desc,
      required this.published_on,
      required this.Source,
      required this.weburl});

  void shareLink(String link,String Sub) {
    Share.share(link,subject: Sub);
    Share.shareUri(Uri.parse(link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff111111),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.orange,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Row(
                        children: [
                          Text(
                            "NewsHive",
                            style: GoogleFonts.singleDay(
                                color: Colors.orange, fontSize: 30),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Image(
                              image: NetworkImage("lib/asset/bee.png"),
                              color: Colors.orange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: GestureDetector(
                              onTap: (){shareLink(weburl,title);},
                                child: Icon(
                              Icons.share,
                              color: Colors.orange,
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 6.0, right: 6, top: 3, bottom: 3),
              child: Container(
                child: Text(
                  title,
                  style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Row(
                children: [
                  Text(
                    published_on.substring(0, 10),
                    style:
                        GoogleFonts.inter(color: Colors.white60, fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    " Source-${Source}",
                    style:
                        GoogleFonts.inter(color: Colors.white60, fontSize: 10),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 215),
              child: Text(
                "Author: ${author}",
                style: GoogleFonts.inter(color: Colors.white70, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Text(
                desc,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Text(
                Content,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => WebViewPage()));
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "View Full in Web",
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
