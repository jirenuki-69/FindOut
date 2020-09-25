class Sitio {
  String name, profession, description;
  List<String> images;
  int favoritesCount;
  int commentsCount;

  Sitio({
    this.name,
    this.profession,
    this.description,
    this.images,
    this.favoritesCount,
    this.commentsCount
  });
}

final String _sitiosPath = "lib/assets/img/Sitios";

List<Sitio> sitios = [
  Sitio(
    name: "Luango",
    profession: "Cocktails",
    description: "Proident cupidatat fugiat enim mollit ut qui tempor. Dolore veniam reprehenderit excepteur proident eu quis deserunt ea eiusmod sit ut dolor tempor duis. Deserunt elit occaecat Lorem minim nulla ipsum ipsum. Id exercitation culpa ex tempor. Ea eu aute fugiat officia enim. Duis incididunt magna ipsum sint sint commodo in dolore adipisicing. Quis dolore laboris aute tempor minim cupidatat ea.",
    commentsCount: 8,
    favoritesCount: 22,
    images: [
      "$_sitiosPath/Luango1.png",
      "$_sitiosPath/Luango2.jpg",
      "$_sitiosPath/Luango3.jpg",
    ],
  ),
  Sitio(
    name: "La Negrita",
    profession: "Café",
    description: "In cillum sunt id laboris ad voluptate exercitation elit dolore incididunt irure et Lorem. Aliqua duis aliquip exercitation non cillum tempor et sint velit veniam exercitation. Pariatur adipisicing nulla consectetur reprehenderit esse minim ad ullamco amet cupidatat exercitation sunt. Et sunt culpa culpa aliqua magna irure est id in.",
    commentsCount: 18,
    favoritesCount: 65,
    images: [
      "$_sitiosPath/Negrita1.jpg",
      "$_sitiosPath/Negrita2.jpg",
      "$_sitiosPath/Negrita3.jpg",
    ],
  ),
  Sitio(
    name: "La Recova",
    profession: "Parrillada",
    description: "In cillum sunt id laboris ad voluptate exercitation elit dolore incididunt irure et Lorem. Aliqua duis aliquip exercitation non cillum tempor et sint velit veniam exercitation. Pariatur adipisicing nulla consectetur reprehenderit esse minim ad ullamco amet cupidatat exercitation sunt. Et sunt culpa culpa aliqua magna irure est id in.",
    commentsCount: 78,
    favoritesCount: 222,
    images: [
      "$_sitiosPath/Recova1.jpg",
      "$_sitiosPath/Recova2.jpg",
      "$_sitiosPath/Recova3.jpg",
    ],
  ),
];
