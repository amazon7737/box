# 실무특강
> 학교에서 진행된 2학년 2학기 방학 특강

# nodejs

## 1 Web Server

### Web Server vs WAS(Web Application Server)의 차이?


#### Web Server 가 하는 일은 뭘까?
정적데이터를 처리함

ex) 카페 -> 휴지 , 물,, 우리 주문에 따라서 바뀌지 않는 것들
메뉴들 -> 이런것들은 동적인 데이터 같은 것들

* Container 로 동적인 것들을 제어해 준다.
-> apache , tomcat 이 알아서 구동을 해줌 

layer(계층): 기능구현, 문제해결에 도움 (요구사항)
ex) 요청이 0.1 초 이런것들이 얼마나 들어올지 / 이 서버가 얼마만큼의 부하를 받을 껀지 -> 이것들은 다 비용에 직결된다 ( 돈)
ex) 80만초를 아껴서 직원을 더고용..


* container는 정적인 데이터를 왜 수행하지 않는가?
쿼리 날리기 바쁠껀데 정적인 데이터 수행까지하면 병목발생
왠만한 아키텍처는 저 형태일꺼다 ->  확장이 된것뿐

* VOC

* node js 
304: static 파일 -> 정적인 파일이니까 Web Server 에서 역할을 하고잇음

* MSA : 기능별로 팀을 나눠서 진행 회원팀, 상품개발팀, 주문팀 이 한팀씩 묶기 게이트웨이로 묶어줌(물리적 분리)

더 깊게 안들어가도됨 딱 이까지.. 더 깊게가면 devops 쪽임

* 왜 굳이 팀을 나눠서 진행할까? ( MSA)
사용률이 굉장히 높은 경우 -> 분리하는게 좋다

업데이트가 나갔는데 -> 뭘 추가했는데 -> 오류가 남 -> 그러면 다른 서비스들까지 영향을 미침

상품개발이 죽어도 -> 결제 페이지는 유지한다던가 -> 운영이 편해짐

* MSA 의 단점은 뭐가있을까?


* 하이브리드 하게 (네이버)

ex) 카카오톡 같은경우는 보내는거 받는거 전부 분리되어 있음.

* REST API를 쓸수 있으면 써보기

너무 관리해야할 곳이 많아진다
서버 하나로만 돌리면 -> 한번 껏다 키는데 몇시간이 걸림..

2시간 ~ 정도를 배포하는데만 씀

각 부서들이 개발 테스트

VOC 올리기

* 칸반보드 ( Jira Software)
표를 만들어서 작업중인 단계별로 어떻게 진행되고 있는지 정리하고 있는 것.
작업중인걸 알림이 가서 개발자가 작업중인지 확인하면서 안겹치게함

* 실습을 하면서 MSA 로 구현

WAS 하나가 -> MSA 

리액트 네이티브 -> Microsoft office 365 구현되었다 이번에 
리액트 공부하고 싶으면 받아서 공부하면 좋음

배민 -> 관리시스템만 60개가 넘음 전부 세부적으로 시스템을 관리하고있음

* WAS -> 구동되면 돌아가는게 WAS

한번 패턴을 자동화

* API 를 날리는 미들웨어 처리 

API 요청을 하나하나 모듈로 관리를 함
그렇게 되면 생산성 올라감

## 2 HTTP

하이퍼텍스트를 주고받는 약속

#### FTP 

파일을 주고받는거

* 중요한건 규약이지 형태가 아니다

* HTTP 는 어떤식으로 주고 받아 지는지

* 요청과 응답이 같이 있을때 HTTP의 하나라고한다

요청만 있다? 응답만 있다? 말이 안되는거다

철저하게 요청 있어야 응답이 있다

* 요청과 응답에는 어떤 규칙이 있을까?

요청
정확히 뭘 할지 말해줘야함
CRUD
요청할 때 보내야하는 필수 값 

#### 구분 할 줄 알아야함 

** SaaS : 서비스를 제공

** Paas : 플랫폼을 제공

** IaaS : 인프라를 제공

##### Method - 요청

GET : 요청하는거 , 데이터의 전달 : 이름과 값을 쌍으로  ex) name1 = value1&name2=value2)
데이터가 URL에 노출 - 글자수 제한 (255자) , 인코딩/디코딩의 과정이 없기 때문에 POST 보다 빠르다

