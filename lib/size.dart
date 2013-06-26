part of geometry;

class Size {
  
  final num width;
  final num height;
  
  Point get center => new Point(width/2, height/2);
  
  num get aspectRatio => width/height;
  num get area => width * height;
  num get perimeter => (width + height) * 2;
  bool get isEmpty => area == 0;
  bool get isPortrait => aspectRatio < 1;
  bool get isLandscape => aspectRatio > 1;
  bool get isSquare => aspectRatio == 1;
  
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
  
  factory Size.fromList(List<num> values) {
    return new Size(values[0], values[1]);
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
  
  Box toBox({Point position}) {
    position = position != null ? position : new Point.origin();
    return new Box.positionAndSize(position, this);
  }
  
  String toString() {
    return "{w:${width}, h:${height}}";
  }
  
  List<num> toList() {
    return [width, height];
  }
  
}