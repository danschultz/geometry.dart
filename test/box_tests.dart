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
    
  });
  
}