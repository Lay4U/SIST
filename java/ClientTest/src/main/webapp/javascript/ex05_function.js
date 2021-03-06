/* 
  함수, Function
  - 메소드, 프로시저
  - 자바스크립트(메소드=함수)
  - function 키워드 사용


  선언문
  1. 자바의 선언문
    public [static] void test(int a){
      execute statement;
    }

  2. 자바스크립트의 선언문
    function test(a){
      실행문
    }

*/

function f1() {
  console.log('f1');
}

f1();
f1();
f1();

function f2(num) {
  console.log(num);
}

f2(100);
f2(200);
f2(300);

function f3() {
  return 100;
}

var result = f3();
console.log('result', result);

function f4(a, b) {
  return a + b;
}
console.clear;
console.log(f4(100, 200));

// 주의점!!
// - 실인자와 가인자가 일치하지 않아도 호출됨.
function hello(name) {
  console.log('안녕하세요.' + name + '님');
  // console.log('안녕하세요. %s님', name);
  // console.log('안녕하세요', name, '님');
}

hello('홍길동');
hello();
hello('홍길동', '아무개', '하하하');

/* 
  자료형
  - null: 그외 나머지
  - undefined: 변수를 생성 직후 초기화를 하지 않은 상태
  - 둘은 똑같다. (실제로는 다르다.)

*/

var temp = null; //명시적 선언에는 null만 사용
var temp = undefined; //X

console.log(typeof undefined);
console.log(typeof null);

console.log(null === undefined);

//포트폴리오(자바스크립트 수업 기간동안..)
// - 대략 2주(서버 수업 들어가기 전까지) ~ 최대 3주
// - 수업용(제출) ~ 취업용
