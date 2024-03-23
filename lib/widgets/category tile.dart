import 'package:flutter/material.dart';
class CategoryTile extends StatelessWidget {
  final String imageLink;
  final String name;
  final VoidCallback onTap;
  final bool isSelected; // Indicates if this category is selected

  const CategoryTile({
    Key? key,
    required this.imageLink,
    required this.name,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 8.0, left: 8),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageLink),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? Colors.orangeAccent : Colors.transparent,
                  width: 2, // Adjust the width as needed
                ),
              ),
              height: 35,
              width: 80,
            ),
            Container(
              height: 35,
              width: 80,
              color: Colors.black38,
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
