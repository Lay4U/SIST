// 날짜시간 자료형 + 함수

//현재 시각
//Calendar c = Calendar.getInstance();
//Date d = new Date();

var now = new Date();
console.log(now);

//요소 추출
//c.get(Calendar.Year)

console.log(now.getYear());
console.log(now.getFullYear());
console.log(now.getMonth());
console.log(now.getDate());
console.log(now.getDay());
console.log(now.getHours());
console.log(now.getMinutes());
console.log(now.getSeconds());
console.log(now.getMilliseconds());
console.log(now.getTime());

//덤프(+출력)
// - %tF(2021-06-23), %tT(10:22:30), %tA(요일)
console.log(now);
console.log(now.toString());
console.log(now.toLocaleString()); //현지 설정

console.log(now.toDateString());
console.log(now.toTimeString());

console.log(now.toLocaleDateString());
console.log(now.toLocaleTimeString());

// https://momentjs.com/

// 특정 시각
var christmas = new Date();
christmas.setFullYear(2021);
christmas.setMonth(11);
christmas.setDate(25);

console.log(christmas.toLocaleString());

//연산
// - tick 연산
console.log(christmas - now);
console.log((christmas - now) / 1000 / 60 / 60 / 24);

var silgi = new Date();
silgi.setFullYear(2021);
silgi.setMonth(6);
silgi.setDate(10);
console.log((silgi - now) / 1000 / 60 / 60 / 24);

var tick = now.getTime() + 100 * 24 * 60 * 60 * 1000;
var hday = new Date();
hday.setTime(tick);
console.log(hday.toLocaleString());
