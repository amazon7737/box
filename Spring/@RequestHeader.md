# @RequestHeader
> 주석을 사용하여 요청 헤더를 컨트롤러의 메서드 인수에 바인딩 할 수 있습니다.

```java

public void handle(@RequestHeader("Accept-Encoding") String encoding, @RequestHeader("Keep-Alive") long keepAlive){
  //...
}


```

Accept-Encoding 헤더의 값을 가져옵니다.
Keep-Alive 헤더의 값을 가져옵니다.

## Token 인증 통신
> 생성한 토큰으로 통신을 할 경우 Header("Authorization") 자리를 활용하여 토큰 통신을 하였습니다.



```
POST /echo/post/json HTTP/1.1
Host: reqbin.com
Accept: application/json
Authorization: Bearer {token}
Content-Type: application/json
Content-Length: 61

{
	"employee":{ "name":"Emma", "age":28, "city":"Boston" }
} 

```

위와 같이 실제 Ahthorization 의 "Bearer" 문자열과 Token 데이터를 합쳐서 인식합니다.



```java
public Api postDetail(@RequestParam(value = "id") String id , @RequestHeader("Authorization") String token){
  //...
}


```

위와 같이 Header 자리에 Authorization 위치에 있는 Value 데이터를 받아올 수 있습니다.

