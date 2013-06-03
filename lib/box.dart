part of geometry;

class Box {
  
  final num x;
  final num y;
  final num width;
  final num height;
  
  num get left => x;
  num get top => y;
  num get right => x + width;
  num get bottom => y + height;
  
  Point get topLeft => new Point(x, y);
  Point get bottomRight => new Point(right, bottom);
  Point get center => new Point(x + width/2, y + height/2);
  
  Point get position => topLeft;
  Size get size => new Size(width, height);
  
  num get area => size.area;
  num get aspectRatio => size.aspectRatio;
  num get perimeter => size.perimeter;
  bool get isEmpty => size.isEmpty;
  
  const Box(num this.x, num this.y, num this.width, num this.height);
  
  factory Box.empty() {
    return new Box(0, 0, 0, 0);
  }
  
  factory Box.positionAndSize(Point position, Size size) {
    return new Box(position.x, position.y, size.width, size.height);
  }
  
  factory Box.safe(num x, num y, num width, num height) {
    return new Box(x != null ? x : 0, 
                   y != null ? y : 0,
                   width != null ? width : 0,
                   height != null ? height : 0);
  }
  
  bool operator ==(Box other) {
    return other != null && 
        x == other.x && y == other.y && 
        width == other.width && height == other.height;
  }
  
  String toString() {
    return "{x:${x}, y:${y}, w:${width}, h:${height}}";
  }
  
}