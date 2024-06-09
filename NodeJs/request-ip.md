# nodeJs request-ip 사용법
> ip 주소를 확인하여 처리할때 사용하였다.

```
npm install request-ip
```

request-ip라는 라이브러리를 사용하였다.

### 사용법

```js
let requestIp = require("request-ip");

let ip = requestIp.getClientIp(req);

console.log(ip);
```

로그를 찍어보면 클라이언트의 ip가 노출된다.

localhost로 접속하면 127.0.0.1 혹은 이상한 ::11 와 같이 보이게 된다.


### 유의사항

express 서버에는 IPv6 방식으로 ip가 들어가 있어서 <mark>::11</mark>와 같이 나타나게 된다.

/bin/www 파일을 보자.

```js
app.listen(port, '0.0.0.0')

```
이렇게 처리를 해주면 ipv4로 인식이 된다. 따라서 포트가 제대로 나오기에 그걸로 로직을 처리하면 된다.

