# 06. Scope(스코프) , type(형변환)

```java

/**
 * 스코프1 - 지역 번수와 스코프
 *
 * 변수는 선언한 위치에 따라 지역 변수, 멤버 변수(클래스 변수, 인스턴스 변수)와 같이 분류된다.
 * 우리가 지금까지 학습한 변수들은 모두 영어로 로컬 변수(Local Variable) 한글로 지역 변수라 한다. 나머지 변수들은 뒤에서 학습한다. 지금은 지역 변수만 기억하자.
 *
 * 지역 변수는 이름 그대로 특정 지역에서만 사용할 수 있는 변수라는 뜻이다. 그 특정 지역을 벗어나면 사용할 수 없다.
 * 여기서 말하는 지역이 바로 변수가 선언된 코드 블록({})이다. 지역 번수는 자신이 선언된 코드 블록({}) 안에서만 생존하고, 자신이 선언된 코드 블록을 벗어나면 제거된다. 따라서 이후에는 접근할 수 없다.
 */
public class Scope1 {
    public static void main(String[] args){
        int m = 10;
        if (true){
            int x = 20;
            System.out.println("if m = " + m); // 블록 내부에서 블록 외부는 접근 가능
            System.out.println("if x = " + x);

        } // x 생존 종료
//        System.out.println("main x = " + x) // 오류 , 변수 x에 접근 불가
        System.out.println("main m = " + m);

        // m 생존 종료
    }
}

```


```java
/**
 * for문으로 바뀐것만 제외하면 Scope1 예제와 비슷한 예제 이다.
 *
 */
public class Scope2 {
    public static void main(String[] args){
        int m = 10;
        for (int i = 0; i < 2; i++){ // 블록 내부, for문 내
            System.out.println("for m = " + m); // 블록 내부에서 외부는 접근 가능
            System.out.println("for i = " + i);
        } // i 생존 종료

//        System.out.println("main i = " + i); // 오류, i에 접근 불가
        System.out.println("main m = " + m);
    }
}

```

```java
/**
 * 왜 복잡하게 접근 범위 (스코프) 라는 개념을 만들었을까?
 *
 */
public class Scope3_1 {
    public static void main(String[] args){
        int m = 10;
        int temp = 0;
        if (m > 0){
            temp = m * 2;
            System.out.println("temp = " + temp);
        }
        System.out.println("m = " + m);
    }
}

/**
 * 조건이 맞으면 변수 m의 값을 2배 증가해서 출력하는 코드
 * 여기서 2배 증가한 값을 저장해두기 위해 임시 변수 temp를 사용했다. 그런데 이 코드는 좋은 코드라고 보기는 어렵다. 왜냐하면 임시 변수 temp는 if 조건이 만족할 때 임시로 잠깐 사용하는 변수이다. 그런데 임시 변수 temp main() 코드 블록에 선언되어 있다. 이렇게 되면
 * 다음과 같은 문제가 발생한다.
 *
 * - 비효율적인 메모리 사용 : temp 는 if 코드 블록에서만 필요하지만, main() 코드 블록이 종료될때 까지 메모리에 유지된다. 따라서 불필요한 메모리가 낭비된다.
 * 만약 if 코드 블록 안에 temp 를 선언했다면 자바를 구현하는 곳에서 if 코드 블록의 종료 시점에 이 변수를 메모리에서 제거해서 더 효율적으로 메모리를 사용할 수 있다.
 *
 * - 코드 복잡성 증가 : 좋은 코드는 군더더기 없는 단순한 코드이다. temp는 if코드 블록에서만 필요하고, 여기서만 사용하면 된다. 만약 if 코드 블록 안에 temp를 선언했다면 if가 끝나고 나면 temp를 전혀 생각하지 않아도 된다.
 * 머리속에서 생각할 변수를 하나 줄일 수 있다. 그런데 지금 작성한 코드는 if 코드 블록이 끝나도 main() 어디서나 temp를 여전히 접근할 수 있다. 누군가 이 코드를 유지보수 할 때 m은 물론이고 temp까지 계속 신경써야 한다.
 * 스코프가 불필요하게 넓은 것이다. 지금은 코드가 매우 단순해서 이해하는데 어려움이 없겠지만 실무에서는 코드가 매우 복잡한 경우가 많다.
 *
 */
```

```java
/**
 * temp 를 if 코드 블록 안에서 선언했다. 이제 temp는 if 코드 블록 안으로 스코프가 줄어든다. 덕분에 temp 메모리를 빨리 제거해서 메모리를 효율적으로 사용하고, temp 변수를
 * 생각해야 하는 범위를 줄여서 더 유지보수하기 좋은 코드를 만들었다.
 */
public class Scope3_2 {
    public static void main(String[] args){
        int m = 10;
        if (m > 0){
            int temp = m * 2;
            System.out.println("temp = " + temp);
        }
        System.out.println("m = " + m);
    }
}
```

