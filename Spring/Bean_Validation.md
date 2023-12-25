# Bean Validation 사용하기

* 어노테이션 형태로 제약 조건을 달아줘서 쉽게 검증할 수 있도록 돕는 API이다.
* Bean Validation은 인터페이스로 된 명세일 뿐이고 실제 동작할 수 있도록 구현한 것이 Hibernate Validator이다.

## @NotNull @NotEmpty @NotBlank

* 단순하게 Null이 아니고, 비어있지 않고, 공백이 아니다라고는 알고있다.
* 그렇다면 Spring의 경우 null도 안되고, 비어있지도 않고, 공백도 아니여야 한다면 세가지 어노테이션을 다 달아줘야 할까?

### @NotNull

* 제한된 CharSequence, Collection, Map, Array는 null만 아니라면 유효하지만, 비어있을 수는 있다.

### @NotEmpty

* 제한된 CharSequence, Collection, Map, Array는 null이 아니고 size 또는 length가 0보다 커야한다.

### @NotBlank

* String은 null이 아니고 trimmed length가 0보다 커야한다.

## 정리

* @NotEmpty 와 @NotBlank의 경우는 검증 메서드 내에서 @NotNull의 isValid() 메서드를 먼저 사용하기 때문에 null값도 통과할 수 없다.

* @NotBlank의 경우는 위의 내 코드처럼 String 의 경우에만 해당한다.


