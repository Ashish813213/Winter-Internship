class Animal{
  void makeSound(){
    print("Animal makes a sound");
  }
}

class Dog extends Animal{
  @override
  void makeSound(){
    print("Dog barks");
  }
}

void main(){
  Animal myAnimal = Animal();
  myAnimal.makeSound();

  Dog myDog = Dog();
  myDog.makeSound();
}