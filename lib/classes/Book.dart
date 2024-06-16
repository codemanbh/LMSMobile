class Book {
  String title = "";
  String image_url = "";
  String description = "";

  Book(
      {required String title,
      required String image_url,
      required String description}) {
    this.title = title;
    this.image_url = image_url;
    this.description = description;
  }
}
