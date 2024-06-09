# 01. Variable
> 변수

```java
package variable;

/**
 * 패키지는 자바 파일을 구분하기 위한 폴더이다.
 * variable 라는 패키지를 만들면, 해당 패키지에 들어가는 자바 파일 첫줄에 package.variable; 와 같이 소속된 패키지를 선언해준다.
 * 자바 파일이 위치하는 패키지와 package variable 선언 위치가 같아야 한다.
 */
public class Var1 {

    public static void main(String[] args){
        System.out.println(10);
        System.out.println(10);
        System.out.println(10);
    }
}

```

```java
package variable;

public class Var2 {

    /**
     * String[] args : arguments의 약자로 파라미터라는 의미인데,
     * main 메소드는 static으로 선언된 정적 메소드 이다.
     *
     * 클래스의 메소드 사용법은 두가지로 나뉜다.
     *
     * 1. 객체 생성 후 메소드 사용
     * 가장 기본적인 방법으로 stack 영역에서 new 연산자를 통해 메소드 영역의 클래스 정보를 토대로 heap 영역에 객체 생성을 명령한다.
     * 그 후, 객체 메소드를 불러와 main 스레드에서 사용한다.
     *
     * 2. 객체 생성 없이 메소드 사용
     * 객체 생성 없이 메소드를 사용하려면 메소드 앞에 static이 붙어 있어야 한다. 그러면 객체 생성 없이 바로 메소드 영역에 할당된 메소드를 사용할 수 있다.
     *
     * main() 가 static 메소드인 이유는
     * Stack 영역에 스레드가 있어야 'new 연산자' 를 통해 객체 생성이 가능하지만 Stack 영역에 가장 먼저 적재되는 스레드는
     * main 메소드이다. 그러므로 main 메소드의 객체 생성이 불가능 하기에 main 메소드는 static으로 설정된다
     * 하지만 main 메소드는 첫 스레드이기에 main이 시작되기전에 데이터를 입력받는 스레드가 있어야한다.
     * 하지만 Stack 영역에 처음 적재되어 있는 스레드는 main 이다. JDK가 JVM에 클래스 파일을 처리하기전에는 데이터를 사용자로부터 입력받아야한다.
     * 어떻게 되는걸까?
     */


    public static void main(String[] args){
        int a; // 변수 선언
        a = 10; // 변수 초기화
        System.out.println(a);
        System.out.println(a);
        System.out.println(a);

    }
}

```

```java
package variable;

public class Var3 {

    public static void main(String[] args){

        int a; // 변수 선언
        a = 10;

        System.out.println(a);

        a = 50;
        System.out.println(a);

    }


}

```

```java
package variable;


/**
 * 변수 선언
 */
public class Var4 {
    /**
     * 변수르 선언하면 컴퓨터의 메모리 공간을 확보해서 그곳에 데이터를 저장할 수 있다.
     * 변수의 이름을 통해서 해당 메모리 공간에 접근할 수 있다.
     *
     */

    public static void main(String[] args){

        int a;
        int b;
        int c,d;

    }

}

```

```java
package variable;

/**
 * 변수 초기화
 */
public class Var5 {
    /**
     * 선언한 변수에 처음으로 값을 저장하는 것을 변수 초기화라고 한다.
     *
     */
    public static void main(String[] args){
        int a;
        a = 1;
        System.out.println(a);

        int b  =2;
        System.out.println(b);

        int c=3, d=4;
        System.out.println(c);
        System.out.println(d);

    }


}

```

```java
package variable;


public class Var6 {

    /**
     * 만약 변수를 초기화 하지 않고 사용하면 어떻게 될까?
     */

    public static void main(String[] args){
        int a;
//        System.out.println(a); // 컴파일 에러 발생
    }

    /**
     * 왜 이런 오류가 발생할까?
     * 컴퓨터에서 메모리는 여러 시스템이 함께 사용하는 공간이다. 어떠한 값들이 계속 저장된다.
     * 변수를 선언하면 메모리상의 어떤 공간을 차지하고 사용한다. 그 공간에 기존에 어떤 값이 있었는지는 아무도 모른다
     * 따라서 초기화를 하지 않으면 이상한 값이 출력될 수 있다. 이런 문제를 예방하기위해서 강제한다.
     *
     * 참고 : 현재 학습하는 변수는 지역 변수 (Local Variable) 이것은 개발자가 직접 초기화를 해주어야 한다.
     *
     * 클래스 변수와 인스턴스 변수는 자바가 자동으로 초기화를 진행해준다.
     *
     */
}

```

