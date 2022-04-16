class Coffee {
  final String name;
  final String image;
  final double price;

  Coffee({
    required this.name,
    required this.image,
    required this.price,
  });
}

final listCoffees = <Coffee>[
  Coffee(
    name: 'Café Expresso',
    price: 1.5,
    image:
        'https://cdn.pixabay.com/photo/2019/05/16/12/49/coffee-4207078_960_720.png',
  ),
  Coffee(
    name: 'Café Beans',
    price: 2.0,
    image:
        'https://cdn.pixabay.com/photo/2019/04/13/18/24/coffee-4125240_960_720.png',
  ),
  Coffee(
    name: 'Café Chicara',
    price: 1.8,
    image:
        'https://cdn.pixabay.com/photo/2012/04/14/15/14/coffee-34251_960_720.png',
  ),
];
