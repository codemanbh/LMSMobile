class Quote {
  String text = "";
  String auther = "";
  bool isDone = false;

  Quote({required String text, required String auther, required bool isDone}) {
    this.text = text;
    this.auther = auther;
    this.isDone = isDone;
  }
}
