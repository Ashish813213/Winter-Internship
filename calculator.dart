import 'dart:io';

int addition(int a , int b){
          return a+b;
  }
  int substraction(int a , int b){
    return a-b;
  }
  int multiplication(int a , int b){
    return a*b;
  }
  double division(double a , double b){
    return a/b;
  }

void main(){
  stdout.write("Enter The Number1:");
  dynamic a = double.parse(stdin.readLineSync()!);
  stdout.write("Enter The Operator");
  String operator = stdin.readLineSync()!;
  stdout.write("Enter The Number 2:");
  dynamic b = double.parse(stdin.readLineSync()!);
  dynamic result;
  if(operator == "+"){
      result = addition(a , b);
  }
  else if(operator == "-"){
    result =substraction(a, b);
  }
  else if(operator == "*"){
   result =  multiplication(a, b);
  }
  else if(operator =="/"){
    result = division(a, b);
  }
  print('result is: ${result}');
}