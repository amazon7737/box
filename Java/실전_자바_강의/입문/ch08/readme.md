# 09. 메서드(Method)

```java
public class Method1 {
    public static void main(String[] args){
        // 계산1
        int a = 1;
        int b = 2;
        System.out.println(a + "+" + b + " 연산 수행");
        int sum1 = a + b;
        System.out.println("결과1 출력: " + sum1);

        // 계산2
        int x = 10;
        int y = 20;
        System.out.println(x + "+" + y + " 연산 수행");

        int sum2 = x + y;
        System.out.println("결과2 출력: " + sum2);

        /**
         * 같은 연산을 두 번 수행한다.
         * 코드를 잘 보면 계산1 부분과, 계산2 부분이 거의 같다.
         */
    }
}
```


```java
/**
 * 메서드 사용
 **/

public class Method1Ref {
    public static void main(String[] args){
        int sum1 = add(5, 10);
        System.out.println("결과1 출력: " + sum1);

        int sum2 = add(15, 20);
        System.out.println("결과2 출력: " + sum2);
    }

    // add 메서드
    public static int add(int a, int b){
        System.out.println(a + "+" + b + " 연산 수행");
        int sum = a + b;
        return sum;
    }
}
```

```java
/**
 * 매개변수가 없거나 반환 타입이 없는 경우
 */
// 매개변수도 없고 타입도 없는 메서드들을 작성해보자.
public class Method2 {
    public static void main(String[] args){
        printHeader();
        System.out.println("프로그램이 동작합니다.");
        printFooter();

    }

    public static void printHeader(){
        System.out.println(" = 프로그램을 시작합니다 = ");
        return;
    }

    public static void printFooter(){
            System.out.println("= 프로그램을 종료합니다 = ");
    }

}
```

```java
public class MethodReturn1 {

    public static void main(String[] args) {
        boolean result = odd(2);
        System.out.println(result);
    }

    public static boolean odd(int i) {
        if (i % 2 == 1) {
            return true;
        }else{
            return false;
        }
    }
}
```

```java
public class MethodReturn2 {

    public static void main(String[] args){
        checkAge(10);
        checkAge(20);

    }

    public static void checkAge(int age){
        if (age < 18){
            System.out.println(age + "살, 미성년자는 출입이 불가능합니다.");
            return;
        }

        System.out.println(age + "살, 입장하세요.");
    }
}

/**
 * 18세 미만의 경우 "미성년자는 출입이 불가능합니다"를 출력 -> 바로 return문 수행 , 다음 로직을 수행안하고 메서드를 빠져나옴
 *
 * 18세 이상의 경우 "입장하세요"를 출력하고, 메서드가 종료된다. 참고로 반환 타입이 없는 void형이기 때문에 마지막 줄의 return은
 * 생략할 수 있다.
 *
 */
```

```java
public class MethodValue0 {
    public static void main(String[] args){
        int num1 = 5;
        int num2 = num1;
        num2 = 10;

        System.out.println("num1= " + num1);
        System.out.println("num2= " + num2);

    }
}

```

```java
public class MethodValue1 {
    public static void main(String[] args){

        int num1 = 5;

        System.out.println("1. changeNumber 호출 전, num1: " + num1);

        changeNumber(num1);

        System.out.println("4. changeNumber 호출 후, num1: " + num1);
    }

    public static void changeNumber(int num2){
        System.out.println("2. changeNumber 변경 전, num2: " + num2);
        num2 = num2 * 2;
        System.out.println("3. changeNumber 변경 후, num2: " + num2);
    }
}
```

```java
public class MethodValue2 {

    public static void main(String[] args){
        int number = 5;

        System.out.println("1. changeNumber 호출 전, number: " + number); // 출력: 5
        changeNumber(number);
        System.out.println("4. chageNumber 호출 후, number: " + number); // 출력 : 5

    }


    public static void changeNumber(int number){
        System.out.println("2. changeNumber 변경 전, number: " + number); // 출력 : 5
        number = number * 2;
        System.out.println("3. changeNumber 변경 후, number: " + number); // 출력 : 10
    }
}
```

