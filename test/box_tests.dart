part of geometry_tests;

void testBox() {
  
  group("Box", () {
    
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
    
    test("corners constructor", () {
      var corner1 = new Point(10, 20);
      var corner2 = new Point(30, 40);
      
      expect(new Box.corners(corner1, corner2), equals(new Box(10, 20, 20, 20)));
      expect(new Box.corners(corner2, corner1), equals(new Box(10, 20, 20, 20)));
    });
    
    test("== operator", () {
      var box1 = new Box(1, 2, 3, 4);
      var box2 = new Box(1, 2, 3, 4);
      var box3 = new Box(2, 3, 4, 5);
      
      expect(box1 == box2, isTrue);
      expect(box1 == box3, isFalse);
    });
    
    test("hashCode", () {
      expect(new Box(10, 20, 30, 40).hashCode, equals(new Box(10, 20, 30, 40).hashCode));
      expect(new Box(10, 20, 30, 40).hashCode, isNot(equals(new Box(5, 20, 30, 40).hashCode)));
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
    
    test("contains x, y", () {
      expect(box.contains(9, 19), isFalse);
      expect(box.contains(10, 20), isTrue);
      expect(box.contains(40, 60), isTrue);
      expect(box.contains(41, 61), isFalse);
    });
    
    test("contains x, y, width, height", () {
      expect(box.contains(9, 19, 10, 10), isFalse);
      expect(box.contains(10, 20, 30, 40), isTrue);
      expect(box.contains(30, 40, 30, 40), isFalse);
    });
    
    test("contains point", () {
      expect(box.containsPoint(new Point(9, 20)), isFalse);
      expect(box.containsPoint(new Point(10, 19)), isFalse);
      expect(box.containsPoint(new Point(10, 20)), isTrue);

      expect(box.containsPoint(new Point(40, 60)), isTrue);
      expect(box.containsPoint(new Point(41, 60)), isFalse);
      expect(box.containsPoint(new Point(40, 61)), isFalse);
    });
    
    test("contains rect", () {
      expect(box.containsBox(new Box(10, 19, 10, 10)), isFalse);
      expect(box.containsBox(new Box(10, 20, 30, 40)), isTrue);
      expect(box.containsBox(new Box(30, 40, 30, 40)), isFalse);
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
      expect(box.move(1, 20), equals(new Box(1, 20, 30, 40)));
      expect(box.move(10, 1), equals(new Box(10, 1, 30, 40)));
      expect(box.moveTo(new Point(1, 2)), equals(new Box(1, 2, 30, 40)));
    });
    
    test("offset", () {
      expect(box.offset(1, 0), equals(new Box(11, 20, 30, 40)));
      expect(box.offset(0, 1), equals(new Box(10, 21, 30, 40)));
      expect(box.offsetBy(new Point(1, 2)), equals(new Box(11, 22, 30, 40)));
    });
    
    test("resize", () {
      expect(box.resize(10, 40), equals(new Box(10, 20, 10, 40)));
      expect(box.resize(30, 10), equals(new Box(10, 20, 30, 10)));
      expect(box.resizeTo(new Size(100, 200)), equals(new Box(10, 20, 100, 200)));
    });
    
    test("union", () {
      expect(box.union(new Box(5, 5, 100, 100)), equals(new Box(5, 5, 100, 100)));
      expect(box.union(new Box(30, 30, 10, 10)), equals(new Box(10, 20, 30, 40)));
    });
    
    // Deprecated
    test("scaleTo using fit", () {
      var landscape = new Box(0, 0, 200, 100);
      var portrait = new Box(0, 0, 100, 200);
      
      expect(landscape.scaleTo(portrait, fitOrSlice: fit), equals(new Box(0, 75, 100, 50)));
      expect(portrait.scaleTo(landscape, fitOrSlice: fit), equals(new Box(75, 0, 50, 100)));
    });

    // Deprecated
    test("scaleTo using slice", () {
      var landscape = new Box(0, 0, 200, 100);
      var portrait = new Box(0, 0, 100, 200);
      
      expect(landscape.scaleTo(portrait, fitOrSlice: slice), equals(new Box(-150, 0, 400, 200)));
      expect(portrait.scaleTo(landscape, fitOrSlice: slice), equals(new Box(0, -150, 200, 400)));
    });
    
    test("fitTo", () {
      var landscape = new Box(0, 0, 200, 100);
      var portrait = new Box(0, 0, 100, 200);
      
      expect(landscape.fitTo(portrait), equals(new Box(0, 75, 100, 50)));
      expect(portrait.fitTo(landscape), equals(new Box(75, 0, 50, 100)));
    });
    
    test("sliceTo", () {
      var landscape = new Box(0, 0, 200, 100);
      var portrait = new Box(0, 0, 100, 200);
      
      expect(landscape.sliceTo(portrait), equals(new Box(-150, 0, 400, 200)));
      expect(portrait.sliceTo(landscape), equals(new Box(0, -150, 200, 400)));
    });
    
    test("transpose", () {
      expect(box.transpose(), equals(new Box(20, 10, 40, 30)));
    });
    
    test("scale (*) operator", () {
      expect(box * 2, equals(new Box(20, 40, 60, 80)));
    });
    
    test("scale (/) operator", () {
      expect(box / 2, equals(new Box(5, 10, 15, 20)));
    });
    
  });
  
}