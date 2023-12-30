class House {
  final String name;
  final String description;
  final double rating;
  final double price;
  final int roomMeet;
  final String thumbnail;
  final List<String> imagePreview;

  House(
      {required this.name,
      required this.description,
      required this.rating,
      required this.price,
      required this.roomMeet,
      required this.thumbnail,
      required this.imagePreview});
}
