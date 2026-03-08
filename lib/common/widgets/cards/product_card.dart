import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_image.dart';

class UProductCard extends StatelessWidget {
   final Map<String,dynamic> product;
   
  const UProductCard({
    super.key, required this.product,
   
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedImage(
              imageUrl: product["image"],
              isNetworkImage: false,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              borderRadius: 6,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["title"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    product["instructor"],
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        product["avg_rating"],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                                 color: Colors.amber
                        ),
                      ),
                      SizedBox(width: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          5,
                          (i) => Icon(
                            Icons.star_rounded,
                            size: 18,
                            color: i < product["ratings"]
                                ? Colors.yellow[700]
                                : Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "(${product["students"]})",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    product["price"],
                    style: TextStyle(fontWeight: FontWeight.bold,        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
