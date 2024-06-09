# 02. Operator
> 연산자

```java

package example.operator;

/**
 * 산술 연산자
 *
 */
public class Operator1 {
    public static void main(String[] args){
        // 변수 초기화
        int a = 5;
        int b = 2;

        // 덧셈
        int sum = a + b;
        System.out.println("a+b = " + sum); // 출력 : a + b = 7

        // 뺄셈
        int diff = a - b;
        System.out.println("a - b = " + diff); // 출력 : a - b = 3

        // 곱셈
        int multi = a * b;
        System.out.println("a*b = " + multi); // 출력 : a * b = 10

        // 나눗셈
        int div = a / b;
        System.out.println("a/b = " + div); // 출력 : a / b = 2

        // 나머지
        int mod = a % b;
        System.out.println("a%b = " + mod); // 출력 : a % b = 1

    }
}

```

```java
package example.operator;

/**
 * 문자열 더하기
 *
 */
public class Operator2 {
    public static void main(String[] args){

        // 문자열과 문자열 더하기1
        String result1 = "hello" + "world";
        System.out.println(result1);

        // 문자열과 문자열 더하기2
        String s1 = "string1";
        String s2 = "string2";
        String result2 = s1 + s2;
        System.out.println(result2);

        // 문자열과 숫자 더하기1
        String result3 = "a + b = " + 10;
        System.out.println(result3);

        // 문자열과 숫자 더하기2
        int num = 20;
        String str = "a + b = ";
        String result4 = str + num;
        System.out.println(result4);


    }
}

```
```java
package example.operator;

public class Operator3 {
    public static void main(String[] args){
        int sum1 = 1 + 2 * 3; // 1 + (2 * 3)과 같다.
        int sum2 = (1 + 2) * 3;
        System.out.println("sum1 = " + sum1); // sum1 = 7
        System.out.println("sum2 = " + sum2); // sum2 = 9
    }
}

```

```java
package example.operator;

public class Operator4 {
    public static void main(String[] args){
        int sum3 = 2 * 2 + 3 * 3;
        int sum4 = (2 * 2) + (3 * 3); // sum3과 같다.
        System.out.println("sum3 = " + sum3); // sum3 = 13
        System.out.println("sum4 = " + sum4); // sum4 = 13
    }
}

```

```java
package example.operator;

/**
증감 연산자
 */
public class OperatorAdd1 {
    public static void main(String[] args){
        int a = 0;
        a = a + 1;
        System.out.println("a = " + a); // 1
        a = a + 1;
        System.out.println("a = " + a); // 2

        // 증감 연산자
        ++a; // a = a+1
        System.out.println("a = " + a); // 3
        ++a; // a = a+1
        System.out.println("a = " + a); // 4
    }
}

```

```java
package example.operator;

public class OperatorAdd2 {
    public static void main(String[] args){
        // 전위 증감 연산자 사용 예
        int a = 1;
        int b = 0;
        b = ++a; // a의 값을 먼저 증가시키고 , 그 결과를 b에 대입
        System.out.println("a = " + a + ", b = " + b); // 결과 : a = 2 , b = 2

        // 후위 증감 연산자 사용 예
        a = 1; // a 값을 다시 1로 지정
        b = 0; // b 값을 다시 0으로 지정
        b = a++; // a의 현재 값을 b에 먼저 대입하고, 그 후 a 값을 증가시킴
        System.out.println("a = " + a + " , b = " + b); // 결과 : a = 2 , b = 1
    }
}

```

```java
package example.operator;

/**
 * 비교 연산자
 */
public class Comp1 {
    public static void main(String[] args){
        int a = 2;
        int b = 3;

        System.out.println(a == b); // false , a와 b는 같지 않다
        System.out.println(a != b); // true , a와 b는 다르다
        System.out.println(a > b); // false, a는 b보다 크지 않다
        System.out.println(a < b); // true, a는 b보다 작다
        System.out.println(a >= b); // false, a는 b보다 크거나 같지 않다
        System.out.println(a <= b); // true, a는 b보다 작거나 같다

        // 결과를 boolean 변수에 담기
        boolean result = a == b; // a == b : false
        System.out.println(result); // false

    }
}


```

```java
package example.operator;

public class Comp2 {
    public static void main(String[] args){
        String str1 = "문자열1";
        String str2 = "문자열2";

        boolean result1 = "hello".equals("hello"); // 리터럴 비교
        boolean result2 = str1.equals("문자열1"); // 문자열 변수 , 리터럴 비교
        boolean result3 = str1.equals(str2); // 문자열 변수 비교

        System.out.println("result1 = " + result1);
        System.out.println("result2 = " + result2);
        System.out.println("result3 = " + result3);
    }
}

```

```java
package example.operator;

/**
 * 논리 연산자
 *
 */
public class Logical1 {
    public static void main(String[] args){
        System.out.println("&&: AND 연산");
        System.out.println(true && true); // true
        System.out.println(true && false); // false
        System.out.println(false && false); // false

        System.out.println("|| : OR 연산");
        System.out.println(true || true); // true
        System.out.println(true || false); // true
        System.out.println(false || false); // false

        System.out.println("! 연산");
        System.out.println(!true); // false
        System.out.println(!false); // true

        System.out.println("변수 활용");
        boolean a = true;
        boolean b = false;
        System.out.println(a && b); // false
        System.out.println(a || b); // true
        System.out.println(!a); // false
        System.out.println(!b); // true

    }

}

```

```java
package example.operator;

/**
 * 논리 연산자 활용
 *
 */
public class Logical2 {
    public static void main(String[] args){
        int a = 15;
        // a는 10보다 크고 20보다 작다
        boolean result = a > 10 && a < 20; // (a > 10) && (a < 20)
        System.out.println("result = " + result);

    }
}

```


```java
package example.operator;

public class Assign1 {
    public static void main(String[] args){
        int a = 5; //5
        a += 3; // 8 (5 + 3) : a = a + 3
        a -= 2; // 6 (8 - 2) : a = a - 2
        a *= 4; // 24 (6 * 4) : a = a * 4
        a /= 3; // 8 (24 / 3) : a = a / 3
        a %= 5; // 3 (8 % 5) : a = a % 5
        System.out.println(a);
    }
}

```
