part of geometry;

class Point {
  
  final num x;
  final num y;
  
  const Point([num this.x = 0, num this.y = 0]);
  
  factory Point.origin() {
    return new Point(0, 0);
  }
  
  factory Point.safe(num x, num y) {
    return new Point(x != null ? x : 0, y != null ? y : 0);
  }
  
  Point operator +(Point other) {
    return other != null ? new Point(x + other.x, y + other.y) : this;
  }
  
  Point operator -(Point other) {
    return other != null ? new Point(x - other.x, y - other.y) : this; 
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
  
  String toString() {
    return "{x:${x}, y:${y}}";
  }
  
}