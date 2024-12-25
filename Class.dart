class Car{
  String Brand;
  String Model;
  int year;

  Car(this.Brand , this.Model , this.year);

  void displayinfo(){
    print('Car Details:');
    print('Brand: $Brand');
    print('Model : $Model');
    print('Year : $year');
  }
}

void main(){
  Car myCar = Car('Toyata', 'Corolla', 2020);
  myCar.displayinfo();
}