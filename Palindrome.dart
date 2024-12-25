bool isPalindrome(String str){
  String cleanedStr = str.replaceAll('','').toLowerCase();
  String reversedstr = cleanedStr.split('').reversed.join('');

  return cleanedStr == reversedstr;
}

void main(){
  String str = "madam";

  if(isPalindrome(str)){
    print('$str Is a Palindrome');
  }
  else{
    print('$str is not a palindrome');
  }
}