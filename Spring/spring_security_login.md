# Spring Security 기본 로그인 화면 제거하는 간단한 방법
> spring을 실행시켜 localhost:8080으로 접속 시 만들지도 않은 아래와 같은 로그인 화면이 나와서 당황스러웠습니다.

```gradle
    implementation('org.springframework.boot:spring-boot-starter-oauth2-client') // 스프링 시큐리티 의존성

```

기본 로그인 페이지를 없애려면 어플리케이션이 실행되는 Main.java 클래스 파일에 다음과 같이 
@SpringBootApplication 어노테이션에 (exclude = SecurityAutoConfiguration.class) 옵션을 주면 로그인 페이지가 나오지 않도록 할 수 있습니다.



