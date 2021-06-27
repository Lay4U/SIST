/* 
  형변환 함수
  1. 정수 parseInt(값)
  2. 실수 parseFloat(값)
*/

var n1 = 3.14;
console.log(parseInt(n1)); //실수 -> 정수

var n2 = '100';
console.log(parseInt(n2));
console.log(typeof parseInt(n2)); // 문자열

var n3 = 200;
console.log(parseFloat(n3)); //정수 -> 실수

var n4 = '5.21';
console.log(parseFloat(n4), typeof parseFloat(n4)); //문자열

//실수 -> 정수
//문자열 -> 정수, 실수
console.log('100' + 100, parseInt('100') + 100);
console.log('100' * 2, parseInt('100') * 2);

//JavaScript를 작성 -> Java처럼

//CSS 속성 조작
//box > width: 150px; > x2 > width: 300px;
var width = '150px';
console.log(width * 2); //Nan(난, Not a Number)

//시작부터 연속된 숫자만을 취하고 나머지는 버린 뒤 형변환
//뒤에 글자 없앨때 parseInt를 많이 씀
console.log(parseInt(width)); //'150px' -> 150
console.log(parseInt('20세')); //'20세' -> 20
console.log(parseInt('나이20')); // Nan
console.log(parseInt('1234ABC456DEF'));

var fontSize = '1.5em';
console.log(parseFloat(fontSize));

//boolean isNan
// - is not a number?
// - 숫자면? false, 숫자가 아니면? true

var age = '20'; //입력

// 유효성 검사(숫자만 입력했는가?)
console.log(isNaN(age) ? '나이를 올바르게 입력..' : '통과');
