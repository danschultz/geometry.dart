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

  bool get isPortrait => size.isPortrait;
  bool get isLandscape => size.isLandscape;
  bool get isSquare => size.isSquare;
  
  const Box(num this.x, num this.y, num this.width, num this.height);
  
  factory Box.empty() {
    return new Box(0, 0, 0, 0);
  }
  
  factory Box.corners(Point corner1, Point corner2) {
    var x = min(corner1.x, corner2.x);
    var y = min(corner1.y, corner2.y);
    var w = max(corner1.x, corner2.x) - x;
    var h = max(corner1.y, corner2.y) - y; 
    return new Box(x, y, w, h);
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
  
  factory Box.fromList(List<num> values) {
    return new Box(values[0], values[1], values[2], values[3]);
  }
  
  bool operator ==(Box other) {
    return other != null && 
        x == other.x && y == other.y && 
        width == other.width && height == other.height;
  }
  
  bool contains(num x, num y, [num width, num height]) {
    var result = (x >= this.x && x <= right) && (y >= this.y && y <= bottom);
    
    if (width != null && height != null) {
      result = result && (x + width <= right) && (y + height <= bottom);
    }
    
    return result;
  }
  
  bool containsPoint(Point point) {
    return contains(point.x, point.y);
  }
  
  bool containsBox(Box box) {
    return contains(box.x, box.y, box.width, box.height);
  }
  
  Box fitTo(Box other) {
    var scale = min(other.width / width, other.height / height);
    var newSize = size * scale;
    return newSize.toBox().moveTo(other.center - newSize.center);
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
  
  Box move(num x, num y) {
    return new Box(x, y, width, height);
  }
  
  Box moveTo(Point point) {
    return move(point.x, point.y);
  }
  
  Box offset(num dx, num dy) {
    return move(x + dx, y + dy);
  }
  
  Box offsetBy(Point point) {
    return offset(point.x, point.y);
  }
  
  Box resize(num w, num h) {
    return new Box(x, y, w, h);
  }
  
  Box resizeTo(Size size) {
    return resize(size.width, size.height);
  }
  
  @deprecated
  Box scaleTo(Box other, {String fitOrSlice: fit}) {
    if (fitOrSlice == fit) {
      return fitTo(other);
    } else if (fitOrSlice == slice) {
      return sliceTo(other);
    }
    return this;
  }
  
  Box sliceTo(Box other) {
    var scale = max(other.height / height, other.width / width);
    var newSize = size * scale;
    return newSize.toBox().moveTo(other.center - newSize.center);
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

@deprecated
const fit = "fit";

@deprecated
const slice = "slice";