```java
public class While2_3 {
    public static void main(String[] args){
        int sum = 0;
        int i = 1;
        int endNum = 3;

        while (i <= endNum){
            sum = sum + i;
            System.out.println("i=" + i + " sum = " + sum);
            i++;
        }
        // ... 아래에 더 많은 코드들이 있다고 가정
    }
}
```

```java
public class For2 {
    public static void main(String[] args){
        int sum = 0;
        int endNum = 3;

        for (int i = 1; i <= endNum; i++){
            sum = sum + i;
            System.out.println("i=" + i + " sum= " + sum);
        }
        // ... 아래에 더 많은 코드들이 있다고 가정
    }
}
/**
 * 변수는 꼭 필요한 범위로 한정해서 사용하는 것이 좋다. 변수의 스코프는 꼭 필요한 곳으로 한정해서 사용하자. 메모리를 효율적으로 사용하고 더 유지보수하기 좋은 코드를 만들 수 있다.
 * 좋은 프로그램은 무한한 자유가 있는 프로그램이 아니라 적절한 제약이 있는 프로그램
 */
```

```java
/**
 * 형변환
 * - 작은 범위에서 큰 범위로는 당연히 값을 넣을 수 있다.
 *      - 예) int -> long -> double
 * - 큰 범위에서 작은 범위는 다음과 같은 문제가 발생할 수 있다.
 *      - 소수점 버림
 *      - 오버플로우
 * 작은 범위에서 큰 범위로 대입은 허용한다.
 * 특별한 문제없이 잘 수행된다.
 */
public class Casting1 {
    public static void main(String[] args){
        int intValue = 10;
        long longValue;
        double doubleValue;

        longValue = intValue; // int -> long
        System.out.println("longValue = " + longValue);

        doubleValue = intValue;
        System.out.println("doubleValue1 = " + doubleValue); // doubleValue1 = 10.0

        doubleValue = 20L; // long -> double
        System.out.println("doubleValue2 = " + doubleValue); // doubleValue2 = 20.0
    }
}
```

```java

/**
 * 다음 코드의 앞 부분에 있는 주석을 풀면(주석을 제거하면) 컴파일 오류가 발생한다.
 */
public class Casting2 {
    public static void main(String[] args){
        double doubleValue = 1.5;
        int intValue = 0;
//         intValue = doubleValue; // 컴파일 오류 발생
        intValue = (int) doubleValue; // 형변환
        System.out.println(intValue); // 출력 : 1
    }
}
/**
 * int형은 double형보다 숫자의 표현 범위가 작다. 실수를 표현할 수도 없어서 오히려 숫자가 손실되는 문제가 발생할 수 있다.
 * 큰 컵에 담긴 물을 작은 컵에 옮겨 담으려고 하니, 손실이 발생할 수 있다는 것이다.
 *
 * 이런 문제는 매우 큰 버그를 유발할 수 있다. 예를 들어 은행 프로그램이 고객에게 은행 이자를 계산해서 입금해야 하는데
 * 만약 이런 코드가 아무런 오류없이 수행된다면 끔찍한 문제를 만들 수 있다.
 * 그래서 자바는 이런 경우 컴파일 오류를 발생시킨다. 컴파일 오류는 가장 빨리 발견할 수 있는 좋은 오류이다.
 */
```

```java
public class Casting3 {
    public static void main(String[] args){
        long maxIntValue = 2147483647; // int 최고값
        long maxIntOver = 2147483648L; // int 최고값 + 1 (초과)
        int intValue = 0;

        intValue = (int) maxIntValue; // 형변환
        System.out.println("maxIntValue casting = " + intValue); // 출력 : 2147483647

        intValue = (int) maxIntOver; // 형변환
        System.out.println("maxIntOver casting = " + intValue); // 출력 : -214783648

    }
}
```

```java
public class Casting4 {
    public static void main(String[] args){
        int div1 = 3 / 2;
        System.out.println("div1 = " + div1); // 1

        double div2 = 3 / 2;
        System.out.println("div2 = " + div2); // 1.0

        double div3 = 3.0 / 2;
        System.out.println("div3 = " + div3); // 1.5

        double div4 = (double) 3 / 2;
        System.out.println("div4 = " + div4); // 1.5

        int a = 3;
        int b = 2;
        double result = (double) a / b;
        System.out.println("result = " + result); // 1.5

    }
}

```