POST :  폼에서 POST 지정하는 경우 , 데이터는 HTTP Body 에 숨겨서 서버로 전송 , GET으로 보낼수 없는 자료를 전송할 때 사용가능

PUT :  URL로 지정한 서버에 있는 파일을 대치, URL로 지정한 파일이 없는 경우 파일 새로 작성

DELETE : URL로 지정한 서버에 있는 파일 삭제, 보안적으로 위험, 비활성화


용도에 맞게 쓰자는 -> 다른 개발자들이 봤을때 약속된 대로 알 수있음

로그를 남김 -> 무조건 앞에 에이전트와 어떤신호 썻는지, api를 다남김

##### Status Code(상태코드) - 요청하고나면  서버에서는 어떻게?

표
http 서버는 응답이 항상 있어야 한다

개발자도구 - network - 새로고침
데이터 안에 status code를 넣어줄꺼냐 , status code 가 담겨서 
response 를 보면 데이터가 담겨서 온다

data , status , message 라는 정해진 틀로 온다

구분을 할줄 알아야 한다.

네트워크 규칙을 자신의 스타일을 정하면 일관성을 유지하는게 중요하다

200 : 정상

304 : 오류가 나고 있는데 페이지가 잘 나오고있다 -> 캐시

400번대 요청한사람이 실수한거임 (프론트엔드가 실수 했는지 , 사용자가 실수했는지)
만약 사용자가 실수했으면 예외처리를 잘 해놔야한다
인증관련된거 할때는 400, 403 많이씀

요청한게 없을때 404

500번대 명백한 서버의 문제

데이터가 나와야되는데 안나옴 300번대가 되어있다 -> 그러면 캐시를 비워야겠다
코드만 보고도 바로바로 추론이 가능해야함
1차적으로는 -> 그리고 로그도 찍어보면서 확인

## 3 REST API

네이밍 기법

주소를 분류해놓겟다..

주소창에 뒤에 구조를 설계하는 방법

restAPI에서는 주소창에 그 문자들을 자원이라고 표현한다.

ex) www.naver.com/커피/아메리카노

커피 : 1차리소스

www.naver.com/커피/라떼?아이스=true&얼음=많이

메뉴가 바뀌지 않지만 옵션을 주는것 -> ?로 준다

* jsonplaceholder -> 여기서 실습 가능

fake 데이터를 제공해주는 곳

주요 리소스들 

#### REST API 특성

* 유니폼 인터페이스(Uniform Interface) : 일관성 있어야한다
* 무상태성(Stateless) : 접속을 하든 말든 관심이 없다, 신경쓸 필요가 없다..
* 캐싱(Stateless) : 자주 주문하는 것들을 미리 준비해 놓는거
	자주 사용하면 캐싱을 시켜놓는다 서버에

캐시를 저장해야 되는 상황인지 아닌지 정도만 알고 있으면 된다.

* 엣지 서버 : 캐시가 저장되는 서버

ex) 구글 : 자주 검색하지 않는 데이터들은 본서버에서 와야되니까 로딩이 좀 느릴것이다

서버에 트래픽이 줄어들면 비용이 줄어든다

** node js 가 무엇이냐?
nodejs : 자바스크립트의 런타임이다

뭐가 뭔지를 구분하고 있는것 -> 이게 당장 필요한 기본기이다.

자바스크립트 개발자 면접 질문
let , var 의 차이점
hoisting 의 여부이다 , 선언을 끌어내는것
함수단위로 다 허용해줌

변수가 최 상단까지 끌어올려진다 -> hoisting의 범위가 함수까지여서

```javascript

function B(){
	if(1===1){
		var a = "david";
	}
}

B() %%"david"%%

console.log(a); %%안뜸%%
```

let 을 쓰면 유효범위 바깥에서는 접근하지 못하도록 -> 중괄호 바깥에서는 접근이 안되게 하자

소수점 까지 내려가면 -일때 반올림을 해주지 않기때문에 false 처리를 해줌
1.1 + 0.9 -> true 나옴

* 언어적인 특성

LTS 버전 : 코드상의 실험적인 코드 없이 안정적인 버전

current : 테스트 상의 버전

* controller 와 service 로직을 분리하는 이유?

controller 는 api 하나를 위해서 존재해야하는 것이기 때문에

재사용성 이라는 가장 큰 용이성

오류를 찾는데 수월하다

controller : json형태로 작성
service : 객체 형태로 작성