```java
public class MethodValue3 {
    public static void main(String[] args){
        int num1 = 5;
        System.out.println("changeNumber 호출 전, num1: " + num1);
        num1 = changeNumber(num1);
        System.out.println("changeNumber 호출 후, num1: " + num1);
    }

    public static int changeNumber(int num2){
        num2 = num2 * 2;
        return num2;
    }
}
```

```java
/**
 * 명시적 형변환
 * 메서드를 호출하는데 인자와 매개변수의 타입이 맞지 않다면 어떻게 해야할까?
 */
public class MethodCasting1 {
    public static void main(String[] args){
        double number = 1.5;
        // printNumber(number); // double을 int형에 대입하므로 컴파일 오류
        printNumber((int) number); // 명시적 형변환을 사용해 double을 int로 변환
    }

    public static void printNumber(int n){

        System.out.println("숫자: " + n);

    }


    /**
     * 컴파일 오류가 발생할 것이다. 명시적 형변환을 사용해야 타입을 맞춰줄수 있을거다.
     */
}
```

```java
/**
 * 자동형변환
 *
 * 메서드를 호출할 때 매개변수에 값을 전다랗는 것도 결국 변수에 값을 대입하는 것이다. 따라서 앞서 배운 자동 형변환이 그대로 적용된다.
 */
public class MethodCasting2 {
    public static void main(String[] args){
        int number = 100;
        printNumber(number); // int에서 double로 자동 형변환
    }
    public static void printNumber(double n){
        System.out.println("숫자: " + n);
    }
}
/**
 * double형 매개변수(파라미터)에 int형 인수를 전달하는데 문제없이 잘 동작한다.
 * => 메서드를 호출할 때는 전달하는 인수의 타입과 매개변수의 타입이 맞아야 한다. 타입이 달라도 자동 형변환이 가능한 경우에는 호출할 수 있다.
 */
```

```java
/**
 * 메소드 오버로딩
 * 매개 변수 갯수가 다른 오버로딩 예제
 *
 */
public class Overloading1 {
    public static void main(String[] args){

        System.out.println("1: " + add(1,2));
        System.out.println("2: " + add(1,2,3));
    }

    // 첫 번째 add 메서드 : 두 정수를 받아서 합을 반환한다.
    public static int add(int a , int b){
        System.out.println("1번 호출");
        return a+b;
    }

    // 두 번째 add 메서드 : 세 정수를 받아서 합을 반환한다.
    // 첫 번째 메서드와 이름은 같지만, 매개변수 목록이 다르다.
    public static int add(int a, int b, int c){
        System.out.println("2번 호출");
        return a+b+c;
    }
}
```

```java
/**
 * 메소드 오버로딩
 * 매개변수의 타입이 다른 오버로딩 예제
 *
 */
public class Overloading2 {
    public static void main(String[] args){
        myMethod(1, 1.2);
        myMethod(1.2, 2);
    }

    public static void myMethod(int a, double b){
        System.out.println("int a , double b");
    }

    public static void myMethod(double a, int b){
        System.out.println("double a , int b");
    }
    /**
     * 1: 정수1, 실수1.2 를 호출했으므로 myMethod(int a, double b) 가 호출된다
     * 2: 실수1.2 , 정수 2를 호출했으므로 myMethod(double a , int b)가 호출된다.
     */
}
```

```java
/**
 * 메소드 오버로딩
 * 매개변수의 타입이 다른 경우의 예제 (추가로 확인)
 *
 */
public class Overloading3 {
    public static void main([Scope.md](Scope.md)String[] args){
        System.out.println("1: " + add(1,2));
        System.out.println("2: " + add(1.2 , 1.5));

    }

    // 첫 번째 add 메서드 : 두 정수를 받아서 합을 반환한다.
    public static int add(int a , int b){
        System.out.println("1번 호출");
        return a+b;
    }

    // 두 번째 add 메서드 : 두 실수를 받아서 합을 반환한다.
    // 첫 번째 메서드와 이름은 같지만, 매개변수의 유형이 다르다.
    public static double add(double a , double b){
        System.out.println("2번 호출");
        return a + b;
    }
    /**
     * 1: 정수1, 정수2를 호출했으므로 add(int a , int b)가 호출된다.
     * 2: 실수 1.2 , 실수 1.5를 호출했으므로 add(double a , double b) 가 호출된다.
     */
}
```

* 은행계좌 입출금 프로그램은 꼭 만들어보자.
