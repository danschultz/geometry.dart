part of geometry;

class Size {
  
  final num width;
  final num height;
  
  Point get center => new Point(width/2, height/2);
  
  num get aspectRatio => width/height;
  num get area => width * height;
  num get perimeter => (width + height) * 2;
  bool get isEmpty => area == 0;
  
  const Size(num this.width, num this.height);
  
  factory Size.empty() {
    return new Size(0, 0);
  }
  
  factory Size.safe(num width, num height) {
    return new Size(width != null ? width : 0, height != null ? height : 0);
  }
  
  factory Size.square(num size) {
    return new Size(size, size);
  }
  
  bool operator ==(Size other) {
    return other != null && width == other.width && height == other.height;
  }
  
  Size operator *(num magnitude) {
    return new Size(width*magnitude, height*magnitude);
  }
  
  Size operator /(num magnitude) {
    return new Size(width/magnitude, height/magnitude);
  }
  
  Box toBox() {
    return new Box(0, 0, width, height);
  }
  
  String toString() {
    return "{w:${width}, h:${height}}";
  }
  
}