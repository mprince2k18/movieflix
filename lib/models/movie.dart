final  movies = [
  Movie(id: 1, name: 'Avengers', category: 'Action/Sci-Fi', releaseYear: 2012, rating: 8.2, image: 'images/avengers.jpg',),
  Movie(id: 2, name: 'Captain America', category: 'Action/Sci-Fi', releaseYear: 2011, rating: 8.3, image: 'images/captainamerica.jpg'),
  Movie(id: 3, name: 'Captain Marvel', category: 'Action/Sci-Fi', releaseYear: 2018, rating: 8.7, image: 'images/captainmarvel.jpg'),
  Movie(id: 4, name: 'Dr Strange', category: 'Action/Sci-Fi', releaseYear: 2017, rating: 7.5, image: 'images/drstrange.jpg'),
  Movie(id: 5, name: 'Iron Man', category: 'Action/Sci-Fi', releaseYear: 2008, rating: 8.4, image: 'images/ironman.jpg'),
  Movie(id: 6, name: 'Spider Man', category: 'Action/Sci-Fi', releaseYear: 2016, rating: 8.1, image: 'images/spiderman.jpeg'),
  Movie(id: 7, name: 'Thor', category: 'Action/Sci-Fi', releaseYear: 2009, rating: 8.0, image: 'images/thor.jpg'),
];

class Movie {
  int id;
  String name;
  String category;
  int releaseYear;
  double rating;
  String image;
  bool favourite;

  Movie(
      {required this.id,
      required this.name,
      required this.category,
      required this.releaseYear,
      required this.rating,
      required this.image,
      this.favourite = false});

  void toggleFavourite(){
    favourite = !favourite;
  }
}
