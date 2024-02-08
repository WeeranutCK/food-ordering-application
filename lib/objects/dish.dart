class Dish {
  Dish(
    this._name,
    this._description,
    this._prepareTime,
    this._price,
    this._ratings,
    this._image,
    this._categories,
  );

  final String _name;
  final String _description;
  final int _prepareTime;
  final double _price;
  final double _ratings;
  final String _image;
  final List<String> _categories;

  String get name => _name;
  String get description => _description;
  int get prepareTime => _prepareTime;
  double get price => _price;
  double get ratings => _ratings;
  String get image => _image;
  List<String> get categories => _categories;
}
