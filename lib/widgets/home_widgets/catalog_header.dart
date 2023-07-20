import 'package:flutter/material.dart';
import 'package:basic/widgets/theme.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkBluishColor,
          ),
        ),
        const Text(
          "Trending Products",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
