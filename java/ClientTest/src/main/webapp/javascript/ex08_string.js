// 문자열 함수

var txt = 'hello!! Hong!!';

// 문자열 길이(문자 수)
// - 메소드X, 프로퍼티O
console.log(txt.length);

//검색
// - indexOf()
// - lastIndexOf()

// Java vs JavaScript - 관계 X

/* 
 1. Mocha
 2. LiveScript
 3. JavaScript
  */

// 검색
// indexof
// lastIndexOf
// -zero-based index

console.log(txt.indexOf('o'));
console.log(txt.indexOf('o', 5));
console.log(txt.indexOf('a'));
console.log(txt.lastIndexOf('o'));

console.log(txt.toUpperCase('a'));
console.log(txt.toLowerCase('A'));

//치환 : replace
// - 1번만 치환한다. (1회)
// - 모든 대상을 치환하려면 정규 표현식을 사용해야 한다.
console.log(txt.replace('hong', 'lee'));
console.log(txt.replace('!', '?'));
console.log(txt.replace(/!/gi, '?'));

//추출
// - substring()
// - substr()
// - charAt(index)
// - charCodeAt(index)
txt = 'abcdefghijk';

console.log(txt.substring(2, 5));
console.log(txt.substring(2));
console.log(txt.substr(2, 5)); //2번째부터 5글자를 가져와라
console.log(txt.substr(2)); //2번째부터 끝까지
console.log(txt.charAt(2));
console.log(txt.charCodeAt(2));
console.log('A' > 'B'); //문자코드 비교 지원
console.log('홍길동' > '아무개');

//공백 제거
txt = '     하나      둘        셋       ';
console.log(txt.trim());
console.log(txt.trimStart());
console.log(txt.trimEnd());
console.log(txt.trimLeft());
console.log(txt.trimRight());

//패턴 검색
txt = 'hong.';
console.log(txt.startsWith('h'));
console.log(txt.endsWith('.'));

//분할
txt = '홍길동,아무개,하하하,호호호';
var temp = txt.split(',');
console.log(temp);
console.log(temp[0]);
