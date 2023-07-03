import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:basic/models/catalog.dart';
import 'package:basic/widgets/drawer.dart';
import 'package:basic/widgets/item_widget.dart';
import 'package:basic/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}


//The below code is writtern by me but is not working as expected

// ignore_for_file: public_member_api_docs, sort_constructors_first
// //import 'dart:html';
// import 'dart:convert';
// import 'dart:async';
// //import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:basic/models/catalog.dart';
// import 'package:basic/widgets/theme.dart';
// import 'package:velocity_x/velocity_x.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // final int days = 30;

//   // final String name = "Codepur";

//   @override
//   void initState() {
//     super.initState();
//     // loadData();
//   }

//   loadData() async {
//     await Future.delayed(Duration(seconds: 2));
//     var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
//     var decodedData = jsonDecode(catalogJson);
//     var productsData = decodedData["products"];
//     CatalogModel.items = List.from(productsData)
//         .map<Item>((item) => Item.fromMap(item))
//         .toList();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyTheme.creamColor,
//       body: Container(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CatalogHeader(),
//             if (CatalogModel.items.isNotEmpty && CatalogModel.items != null)
//               CatalogList().expand()
//             else
//               const Center(
//                 child: CircularProgressIndicator(),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CatalogList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: CatalogModel.items.length,
//       itemBuilder: (context, index) {
//         final catalog = CatalogModel.items[index];
//         return CatalogItem(catalog: catalog);
//       },
//     );
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final Item catalog;
//   const CatalogItem({required this.catalog});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       height: 150,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           CatalogImage(image: catalog.image),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   catalog.name,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: MyTheme.darkBluishColor,
//                   ),
//                 ),
//                 Text(
//                   catalog.desc,
//                 ),
//                 ButtonBar(
//                   alignment: MainAxisAlignment.spaceBetween,
//                   buttonPadding: EdgeInsets.only(right: 8),
//                   children: [
//                     Text(
//                       "\$${catalog.price}",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                     ),
//                     const HeightBox(
//                       10,
//                     ),
//                     ElevatedButton(
//                         onPressed: () {},
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                               MyTheme.darkBluishColor),
//                           shape: MaterialStateProperty.all(
//                             StadiumBorder(),
//                           ),
//                         ),
//                         child: Text("Buy"))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CatalogHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(32),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Catalog App",
//             style: TextStyle(
//               fontSize: 40,
//               fontWeight: FontWeight.bold,
//               color: MyTheme.darkBluishColor,
//             ),
//           ),
//           const Text(
//             "Trending products",
//             style: TextStyle(
//               fontSize: 20,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class CatalogImage extends StatelessWidget {
//   final String image;
//   const CatalogImage({required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//       padding: const EdgeInsets.all(16),
//       color: MyTheme.creamColor,
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Image.network(
//           image,
//           width: 20,
//         ),
//       ),
//     );
//   }
// }