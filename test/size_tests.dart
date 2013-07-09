part of geometry_tests;

void testSize() {
  
  group("size", () {
    
    test("aspect ratio", () {
      var size = new Size(2, 1);
      expect(size.aspectRatio, equals(2));
    });
    
    test("area", () {
      var size = new Size(10, 5);
      expect(size.area, equals(50));
    });
    
    test("perimeter", () {
      var size = new Size(10, 5);
      expect(size.perimeter, equals(30));
    });
    
    test("isEmpty", () {
      expect(new Size(0, 0).isEmpty, isTrue);
      expect(new Size(10, 0).isEmpty, isTrue);
      expect(new Size(10, 1).isEmpty, isFalse);
    });
    
    test("center", () {
      var size = new Size(10, 6);
      expect(size.center, equals(new Point(5, 3)));
    });
    
    test("== operator", () {
      var size1 = new Size(10, 5);
      var size2 = new Size(10, 5);
      var size3 = new Size(11, 5);
      var size4 = new Size(10, 6);
      
      expect(size1 == size2, isTrue);
      expect(size1 == size3, isFalse);
      expect(size1 == size4, isFalse);
    });
    
    test("* operator", () {
      var size = new Size(10, 5);
      size = size * 2;
      expect(size, equals(new Size(20, 10)));
    });
    
    test("/ operator", () {
      var size = new Size(10, 6);
      size = size / 2;
      expect(size, equals(new Size(5, 3)));
    });
    
    test("fitTo", () {
      expect(new Size(100, 50).fitTo(new Size.square(50)), equals(new Size(50, 25)));
      expect(new Size(50, 100).fitTo(new Size.square(50)), equals(new Size(25, 50)));
    });
    
  });
  
}