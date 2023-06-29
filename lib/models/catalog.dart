class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  Item(
    id: "Ujjwal",
    name: "iPhone 14 Pro",
    desc: "Apple iPhone 14 Pro",
    price: 1000,
    color: "#33505a",
    image: "image_url_to_be_inserted_here",
  )
];
