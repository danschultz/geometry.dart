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
  
  bool contains({num x, num y, Point pt, Box box}) {
    var result = true;
    
    if (pt != null) {
      result = result && contains(x: pt.x, y: pt.y);
    }
    
    if (box != null) {
      result = result && 
               contains(x: box.x, y: box.y) && 
               box.right <= right && box.bottom <= bottom;
    }
    
    if (x != null) {
      result = result && x >= this.x && x <= right;
    }
    
    if (y != null) {
      result = result && y >= this.y && y <= bottom;
    }
    
    return result;
  }
  
  bool intersects(Box box) {
    return !intersection(box).isEmpty;
  }
  
  Box intersection(Box box) {
    var minX = max(x, box.x);
    var minY = max(y, box.y);
    var maxX = min(right, box.right);
    var maxY = min(bottom, box.bottom);
    return new Box(minX, minY, max(0, maxX-minX), max(0, maxY-minY));
  }
  
  Box move({num x, num y, Point to}) {
    x = to != null ? to.x : x != null ? x : this.x;
    y = to != null ? to.y : y != null ? y : this.y;
    return new Box(x, y, width, height);
  }
  
  Box offset({num dx: 0, num dy: 0, Point by}) {
    dx = by != null ? by.x : dx;
    dy = by != null ? by.y : dy;
    return move(x: x+dx, y: y+dy);
  }
  
  Box resize({num w, num h, Size to}) {
    w = to != null ? to.width : w != null ? w : width;
    h = to != null ? to.height : h != null ? h : height;
    return new Box(x, y, w, h);
  }
  
  String toString() {
    return "{x:${x}, y:${y}, w:${width}, h:${height}}";
  }
  
  List<num> toList() {
    return [x, y, width, height];
  }
  
  Box union(Box box) {
    var minX = min(x, box.x);
    var minY = min(y, box.y);
    var maxX = max(right, box.right);
    var maxY = max(bottom, box.bottom);
    return new Box(minX, minY, maxX-minX, maxY-minY);
  }
  
}