```java
package variable;

/**
 * 변수 타입 1
 */
public class Var7 {
    /**
     *
     *
     *
     */
    public static void main(String[] args){
        int a = 100; // 정수
        double b = 10.5; // 실수
        boolean c = true; // 불리안(Boolean) true , false 입력 가능
//        char d = "A"; // 문자 하나
        String e = "Hello Java"; // 문자열, 문자열을 다루기 위한 특별한 타입

//        System.out.println(a);
//        System.out.println(b);
//        System.out.println(c);
//        System.out.println(d);
//        System.out.println(e);

    }
}

```

```java
package variable;

/**
 * 변수 타입2
 */
public class Var8 {
    /**
     * 메모리를 적게 사용하면 작은 숫자를 표현할 수 있고, 메모리를 많이 사용하면 큰 숫자를 표현할 수 있다.
     *
     */

    public static void main(String[] args){
        // 정수
        byte b = 127; // -128 ~ 127
        short s = 32767; // -32,768 ~ 32,767
        int i = 2147483647; // -2,147,483,648 ~ 2, 147,483,647 ( 약 20억)

        // -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807
        long l = 9223372036854775807L;


        // 실수
        float f = 10.0f;
        double d = 10.0;

    }
    /**
     * 변수 타입 정리
     * 다음 타입은 실무에서 거의 사용하지 않는다.
     *  - byte : 표현 길기아 너무 작다. 자바는 기본으로 4byte(int)를 효율적으로 계산하도록 설계되어 있다. int를 사용하자.
     *      byte 타입을 직접 선언하고 여기에 숫자 값을 대입해서 계산하는 일은 거의 없다.
     *      대신에 파일을 바이트 단위로 다우기 떄문에 파일 전송, 파일 복사 등에 주로 사용된다.
     *  - short : 표현 길이가 너무 작다. 자바는 기본으로 4byte(int)를 효율적으로 계산하도록 설계되어 있다. int를 사용하자.
     *  - float : 표현 길이와 정밀도가 낮다. 실수형은 double를 사용하자.
     *  - char : 문자 하나를 표현하는 일은 거의 없다. 문자 하나를 표현할 때도 문자열을 사용할 수 있다.
     *   ex ) String a = "b" 와 같이 사용하면 된다.
     *
     * 참고 : 메모리 용량은 매우 저렴하다. 메모리 용량을 약간 절약하기 보다는 개발 속도나 효율에 초점을 맞추자
     */

    /**
     * 자주 사용하는 타입
     *
     * 정수 int, long : 기본으로 int를 사용한다. 20억이 넘을 것 같으면 long을 쓰면 된다.
     *   파일을 다룰때는 byte를 사용한다.
     * 실수 double : 실수는 고민하지 말고 double 쓰면 된다.
     * 불린형 boolean : true , false 참 거짓을 표현한다. 이후 조건문에서 자주 사용된다.
     * 문자열 String : 문자를 다룰때는 문자 하나든 문자열이든 모두 String 을 사용하는 것이 편리하다.
     */

    /**
     * 변수 명명 규칙
     *
     * 규칙
     * - 변수 이름은 숫자로 시작할 수 없다 ex) 1num , 1st
     *      숫자를 이름에 포함하는 것은 가능하다 ex) myVar1 , num1
     * - 이름에는 공백이 들어갈 수 없다
     * - 자바의 예약어는 변수 이름으로 상요할 수 없다 ex) int , class , public
     * - 변수 이름에는 영문자 (a-z , A-Z) , 숫자(0-9), 달러 기호($) , 밑줄 (_)만 사용할 수 있다
     *
     * 관례
     * - 소문자로 시작하는 낙타 표기법
     *      변수 이름은 소문자로 시작하는 것이 일반적이고, 여러 단어로 이루어진 변수 이름의 경우 첫번째 단어는 소문자로 시작하고
     *      그 이후는 각 단어가 대문자로 시작하는 낙타 표기법(camel case)를 사용한다 ex) orderDetail , myAccount
     *
     *      - 낙타표기법을 사용하면 이름에 공백을 넣지않고도 여러 단어를 쉽게 구분할 수 있어서 , 변수 이름을 이해하기 쉽게 만들어 준다.
     *
     *
     * 클래스는 대문자로 시작, 나머지는 소문자로 시작
     *      - 클래스 이름의 첫 글자는 대문자로 시작한다. 나머지는 모두 첫 글자를 소문자로 시작한다.
     *      ex) 클래스 : Person , OrderDetail
     *          변수를 포함한 나머지 : firstName , userAccount
     *  예외는 딱 2개 있다
     *    상수는 모두 대문자를 사용하고 언더바로 구분한다
     *    ex) USER_LIMIT
     *  패키지는 모두 소문자를 사용한다
     *    ex) org.spring.boot
     *
     *  변수 이름은 의미있고, 그 용도를 명확하게 설명해야 한다
     *    a, b: 이런 변수는 용도를 설명하지 않는다. 단순한 예제에서만 사용하는 것이 좋다
     *    studentCount , maxScore , userAccount , orderCount : 용도를 명확하게 설명한다
     */
}

```
