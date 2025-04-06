---
layout: post
categories: [JavaScript]
title: 2. bool 그리고 null과 undefined
summary: bool과 null, undefined에 대해서
published: true
---

# 1. bool

JS에서는 모든 값을 bool로 변환할 수 있다.<br>
그 중 변환 시 false로 변환되는 값을 'falsy값'이라고 하는데 그 값들은 아래와 같다.<br>
```js
undefined
null
0
-0
NaN
""	// 빈 문자열
```
그 외에 모든 값은 변환 시 true로 변환된다.<br>
<br>
하지만 위에 적힌 것들이 모두 변환 시 false가 된다고 해서 같은 취급을 하는 것은 아니다.<br>
```js
if (null){
    console.log("true");
}
else {
    console.log("false");
}
// false


if (undefined){
    console.log("true");
}
else {
    console.log("false");
}
// false


if (null === undefined){
    console.log("same");
}
else {
    console.log("different");
}
// different


if (null == undefined){
    console.log("same");
}
else {
    console.log("different");
}
// same
```
null과 undefined가 논리적으로 false로 인식되지만, 엄격한 비교를 위해 동등 연산자가 아닌 일치 연산자로 확인해본다면 서로 다른 값으로 인식한다는 것을 알 수 있다.<br>

좀 더 다양한 경우를 비교해 본디면, 이래의 경우를 제외하고는 전부 논리적으로 false이다.<br>
```js
"" == 0

"" == -0

undefined == null

0 == -0
```
<br>

---
# 2. null과 undefined

JS에는 객체가 없는 경우를 나타내는 특별한 값이 두 개 있다.  
각각 해당 타입의 유일한 멤버이다.<br>
<br>
나만 그런지 모르겠지만, 사실 실제로 코드를 짜다보면 자주 마주하게 되는 것은 undefined이다.<br>
<br>
둘 다 모두 값이 없다는 뜻이지만, 보통 null은 객체가 없다는 것을 나타내주기 위해 의도적으로 사용하는 경우이고,<br>
의도하든 안하든 초기화되지 않은 변수의 값과 같이, 명시적으로 나타내지 않은 경우 undefined로 처리되기 때문이다.(함수에 전달되지 않은 인자 포함)<br>
또한 존재하지 않는 배열 요소에 접근했을 때도 undefined가 반환된다.<br>
<br>
일반적으로 다른 언어에서는 아예 에러가 나기 마련인데 JS에서는 undefined가 반환되어 코드가 해당 부분을 넘어간다.<br>
물론 의도치 않게 undefined를 연산에 사용하면 최종적으로는 에러가 나기 마련이지만.<br>
<br>
아래와 같이 확인해 볼 수 있다.<br>
```js
let a = [1, 2, 3];
let b;

function c(){
    // nothing
}

function d(p1, p2){
    console.log(p1, p2);
}

console.log(a[3]);	// undefined
console.log(b);		// undefined
console.log(c());	// undefined
d(1);			// 1 undefined
```
<br>

---
# 3. 마치며

간단하게 JS의 특이한 값들을 정리해봤다.<br>
undefined 같은 경우는 멋대로 코드를 동작시키지말고 에러를 던져줬으면 좋겠다.<br>