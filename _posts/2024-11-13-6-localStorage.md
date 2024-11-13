---
layout: post
categories: [JavaScript]
title: 6. localStorage와 sessionStorage
summary: localStorage와 sessionStorage에 대해서
---

블로그를 개발하면서 localStorage를 사용해본 경험이 있다.<br>
다크모드를 만들 떄인데, 다크모드를 활성화 한 후에 페이지를 옮기거나, 브라우저를 껐다 켜도 다크모드가 유지되게 하고 싶었다.<br>
그 방법을 찾던 중에 찾은 것이 localStorage를 이용하는 방법이었고,<br>
우선 구현하고자 하는 것은 끝냈기 때문에 더 효율적인 방법은 찾지 않고 넘어갔다.<br>
<br>
정확히 알고 쓴 것은 아니지만, 알아낸 김에 정리해보고자 한다.<br>

---

# 1. localStorage와 sessionStorage

## 1) localStorage
먼저 localStorage는 브라우저 내에 key-value 쌍으로 값을 저장할 수 있게 해준다.<br>
페이지를 새로고침하거나, 브라우저를 다시 실행해도 그 값은 유지된다.<br>
<br>
실제로 브라우저의 개발자 도구 같은 것을 사용해서 값을 확인할 수 있다.<br>
구글 크롬 브라우저의 개발자 도구를 열어서 확인해보았다.<br>
<p class="post-image-wrapper">
    <img src="https://github.com/user-attachments/assets/cbd8e2ef-16b1-4bb7-b4bf-724e5cc23d7c" class="image" width="50%" height="50%" onclick="imgClick('https://github.com/user-attachments/assets/cbd8e2ef-16b1-4bb7-b4bf-724e5cc23d7c')">
    <em align="center" class="caption">localStorage 확인</em>
</p><br>

그렇다면 이런식으로 데이터를 전부 저장하면 DB는 필요 없는 것이 아닌가?<br>
아니다.<br>
용량 제한이 있다.<br>
제한되는 용량은 브라우저마다 다르다고 하는데 일반적으로 5 ~ 10 MB라고 한다.<br>
<br>
역시 이렇게 간단하고 좋게 이용할 수 있는데 다들 추가적인 DB를 사용하는 이유가 있는 법이다.<br>
더군다나 딱 보면 알겠지만, 보안에도 매우 취약할 것 같지 않은가?<br>
보안에 대해서는 잘 모르지만 그렇다고 한다.<br>
<br>
더군다나 문자열 객체만을 저장할 수 있다.<br>
<br>
그렇다면 어떻게 사용하는 것 일까?<br>

```js
localStorage.setItem('data', '123');
console.log(localStorage.getItem('data'));      // 123

localStorage.setItem('data', '22');
console.log(localStorage.getItem('data'));      // 22

localStorage.removeItem('data');        // localStorage 개별 삭제
console.log(localStorage.getItem('data'));      // null
localStorage.clear()        // localStorage 전체 삭제
```
위와 같이 사용하면 된다.<br>
꽤 직관적으로 이용할 수 있다.<br>
<br>
그렇다면 이 데이터들이 물리적으로 어디에 저장되는 것일까?<br>
직접 localStorage에 대해서 찾아본다면 '브라우저에 저장한다'는 표현이 많이 나올 것이다.<br>
<br>
하지만 브라우저에 저장한다는게 어떤 느낌인지 잘 안 와닿는다.<br>
실제로 컴퓨터에 값을 저장하고 있는다.<br>
브라우저마다 그 주소는 다르지만, 크롬의 경우 아래와 같다.<br>
- Windows: C:\Users\[Username]\AppData\Local\Google\Chrome\User Data\Default\Local Storage
- macOS: ~/Library/Application Support/Google/Chrome/Default/Local Storage

정말 물리적인 내 컴퓨터의 저장공간에 저장하고 있는다.<br>
그렇기 때문에 사용할 필요가 없어진 localStorage 값들은 지워주는게 좋을 것 같다.<br>
<br>

## 2) sessionStorage

localStorage와 유사하게 sessionStorage라는 것이 있다.<br>
이 둘이 동작하는 방식은 똑같다고 보면 된다.<br>
하지만 범위에 있어서 차이가 있다.<br>
<br>
localStorage는 브라우저를 닫아도, 탭을 옮겨도 유지가 되지만,<br>
sessionStorage는 한 세션(session)동안만 유지된다. 즉, 브라우저를 닫으면 값은 사라진다.<br>
이를 정확히 이해하기 위해서는 세션의 의미를 아는 것이 좋을 것 같지만 오늘은 둘의 차이만 좀 비교해보겠다.<br>
<br>
앞서 언뜻 말했지만 localStorage는 브라우저만 같다면 서로 다른 페이지, 탭끼리 값이 유지된다.<br>
두 개의 페이지를 만들어서 확인해보면 좋다.<br>
하지만 sessionStorage의 경우 페이지 간 데이터 공유가 되지 않는다.<br>
확인해본 결과 같은 탭에서 주소만 바꿔서 다른 페이지를 열면 sessionStorage의 값까지 유지되는 것 같지만(새로고침 역시 마찬가지),<br>
페이지를 닫는 순간 사라진다.<br>
탭을 닫지 않는 한 세션은 유지되는 것 같다.<br>
<br>
sessionStorage를 사용하는 방법 역시 localStorage와 같다.<br>

```js
sessionStorage.setItem('data', '123');
console.log(sessionStorage.getItem('data'));      // 123

sessionStorage.setItem('data', '22');
console.log(sessionStorage.getItem('data'));      // 22

sessionStorage.removeItem('data');        // sessionStorage 개별 삭제
console.log(sessionStorage.getItem('data'));      // null
sessionStorage.clear();     // sessionStorage 전체 삭제
```

위와 같이 사용하면 된다.<br>
다만, 크롬 기준으로 localStorage와 저장 경로는 같은 것 같다.<br>
<br>

---

# 2. localStorage와 sessionStorage의 단점

어떻게 사용하는지는 알았으니 필요할 경우 사용만 하면 된다.<br>
하지만 사용하기에 앞서서 어떤 단점이 있는지 알아야 적절히 사용할 수 있을 것이다.<br>
<br>
찾아본 결과 여러가지 나로써는 아직 이해하기 힘든 고급 개념들이 난무하지만,<br>
내가 이해한 몇 가지 단점은 아래와 같다.
<br>
- 문자열 객체만 사용 가능
- 느림
- 크기 제한
- 보안 관련 이슈

문자열 객체만 사용 가능하다는 것은 단점이기는 하지만, 사용에 있어서 큰 무리는 없을 것 같다.<br>
하지만 크기 제한이 있다는 점, 보안 측면에서 좋지 못하다는 점이 치명적이다.<br>
<br>
사실 더 많은 단점들이 있지만, 위에 사항들만 보더라도 정말 한정적으로 사용해야겠다는 느낌이 온다.<br>
나 같은 경우는 현재 다크모드 on/off 여부만을 저장하기 위해서 사용하고 있는데,<br>
현재 이 블로그에서 이 외에 다른 쓰임새는 크게 생각나지 않는다.<br>
<br>
특히나 사용자의 컴퓨터 내 경로에 저장하는 만큼 작은 용량이지만 최대한 조금만 쓰는 것이 좋을 것 같다.<br>
<br>
