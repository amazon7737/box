# 03. If
> 조건문


```java

public class If1 {

    public static void main(String[] args){

        int age = 20;

        if (age >= 18){
            System.out.println("성인입니다.");
        }

        if (age < 18){
            System.out.println("미성년자입니다.");
        }

    }

}

```

```java


public class If2 {

    public static void main(String[] args){
        int age = 20;

        if(age >= 18){
            System.out.println("성인입니다."); // 참일떄 실행
        }else{
            System.out.println("미성년자입니다."); // 만족하는 조건이 없을때 실행
        }
    }



}

```

```java

public class If3 {
    public static void main(String[] args){
        int age = 14;

        if(age <= 7){ // ~7: 미취학
            System.out.println("미취학");
        }
        if(age >= 8 && age <= 13){ // 14 ~ 16 : 중학생
            System.out.println("초등학생");
        }
        if(age >= 14 && age <= 16){ // 17 ~ 19 : 고등학생
            System.out.println("중학생");
        }
        if(age >= 20){ // 20 ~ : 성인
            System.out.println("성인");
        }
    }

}

```

```java


public class If4 {

    public static void main(String[] args){
        int age = 14;

        if(age <= 7){ // ~7 : 미취학
            System.out.println("미취학");
        } else if (age <= 13){ // 8 ~ 13: 초등학생
            System.out.println("초등학생");
        } else if (age <= 16){ // 14 ~ 16 : 중학생
            System.out.println("중학생");
        } else if (age <= 19){ // 17 ~ 19 : 고등학생
            System.out.println("고등학생");
        } else { // 20 ~ : 성인
            System.out.println("성인");
        }
    }
}

```

```java

public class If5 {
    public static void main(String[] args){

        int price = 10000; // 아이템 가격
        int age = 10; // 나이
        int discount = 0;

        if (price >= 10000){
            discount = discount + 1000;
            System.out.println("10000원 이상 구매, 1000원 할인");
        }

        if (age <= 10){
            discount = discount + 1000;
            System.out.println("어린이 1000원 할인");
        }

        System.out.println("총 할인 금액: " + discount + "원");
    }

}

```

```java


public class If6 {

    public  static void main(String[] args){
        int price = 10000; // 아이템 가격
        int age = 10; // 나이
        int discount = 0;

        if (price >= 10000){
            discount = discount + 1000;
            System.out.println("10000원 이상 구매, 1000원 할인");
        }else if (age <= 10){
            discount = discount + 1000;
            System.out.println("어린이 1000원 할인");
        } else {
            System.out.println("할인 없음");
        }

        System.out.println("총 할인 금액" + discount + "원");
    }


}

/**
 * if문 {} 중괄호 생략
 * if문이 하나만 있을 경우에는 {}중괄호를 생략할 수 있다.
 * 일반적으로는 if문의 명령이 한개만 있을 경우에도 중괄호를 사용하는 것이 좋다.
 *
 * 가독성 : 중괄호를 사용하면 코드를 더 읽기 쉽게 만들어 준다. 조건문의 범위가 명확하게 표시되므로 코드의 흐름을 더 쉽게 읽을 수 있다.
 * 유지보수성 : 중괄호를 사용하면 나중에 코드를 수정할 때 오류를 덜 발생시킬 수 있다. 예를 들어, if문에 또 다른 코드를 추가하려고 할때,
 * 중괄호가 없으면 이 코드가 if문의 일부라는 것이 명확하지 않을 수 있다.
 *
 */

```

```java


public class Switch1 {

    public static void main(String[] args){
        // grade 1:1000, 2:2000, 3:3000, 나머지: 500

        int grade = 2;

        int coupon;
        if( grade == 1){
            coupon = 1000;
        } else if (grade == 2){
            coupon = 2000;
        } else if (grade == 3){
            coupon = 3000;
        } else {
            coupon = 500;
        }
        System.out.println("발급받은 쿠폰 " + coupon);

    }
}

```

```java


public class Switch2 {
    public static void main(String[] args){
        // grade 1:1000, 2:2000, 3:3000, 나머지: 500
        int grade = 2;

        int coupon;

        switch (grade){
            case 1:
                coupon = 1000;
                break;
            case 2:
                coupon = 2000;
                break;
            case 3:
                coupon = 3000;
                break;
            default:
                coupon = 500;
        }
        System.out.println("발급 받은 쿠폰 " + coupon);
    }
}

```

```java


public class Switch3 {

    public static void main(String[] args){
        // grade 1:1000, 2:3000(변경), 3:3000, 나머지: 500
        int grade = 2;

        int coupon;

        switch (grade){
            case 1:
                coupon = 1000;
                break;
            case 2:
            case 3:
                coupon = 3000;
                break;
            default:
                coupon = 500;
                break;
        }
        System.out.println("발급받은 쿠폰 " + coupon);
    }
}

```

