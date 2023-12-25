# error: cannot find symbol
> 테스트 코드를 작성하면서 발생한 오류입니다. 다른 케이스로 인해서 발생할 수 있으니 테스트 코드 한정에서의 원인과 해결법입니다.
> symbol: method setId(long)
> location: variable _ of type _

* Entity에 대한 메소드 사용중 발생

* @Getter 어노테이션과 연관있는 것 같음 , 하지만 엔티티에는 해당 어노테이션을 사용중인 상태

* 추가 : build.gradle -> annotationProcessor('org.projectlombok:lombok') // 추가

lombok 관련한 에러인것 같다.
