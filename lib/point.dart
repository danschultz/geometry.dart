part of geometry;

class Point {

  static const _ORIGIN = const Point(0, 0);
  
  final num x;
  final num y;
  
  const Point([num this.x = 0, num this.y = 0]);
  
  factory Point.origin() {
    return _ORIGIN;
  }
  
  factory Point.safe(num x, num y) {
    return new Point(x != null ? x : 0, y != null ? y : 0);
  }
  
  factory Point.fromList(List<num> values) {
    return new Point(values[0], values[1]);
  }
  
  Point operator +(Point other) {
    return other != null ? offset(dx: other.x, dy: other.y) : this;
  }
  
  Point operator -(Point other) {
    return other != null ? offset(dx: -other.x, dy: -other.y) : this; 
  }
  
  Point operator *(num magnitude) {
    return new Point(x*magnitude, y*magnitude);
  }
  
  Point operator /(num magnitude) {
    return new Point(x/magnitude, y/magnitude);
  }
  
  bool operator ==(Point other) {
    return other != null && x == other.x && y == other.y;
  }
  
  Point offset({num dx: 0, num dy: 0}) {
    return new Point(x + dx, y + dy);
  }
  
  Box toBox(Point other) {
    return new Box.corners(this, other);
  }
  
  String toString() {
    return "{x:${x}, y:${y}}";
  }
  
  List<num> toList() {
    return [x, y];
  }
  
}