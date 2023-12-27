# if 조건문

```java
if(userPwd == "12345678!"){
  System.out.println("사용불가");
  result = "1";
}else if (userPwd.equals("1004!!!!"){
  System.out.println("위험");
  result = "2";
}


```

# if 조건문에서 ==가 안될 때, 문자열 비교시 ==와 equals()의 차이점

* ==는 비교를 위한 연산자(operator)이다. <strong>메모리 주소를 비교</strong>한다.

* equals()는 메소드(method)이다. 두 인스턴스의 주소값을 비교하여 <strong>같은 인스턴스인지를 확인</strong>하고 같으면 true, 다르면 false의 boolean값을 리턴한다.

# 리터럴과 객체의 차이
> 리터럴은 변하지 않는 데이터 그 자체(=상수) 이다. 원시타입과 String이 있으며, Heap 메모리 영역 안에 있는 Constant Pool 이라는 메모리 영역에 값을 할당한다.

> new 연산자는 객체를 Heap이라는 메모리 영역에 메모리 공간을 할당해주고 메모리주소를 반환한 후 생성자를 실행시켜준다. 리터럴과는 달리 new 연산자로 생성된 객체는 똑같은 값을 가진 객체가 있어도 서로 다른 메모리를 할당하기 때문에(=주소값이 다르기 때문에) 서로 다른 객체로 분류된다.

> 객체가 아닌 일반적인 String 리터럴은 원시타입과 마찬가지로 같은 값을 호출할 시에 새로운 메모리를 할당하지 않고 String Constant Pool 영역에 이미 할당되어 있는 값을 가르키게 된다.

## Call by value vs Call by reference

* call-by-value (값에 의한 호출) - 복사본 전달
  * 전달되는 변수의 값을 복사하여 함수의 인자로 전달
  * 지역적 사용 ( local -value)
  * 메모리에 있는 원래 변수값은 변경되지 않음

* call-by-reference (참조에 의한 호출) - 본래값 주소 전달
  * 인자로 전달되는 변수의 레퍼런스를 전달
  * 함수 안 인자 값이 변경되면, argument로 전달된 객체 값도 함게 변경됨

