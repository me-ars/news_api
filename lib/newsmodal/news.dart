import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsHeadline extends StatelessWidget {
  String imageurl;
  String title;

  NewsHeadline({super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 6, right: 6),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(8)),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
          Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white70,),
            child:CachedNetworkImage(fit: BoxFit.fill,
              imageUrl: imageurl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(color: Colors.orange,value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

        ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: GoogleFonts.inter(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
