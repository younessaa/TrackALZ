

class Target {
  String name;
  String number;
  double _pourcentage;
  bool _isTargeted;
  bool connected;
  String imagePath;

  Target(this.name, this.number, {this.imagePath});

double get pourcentage => _pourcentage;
set setPourcentage (double p) => _pourcentage = p;

bool get isTargeted => _isTargeted;
set setIsTargeted (bool b) => _isTargeted = b;

}