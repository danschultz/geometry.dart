part of geometry_tests;

void testPoint() {
  
  group("Point", () {
    
    test("origin() constructor is {x:0,y:0}", () {
      var p = new Point.origin();
      expect(p, equals(new Point(0, 0)));
    });
    
    test("+ operator", () {
      var p = new Point(1, 2);
      var result = p + new Point(3, 4);
      expect(result, equals(new Point(4, 6)));
    });
    
    test("- operator", () {
      var p = new Point(3, 4);
      var result = p - new Point(1, 4);
      expect(result, equals(new Point(2, 0)));
    });
    
    test("* operator", () {
      var p = new Point(3, 4);
      var result = p * 2;
      expect(result, equals(new Point(6, 8)));
    });
    
    test("/ operator", () {
      var p = new Point(6, 4);
      var result = p / 2;
      expect(result, equals(new Point(3, 2)));
    });
    
    test("== operator", () {
      var p1 = new Point(6, 4);
      var p2 = new Point(6, 4);
      var p3 = new Point(2, 3);
      
      expect(p1 == p2, isTrue);
      expect(p1 == p3, isFalse);
    });
    
    test("distance", () {
      expect(new Point(-2, 1).distance(1, 5), equals(5));
    });
    
    test("offset", () {
      var p = new Point(1, 2);
      expect(p.offset(10, 0), equals(new Point(11, 2)));
      expect(p.offset(0, 10), equals(new Point(1, 12)));
    });
    
  });
  
}