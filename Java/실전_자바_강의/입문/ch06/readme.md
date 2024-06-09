# 07. 훈련

```java
public class Scanner1 {

    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        System.out.print("문자열을 입력하세요:");
        String str = scanner.nextLine(); // 입력을 String으로 가져옵니다.
        System.out.println("입력한 문자열: " + str);

        System.out.print("정수를 입력하세요: ");
        int intValue = scanner.nextInt(); // 입력을 int로 가져옵니다.
        System.out.println("입력한 정수: " + intValue);

        System.out.print("실수를 입력하세요: ");
        double doubleValue = scanner.nextDouble(); // 입력을 double로 가져옵니다.
        System.out.println("입력한 실수: " + doubleValue);

    }

}
```

```java
public class Scanner2 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        System.out.print("첫 번째 숫자를 입력하세요: ");
        int num1 = scanner.nextInt();

        System.out.print("두 번째 숫자를 입력하세요: ");
        int num2 = scanner.nextInt();

        int sum = num1 + num2;
        System.out.println("두 숫자의 합: " + sum);

    }
}
```

```java
public class Scanner3 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        System.out.print("첫 번째 숫자를 입력하세요: ");
        int num1 = scanner.nextInt();

        System.out.print("두 번째 숫자를 입력하세요: ");
        int num2 = scanner.nextInt();

        if (num1 > num2){
            System.out.println("더 큰 숫자: " + num1);
        }else if(num2 > num1){
            System.out.println("더 큰 숫자; " + num2);
        }else{
            System.out.println("두 숫자는 같습니다.");
        }

    }
}

```

```java
public class ScannerWhile1 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        while (true){
            System.out.print("문자열을 입력하세요(exit: 종료:");
            String str = scanner.nextLine();
            if (str.equals("exit")){
                System.out.println("프로그램을 종료합니다.");
                break;
            }

            System.out.println("입력한 문자열: " + str);

        }
    }
}
```

```java
public class ScannerWhile2 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        System.out.println("첫 번째 숫자와 두 번째 숫자 모두 0을 입력하면 프로그램을 종료합니다.");

        while (true){
            System.out.println("첫 번째 숫자를 입력하세요:");
            int num1 = scanner.nextInt();

            System.out.print("두 번째 숫자를 입력하세요:");
            int num2 = scanner.nextInt();

            if (num1 == 0 && num2 == 0){
                System.out.println("프로그램 종료");
                break;
            }

            int sum = num1 + num2;
            System.out.println("두 숫자의 합: " + sum);

        }
    }
}
```

```java
public class ScannerWhile3 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        int sum = 0;

        while (true){
            System.out.print("정수를 입력하세요 (0을 입력하면 종료): ");
            int number = input.nextInt();

            if (number == 0){
                break;
            }

            sum += number;
        }

        System.out.println("입력한 모든 정수의 합 : " + sum);

    }
}
```



