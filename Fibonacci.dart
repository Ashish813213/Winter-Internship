import 'dart:io';

int fibonacci(int n){
  if(n<=1){
    return n;
  }
  else{
        return fibonacci(n-1)+fibonacci(n-2);
  }
 
}

void main(){
  stdout.write("Enter The Number Of Series To Be Print");
  int n = int.parse(stdin.readLineSync()!);

  for(int i=0; i<n; i++){
    print(fibonacci(i));
  }
}