```java

public class NewSwitch3 {

    public  static void main(String[] args){
        // grade 1:1000, 2:2000, 3:3000, 나머지: 500
        int grade = 2;

        int coupon = switch (grade){
            case 1 -> 1000;
            case 2 -> 2000;
            case 3 -> 3000;
            default -> 500;
        };
        System.out.println("발급받은 쿠폰 " + coupon);
    }
}

```

```java


public class CondOp1 {

    public static void main(String[] args){
        int age = 18;
        String status;
        if (age >= 18){
            status = "성인";
        } else{
            status = "미성년자";
        }
        System.out.println("age = " + age + " status = " + status);
    }
}

```

```java
public class CondOp2 {
    public static void main(String[] args){
        int age = 18;
        String status = (age >= 18) ? "성인" : "미성년자";
        System.out.println("age = " + age + " status = " + status);
    }

}
/**
 * 삼항 연산자
 * (조건) ? 참_표현식 : 거짓_표현식
 *
 */
```

```java


public class problem1 {
    public static void main(String[] args){
        int score = 80;

        if(score >= 90){
            System.out.println("학점은 A입니다.");
        }else if(80 <= score ){
            System.out.println("학점은 B입니다.");
        }else if(70 <= score ){
            System.out.println("학점은 C입니다.");
        }else if (60 <= score ){
            System.out.println("학점은 D입니다.");
        }else {
            System.out.println("학점은 F입니다.");
        }

    }

}

```

```java


public class problem2 {

    public static void main(String[] args){
        int distance = 50;
        if(distance <= 1){
            System.out.println("도보를 이용하세요");
        }else if(distance <= 10){
            System.out.println("자전거를 이용하세요");
        }else if(distance <= 100){
            System.out.println("자동차를 이용하세요");
        }else{
            System.out.println("비행기를 이용하세요");
        }

    }

}

```

```java
import java.rmi.StubNotFoundException;

/**
 * 환율 계산하기
 * 특정 금액을 미국 달러에서 한국 원으로 변환하는 프로그램을 작성하자. 환율은 1달러당 1300원이라고 가정하자. 다음과 같은 기준을 따른다.
 */

public class problem3 {

    public static void main(String[] args){
        int dollar = 20;

        if(dollar < 0){
            System.out.println("잘못된 금액입니다.");
        } else if (dollar == 0) {
            System.out.println("환전할 금액이 없습니다.");
        }else {
            System.out.println("환전 금액은 (계산된 원화 금액)원입니다.");
        }
    }


}

```

```java
/**
 * 평점에 따른 영화 추천하기
 * 요청한 평점 이상의 영화를 찾아서 추천하는 프로그램을 작성하자
 *
 */
public class MoveLateEx {

    public static void main(String[] args){
        double rating = 9;
        if(rating <= 9){
            System.out.println("어바웃타임을 추천합니다.");
        }

        if(rating <= 8){
            System.out.println("토이 스토리를 추천합니다.");
        }

        if (rating <= 7){
            System.out.println("고질라를 추천합니다.");
        }

    }

}

```

```java
/**
 * 학점에 따른 성취도 출력하기
 * String grade라는 문자열을 만들고, 학점에 따라 성취도를 출력하는 프로그램을 작성하자. 각 학점은 다음과 같은 성취도를 나타낸다.
 */
public class GradeSwitchEx {

    public static void main(String[] args){
        String grade = "A";

        switch (grade){
            case "A":
                System.out.println("탁월한 성과입니다!");
            case "B":
                System.out.println("좋은 성과입니다!");
            case "C":
                System.out.println("준수한 성과입니다!");
            case "D":
                System.out.println("향상이 필요합니다.");
            case "F":
                System.out.println("불합격입니다.");
            default:
                System.out.println("잘못된 학점입니다.");
        }

    }

}

```

```java
/**
 * 더 큰 숫자 찾기
 * 여러분은 두 개의 정수 변수 a와 b를 가지고 있다. a의 값은 10이고, b의 값은 20이다. 삼항 연산자를 사용하여 두 숫자 중 더 큰 숫자를 출력하는 코드를 작성하자.
 */
public class CondOpEx {

    public static void main(String[] args){
        int a = 10;
        int b = 20;

        int max = (a > b) ? a : b;

        System.out.println("더 큰 숫자는 " + max + "입니다.");

    }
}

```

```java


public class EvenOddEx {

    public static void main(String[] args){
        int x = 2;

        if (x % 2 == 0) {
            System.out.println("x = " + x + "짝수");
        }else{
            System.out.println("x = " + x + "홀수");
        }

    }

    /**
     * 답안
     *
     * String result = (x % 2 == 0) ? "짝수" : "홀수";
     * System.out.println("x = " + x + ", " + result);
     *
     */

}

```


