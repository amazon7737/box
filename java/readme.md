<h1> CH01 자바를 시작하기 전에 </h1>

<hr>

<h1> CH02 변수(Variable) </h1>

<hr>

<h2>01 변수와 상수 </h2>

<hr>

* 변수란 값을 저장할 수 있는 메모리상의 공간
* 변수타입은 변수에 저장될 값이 어떤 '타입(type)'인지를 지정하는 것
* Java는 정수형, 실수형, 문자형등 존재
* 변수 이름은 메모리 공간에 이름을 붙여주는 것
* 번수 초기화는 변수를 선언한 이후부터는 사용할 수 있지만 그전에 반드시 초기화를 해야함
* 메모리는 여러 프로그램이 공유하는 자원이므로 전에 다른 프로그램에 의해 저장된 '알 수 없는 값'이 남아 있을 수 있기 때문
* 값을 저장할때는 대입 연산자 '='를 사용, a = 1 이라고 하면 오른쪽의 값을 왼쪽(변수)에 저장하라는 뜻.

```java
public class Main{
  public static void main(String[] args){
    int year = 0;
    int age = 14;

    System.out.println(year);
    System.out.println(age);

    year = age + 2000; // 변수 age의 값에 2000을 더해 변수 year에 저장
    age = age + 1; // 변수 age에 저장된 값을 1 증가시킨다.

    System.out.println(year);
    System.out.println(age);

// 두 개의 변수 age와 year를 선언한 다음, 값을 저장하고 출력하는 간단한 예제, 변수 year, age를 각각 0과 14로 초기화 하였다.
}

}

```

```java
public class Main{
  public static void main(String[] args){
    int x = 10, y = 20;
    int tmp = 0;

    System.out.println("x:" + x + " y:" + y);

    tmp = x; // x는 10인데 10을 tmp에 넣어준다 => tmp = 10
    x = y; // y값을 x에 넣어준다. x = 20
    y = tmp; // tmp값을 y에 넣어준다. 위에서 tmp=10이므로 y=10

    System.out.println("x:" + x + "y:" + y); // 실행결과 x:10 y:20
                                              // y: 20 x:10
}
}

```
<h3>1.3 변수의 명명규칙</h3>
* "변수의 이름" 처럼 사용하는 모든 이름을 "식별자" 라고 하며, 식별자는 같은 영역 내에서 서로 구분(식별)될 수 있어야 한다.

* 1. 대소문자 구분, 길이 제한 없음.
    - True와 true는 서로 다른 것으로 간주
  2. 예약어를 사용 안됨.
    - true는 예약어라서 사용할 수 없지만, True는 사용 가능하다.
  3. 숫자로 시작 안됨.
    - top 10은 허용 , 10 top은 허용 X
  4. 특수문자는 '-' 와 '$'만을 허용
    - $harp은 허용, S#arp는 허용 X
 
   


<h1>여러 클래스에서의 값 넘기고 받기</h1>

```java
public class a{
  static Long idx;
  static String title;
  static String content;

  public static void main(String args[]){
    fun(idx, title, content);
}

  public static void fun(Long idx, String title, String content){
    System.out.printf("%d", title);

}
}

```
