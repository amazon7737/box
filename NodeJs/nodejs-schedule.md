# node-schedule로 스케줄러 구현하기
> 작업을 하다 보면 특정 주기 혹은 특정 시간에 로직이 알아서 작동해야 하는 상황이 오게된다.

### 설치

```
npm install node-schedule
```
### 적용 방법 예제
```js
const schedule = require("node-schedule");

const job = schedule.scheduleJob("*/1 * * * * *", function (){
    console.log("스케줄링 작동!");
})
```

매 1초마다 작동하는 스케줄링이다.

시간 문자열 사용법만 알면 끝이다.

### 시간 문자열 사용법

![img](https://velog.velcdn.com/images/rlatp1409/post/e2d306be-8216-4f2c-848c-8bea2de7d3b1/image.png)

위와 같이 특정 시간을 지정할 수 있고, 에제 처럼 주기를 지정할 수 있다. 상황에 맞게 사용하면 된다.

### 유의사항

가끔 서버시간이 현지 시간으로 조정되어있지 않을 수 있다. 꼭 확인하고 사용하자.