데이터가 어디로 흘러가는지 그려보자.
Controller 부터 그림을 그려서 화살표를 그어보자. 화살표가 그려지면 이해하고 있는거다.

구조를 계속 이해해보기.

이 구조를 갖다가 씀 -> 나머지는 프론트엔드만 정제해서 쓰기

여기에 들어가는 시간을 많이 줄이고 백엔드에 역할은 서버 구성, db 구성, 파이프라인 만들어주고 , 방화벽열기 , dms 설정 -> devops 역할을 해주면 되는거다.

이정도 개발은 프론트엔드도 할 수 있어야한다.



## 특강 2 MVC 패턴

* middleware :  controller 중간중간에 처리가 가능한 구조를 미들웨어라고 한다.

자바는 미들웨어를 사용하지 않지만 노드 js는

서비스를 모두 카페로 비유하여서 해석해본다
언제든지 재상요이 가능함.,, 작은 서비스같은 곳에서도 미들웨어가 유용함

* 트랜잭션 : 계좌로 예를 들음 , 계좌를 입력하고 추가할 금액을 바로 출력되면 안되니까 패스워드 확인하고 최종확인 해야 출금이 되는데 , 최종 확인을 누르는 데서 에러가 나면 돈이 출력되지 말고 진행되던 절차들이 날라감

사진을 찾아주겟다하는 ai 에도 미들웨어를 넣으면 좋다 , 숫자 값이 1과 0 같냐 이런 정도에서는 필요 없을 수 있음


로그인 기능을 모듈형태로 만들어두면 객체를 복사해서 두면 설정값에 따라서 알아서 돌아가게됨 그러면 다른 프로젝트에서 재사용이 가능함 . -> for문이나 if문으로 구현을 해버리면 재사용이 불가능함

* JWT : 신분증같은 개념 ( 자바스크립트)

토큰 , 인증키

서버 , 프로그램들도 사람들의 

* 코어스 : 인증을 위해 서버에 전달할때 암호화 하여 보내는것


## * 프론트엔드 구현은 api를 요청하는 법에 대해서 배움

* 로그인 페이지 antDesign 으로 구현

* 로그인 토큰가져오기
 

###  * 복습을 위한 순서

```
npm install express

express view==ejs

npm install nodemon

node -> nodemon으로 변경
```

* API가 무엇인지에 대해서 공부할 것이다.
* jsonplaceholder 를사용하여 fake 데이터를 불러오기 연습

* 웹서버에 대해서 이해하고 , REST API 에 대해서 이해하고 , HTTP 에 대해서 이해하고 , mvc 패턴에 대해서 이해 , 미들웨어, JWT , 토큰 , 코어스 에 대해서 이해

* user.service 만들기
* user.controller -> index.js -> app.js const User 만들기
* users 한번 접속해보기
* jsonwebtoken 깔아서 사용해보기
* JWTManager
* Authenticator


* apiserver 만 복습 완료하고 생긴 궁금한점
* 미들웨어를 사용하는 이유는?



user.service -> user.controller 가 정적인 데이터? 를 받아서

UserService 를 require 해서 받아와가지고 data 변수에 받아서 getUsers 사용해서
response.status 가 200 정상 으로 뜬다면은 success라는 메시지와 함께
데이터를 뿌려라 data: data 로

마찬가지로 데이터를 뿌리는거 말고도
Authenticator , JWTManager 를 이용해서 토큰을 뿌릴수도 있는데
Authenticator 는 미들웨어라는 기능을 만들었는데 이건 중간에서 서버가 제데로 동작하는지 검증하는 곳인것 같다 
401 이면 권한문제라고 알려구조, 500이면 서버에러라고 알려주는 검증된곳이라는거다
토큰이 여길 지나가고나서 Usercontroller 로 가는데 거기서 다시 똑같은 방식으로 뿌리면 된다

JWTManager 에서는 createToken 만 사용하고 잇는데 이걸로 토큰을 생성하고 jwt에 담는다
그 jwt가 controller 에서 재정의하고 뿌려진다
createToken을 controller에서 사용하는데 이때 tokenData라는 임의의 아이디를 controller에서 만들어 넣고 생성한다

createToken에서 토큰을 생성할때는 secret이라는 곳에 문자열들을 만들어놓고 그걸 암호화 시킨다




index.js ( src/api/user 경로를 대표하는 파일)

	

