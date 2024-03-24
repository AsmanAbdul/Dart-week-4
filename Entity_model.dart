import 'dart:io';

// Define an interface
abstract class Animal {
  void makeSound();
}

// Base class
class LivingBeing {
  String name;

  LivingBeing(this.name);

  void breathe() {
    print('$name is breathing.');
  }
}

// Derived class implementing an interface
class Dog extends LivingBeing implements Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name barks!');
  }

  // Override a method
  @override
  void breathe() {
    super.breathe();
    print('$name breathes rapidly.'); // Additional behavior
  }

  // Method demonstrating the use of a loop
  void wagTail() {
    for (int i = 0; i < 3; i++) {
      print('$name is wagging its tail.');
    }
  }
}

// Function to create Dog instance from file
Dog createDogFromFile(String filePath) {
  final file = File(filePath);
  final data = file.readAsStringSync().trim();
  return Dog(data);
}

void main() {
  // Read file path from command line arguments or environment variables
  final filePath =
      'dog_data.txt'; // Default value, can be replaced with configurable source

  // Create an instance of Dog initialized with data from a file
  final dog = createDogFromFile(filePath);

  // Demonstrate inherited method
  dog.breathe();

  // Demonstrate overridden method
  dog.makeSound();

  // Demonstrate method with loop
  dog.wagTail();
}
