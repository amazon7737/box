# 04. 반복문

```java
public class While1_1 {
    public static void main(String[] args){
        int count = 0;

        count = count + 1;
        System.out.println("현재 숫자는: " + count);
        count = count + 1;
        System.out.println("현재 숫자는: " + count);
        count = count + 1;
        System.out.println("현재 숫자는: " + count);

    }
}

```

```java
public class While1_2 {
    public static void main(String[] args){
        int count = 0;

        while (count < 3){
            count++;
            System.out.println("현재 숫자는 : " + count);
        }
    }
}

```

```java
import javax.swing.plaf.synth.SynthTextAreaUI;

/**
 * 문제 : 1부터 하나씩 증가하는 수를 3번 더해라 (1 ~ 3 더하기)
 *
 */



public class While2_1 {
    public static void main(String[] args){
        int sum = 0;

        sum = sum + 1;
        System.out.println("i= " + 1+ "sum = " + sum);

        sum = sum + 2;
        System.out.println("i= " + 2+ "sum = " + sum);

        sum = sum + 3;
        System.out.println("i= " + 3 + " sum= " + sum);


    }
}

```

```java
/**
 * 문제 : 10부터 하나씩 증가하는 수를 3번 더해라 (10 ~ 12더하기)
 *
 */
public class While2_2 {
    public static  void main(String[] args){
        int sum = 0;
        int i = 1;

        sum = sum + i;
        System.out.println("i= " + i + " sum = " + sum);
        i++;

        sum = sum + i;
        System.out.println("i = " + i + " sum = "  + sum);
        i++;

        sum = sum + i;
        System.out.println("i = "  + i + " sum = " + sum);
    }
}

```

```java
public class While2_3 {
    public static  void main(String[] args){
        int sum = 0;
        int i = 1;
        int endNum = 3;

        sum = sum + i;
        System.out.println("i = " + i + "sum = " + sum);
        i++;

        sum = sum + i;
        System.out.println("i = " + i + "sum = " + sum);
        i++;

        sum = sum + i;
        System.out.println("i = " + i + "sum = " + sum);
        i++;

    }
}

```

```java
public class While2_3_Change {
    public static void main(String[] args){
        int sum = 0;
        int i = 1;
        int endNum = 3;

        while (i <= endNum){
            sum = sum + i;
            System.out.println("i = " + i + " sum = " + sum);
            i++;
        }
    }
}

```

```java
public class DoWhile1 {
    public static void main(String[] args){
        int i = 10;
        while( i< 3){
            System.out.println("현재 숫자는 : " + i);
            i++;
        }
    }
}

```

```java
public class DoWhile2 {
    public static void main(String[] args){
        int i = 10;
        do {
            System.out.println("현재 숫자는 :" + i);
            i++;
        } while (i < 3);
    }
}

```

```java
public class Break1 {
    public static void main(String[] args){
        int sum = 0;
        int i = 1;

        while (true){
            sum += i;
            if (sum > 10){
                System.out.println("합이 10보다 크면 종료: i= " + i + " sum = " + sum);
                break;
            }
            i++;
        }
    }
}


```
```java
public class Continue1 {
    public static void main(String[] args){
        int i = 1;

        while (i <= 5){
            if( i== 3){
                i++;
                continue;
            }
            System.out.println(i);
            i++;
        }
    }
}

```

```java
public class For1 {
    public static void main(String[] args){
        for (int i = 1; i <= 10; i++){
            System.out.println(i);
        }
    }
}

```

```java
public class For2 {
    public static void main(String[] args){
        int sum = 0;
        int endNum = 3;

        for (int i = 1; i<=endNum; i++){
            sum = sum + i;
            System.out.println("i= " + i + " sum = " + sum);
        }
    }
}

```

```java
public class While2_3 {
    public static  void main(String[] args){
        int sum = 0;
        int i = 1;
        int endNum = 3;

        sum = sum + i;
        System.out.println("i = " + i + "sum = " + sum);
        i++;

        sum = sum + i;
        System.out.println("i = " + i + "sum = " + sum);
        i++;

        sum = sum + i;
        System.out.println("i = " + i + "sum = " + sum);
        i++;

    }
}

```

```java
public class Break2 {
    public static void main(String[] args){
        int sum = 0;
        int i = 1;

        for (; ; ){
            sum += i;
            if (sum > 10){
                System.out.println("합이 10보다 크면 종료: i= " + i + " sum = " + sum);
                break;
            }
            i++;
        }
    }
}

```

```java
public class Break3 {
    public static void main(String[] args){
        int sum = 0;

        for (int i = 1; ; i++){
            sum += i;
            if (sum > 10){
                System.out.println("합이 10보다 크면 종료: i=" + i + " sum = " + sum);
                break;
            }
        }
    }
}

```


```java
public class Nested1 {
    public static void main(String[] args){

        for (int i = 0; i < 2; i++){

            System.out.println("외부 for 시작 i: " + i);

            for(int j =0; j< 3; j++){

                System.out.println("-> 내부 for " + i + "-" + j);

            }

            System.out.println("외부 for 종료 i: " + i);
            System.out.println(); // 라인 구분을 위해 실행
        }
    }
}


```

```java


```
