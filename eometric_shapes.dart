import 'dart:io';

// Interface for a shape
abstract class Shape {
  double calculateArea();
}

// Base class for geometric shapes
class GeometricShape implements Shape {
  @override
  double calculateArea() {
    return 0; // Base implementation returns 0, to be overridden by subclasses
  }
}

// Rectangle class inheriting GeometricShape and implementing Shape interface
class Rectangle extends GeometricShape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }
}

// Square class inheriting Rectangle
class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  double calculateArea() {
    return width * width; // Override to calculate area for a square
  }
}

// Circle class inheriting GeometricShape and implementing Shape interface
class Circle extends GeometricShape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius; // Assuming pi is 3.14
  }
}

// Method to read data from file and create an instance of Rectangle
Rectangle createRectangleFromFile(String filename) {
  var file = File(filename);
  var lines = file.readAsLinesSync();
  var width = double.parse(lines[0]);
  var height = double.parse(lines[1]);
  return Rectangle(width, height);
}

// Method demonstrating the use of a loop
void printAreas(List<Shape> shapes) {
  for (var shape in shapes) {
    print('Area: ${shape.calculateArea()}');
  }
}

void main() {
  // Example usage
  var rectangle = createRectangleFromFile('rectangle_data.txt');
  var square = Square(5);
  var circle = Circle(3);

  // List of shapes
  var shapes = [rectangle, square, circle];

  // Print areas
  printAreas(shapes);
}
