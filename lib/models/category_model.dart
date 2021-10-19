class Category {
  final int _id;
  final String _title;
  final String _imageUrl;

  Category(this._id, this._title, this._imageUrl);

  String get imageUrl => _imageUrl;

  String get title => _title;

  int get id => _id;
}