part of geometry;

class Point {

  final num x;
  final num y;
  
  const Point([num this.x = 0, num this.y = 0]);
  
  @deprecated
  factory Point.origin() {
    return new Point();
  }
  
  factory Point.safe(num x, num y) {
    return new Point(x != null ? x : 0, y != null ? y : 0);
  }
  
  factory Point.fromList(List<num> values) {
    return new Point(values[0], values[1]);
  }
  
  Point operator +(Point other) {
    return other != null ? offset(other.x, other.y) : this;
  }
  
  Point operator -(Point other) {
    return other != null ? offset(-other.x, -other.y) : this; 
  }
  
  Point operator *(num magnitude) {
    return new Point(x * magnitude, y * magnitude);
  }
  
  Point operator /(num magnitude) {
    return new Point(x / magnitude, y / magnitude);
  }
  
  bool operator ==(Point other) {
    return other != null && x == other.x && y == other.y;
  }
  
  double distance(num px, num py) {
    var dx = x - px;
    var dy = y - py;
    return sqrt((dx * dx) + (dy * dy));
  }
  
  double distanceTo(Point other) {
    return distance(other.x, other.y);
  }
  
  Point offset(num dx, num dy) {
    return new Point(x + dx, y + dy);
  }
  
  Box toBox(Point other) {
    return new Box.corners(this, other);
  }
  
  Point transpose() {
    return new Point(y, x);
  }
  
  String toString() {
    return "{x:${x}, y:${y}}";
  }
  
  List<num> toList() {
    return [x, y];
  }
  
}