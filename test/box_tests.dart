part of geometry_tests;

void testBox() {
  
  group("box", () {
    
    Box box;
    
    setUp(() {
      box = new Box(10, 20, 30, 40);
    });
    
    test("empty constructor", () {
      expect(new Box.empty(), equals(new Box(0, 0, 0, 0)));
    });
    
    test("position and size constructor", () {
      expect(new Box.positionAndSize(new Point(10, 20), new Size(30, 40)), equals(new Box(10, 20, 30, 40)));
    });
    
    test("== operator", () {
      var box1 = new Box(1, 2, 3, 4);
      var box2 = new Box(1, 2, 3, 4);
      var box3 = new Box(2, 3, 4, 5);
      
      expect(box1 == box2, isTrue);
      expect(box1 == box3, isFalse);
    });
    
    test("top", () {
      expect(box.top, equals(box.y));
    });
    
    test("bottom", () {
      expect(box.bottom, equals(box.y + box.height));
    });
    
    test("left", () {
      expect(box.left, equals(box.x));
    });
    
    test("right", () {
      expect(box.right, equals(box.x + box.width));
    });
    
    test("topLeft", () {
      expect(box.topLeft, equals(new Point(box.x, box.y)));
    });
    
    test("bottomRight", () {
      expect(box.bottomRight, equals(new Point(box.right, box.bottom)));
    });
    
    test("position", () {
      expect(box.position, equals(new Point(box.x, box.y)));
    });
    
    test("center", () {
      expect(box.center, equals(new Point(25, 40)));
    });
    
    test("size", () {
      expect(box.size, equals(new Size(box.width, box.height)));
    });
    
    test("area", () {
      expect(box.area, equals(1200));
    });
    
    test("aspectRatio", () {
      expect(box.aspectRatio, equals(0.75));
    });
    
    test("perimeter", () {
      expect(box.perimeter, equals(140));
    });
    
    test("contains x", () {
      expect(box.contains(x: 9), isFalse);
      expect(box.contains(x: 10), isTrue);
      expect(box.contains(x: 40), isTrue);
      expect(box.contains(x: 41), isFalse);
    });
    
    test("contains y", () {
      expect(box.contains(y: 19), isFalse);
      expect(box.contains(y: 20), isTrue);
      expect(box.contains(y: 60), isTrue);
      expect(box.contains(y: 61), isFalse);
    });
    
    test("contains point", () {
      expect(box.contains(pt: new Point(9, 20)), isFalse);
      expect(box.contains(pt: new Point(10, 19)), isFalse);
      expect(box.contains(pt: new Point(10, 20)), isTrue);

      expect(box.contains(pt: new Point(40, 60)), isTrue);
      expect(box.contains(pt: new Point(41, 60)), isFalse);
      expect(box.contains(pt: new Point(40, 61)), isFalse);
    });
    
    test("intersection", () {
      expect(box.intersection(new Box(25, 40, 100, 100)), equals(new Box(25, 40, 15, 20)));
      expect(box.intersection(new Box(0, 0, 25, 40)), equals(new Box(10, 20, 15, 20)));
    });
    
    test("intersects", () {
      expect(box.intersects(new Box(25, 40, 100, 100)), isTrue);
      expect(box.intersects(new Box(0, 0, 1, 1)), isFalse);
    });
    
    test("move", () {
      expect(box.move(x: 1), equals(new Box(1, 20, 30, 40)));
      expect(box.move(y: 1), equals(new Box(10, 1, 30, 40)));
      expect(box.move(to: new Point(1, 2)), equals(new Box(1, 2, 30, 40)));
    });
    
    test("offset", () {
      expect(box.offset(dx: 1), equals(new Box(11, 20, 30, 40)));
      expect(box.offset(dy: 1), equals(new Box(10, 21, 30, 40)));
      expect(box.offset(by: new Point(1, 2)), equals(new Box(11, 22, 30, 40)));
    });
    
    test("resize", () {
      expect(box.resize(w: 10), equals(new Box(10, 20, 10, 40)));
      expect(box.resize(h: 10), equals(new Box(10, 20, 30, 10)));
      expect(box.resize(to: new Size(100, 200)), equals(new Box(10, 20, 100, 200)));
    });
    
    test("union", () {
      expect(box.union(new Box(5, 5, 100, 100)), equals(new Box(5, 5, 100, 100)));
      expect(box.union(new Box(30, 30, 10, 10)), equals(new Box(10, 20, 30, 40)));
    });
    
  });
  
}