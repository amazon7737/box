# 08. Array 배열

```java
public class Array1 {
    public static void main(String[] args){
        int student1 = 90;
        int student2 = 80;
        int student3 = 70;
        int student4 = 60;
        int student5 = 50;


        System.out.println("학생1 점수: " + student1);
        System.out.println("학생2 점수: " + student2);
        System.out.println("학생3 점수: " + student3);
        System.out.println("학생4 점수: " + student4);
        System.out.println("학생5 점수: " + student5);

    }
}
```

```java

/**
 * 배열
 *
 */
public class Array1Ref1 {
    public static void main(String[] args){
        /**
         * int[] student 는 배열 변수 선언인데
         * 배열 변수에는 배열을 담을 수 있다.
         *
         * new int[5] 로 새로 생성을 하여, int 형 변수 5개라는 뜻이다.
         * int형 변수 5개를 다룰 수 있는 배열을 새로 만든다는 뜻이다.
         *
         * int형을 5개 사용하면 4byte * 5 -> 20byte를 확보한다.
         *
         *
         */
        int[] students; // 배열 변수 선언
        students = new int[5]; // 배열 생성

        // 변수 값 대입
        students[0] = 90;
        students[1] = 80;
        students[2] = 70;
        students[3] = 60;
        students[4] = 50;

        // 변수 값 사용
        System.out.println(students); // I@36baf30c @앞의 I는 Int형 배열을 뜻한다. @뒤에 16진수는 참조값을 뜻한다.
        System.out.println("학생1 점수: " + students[0]);
        System.out.println("학생2 점수: " + students[1]);
        System.out.println("학생3 점수: " + students[2]);
        System.out.println("학생4 점수: " + students[3]);
        System.out.println("학생5 점수: " + students[4]);

    }
}
```

```java
public class Array1Ref2 {
    public static void main(String[] args){
        int[] students; // 배열 변수 선언
        students = new int[5]; // 배열 생성

        // 변수 값 대입
        students[0] = 90;
        students[1] = 80;
        students[2] = 70;
        students[3] = 60;
        students[4] = 50;

        // 변수 값 사용
        for (int i = 0; i < students.length;i++){
            System.out.println("학생" + (i+1) + " 점수: " + students[i]);
        }
    }
}
```

```java

public class Array1Ref3 {
    public static void main(String[] args){
        int[] students;
        students = new int[]{90, 80, 70, 60, 50}; // 배열 생성과 초기화

        for (int i=0;i<students.length;i++){
            System.out.println("학생" + (i+1) + " 점수: " + students[i]);
        }
    }
}

```

```java

public class Array1Ref4 {
    public static void main(String[] args){

        // 배열 생성 간략 버전, 배열 선언과 함께 사용시 new int[] 생략 가능
        int[] students = {90, 80, 70, 60, 50};

        for (int i=0;i<students.length;i++){
            System.out.println("학생" + (i+1)+" 점수: " + students[i]);
        }
    }
}
```

```java

public class ArrayDi0 {
    public static void main(String[] args){

        // 2x3 2차원 배열을 만든다.
        int[][] arr = new int[2][3]; // 행(row), 열(column)

        arr[0][0] = 1;
        arr[0][1] = 2;
        arr[0][2] = 3;
        arr[1][0] = 4;
        arr[1][1] = 5;
        arr[1][2] = 6;

        System.out.print(arr[0][0] + " ");
        System.out.print(arr[0][1] + " ");
        System.out.print(arr[0][2] + " ");
        System.out.println();

        System.out.print(arr[1][0] + " ");
        System.out.print(arr[1][1] + " ");
        System.out.print(arr[1][2] + " ");
        System.out.println();

    }
}
```

```java

public class ArrayDi1 {
    public static void main(String[] args){
        // 2x3 2차원 배열을 만듭니다.
        int[][] arr = new int[2][3]; // 행(row), 열(column)

        arr[0][0] = 1; // 0행 , 0열
        arr[0][1] = 2; // 0행 , 1열
        arr[0][2] = 3; // 0행 , 2열
        arr[1][0] = 4; // 1행 , 0열
        arr[1][1] = 5; // 1행 , 1열
        arr[1][2] = 6; // 1행 , 2열

        for(int row = 0; row < 2; row++){
            System.out.print(arr[row][0] + " "); // 0열 출력
            System.out.print(arr[row][1] + " "); // 1열 출력
            System.out.print(arr[row][2] + " "); // 2열 출력
            System.out.println(); // 한 행이 끝나면 라인을 변경한다.
        }
    }
}
```

```java

public class ArrayDi2 {
    public static void main(String[] args){
        // 2x3 2차원 배열을 만듭니다.
        int[][] arr = new int[2][3]; // 행(row) , 열(column)

        arr[0][0] = 1;
        arr[0][1] = 2;
        arr[0][2] = 3;
        arr[1][0] = 4;
        arr[1][1] = 5;
        arr[1][2] = 6;

        for(int row = 0; row < 2; row++){
            for(int column = 0; column < 3; column++){
                System.out.print(arr[row][column] + " ");
            }
            System.out.println(); // 한 행이 끝나면 라인을 변경한다.
        }

    }
}

```

```java

public class ArrayDi3 {
    public static void main(String[] args){
        // 2x3 2차원 배열, 초기화
        int[][] arr = {
                {1,2,3},
                {4,5,6}
        };

        // 2차원 배열의 길이를 활용
        for(int row = 0; row < arr.length; row++){
            for (int column = 0; column<arr[row].length; row++){
                System.out.print(arr[row][column] + " ");
            }
            System.out.println();
        }
    }
}
```

```java

public class ArrayDi4 {
    public static void main(String[] args){

        // 2x3 2차원 배열 , 초기화
        int[][] arr = new int[2][3];

        int i = 1;
        // 순서대로 1씩 증가하는 값을 입력한다.
        for (int row = 0; row < arr.length; row++){
            for(int column = 0; column < arr[row].length; column++){
                arr[row][column] = i++;
            }
        }

        // 2차원 배열의 길이를 활용
        for (int row = 0; row < arr.length; row++){
            for(int column = 0; column < arr[row].length; column++){
                System.out.print(arr[row][column] + " ");
            }
            System.out.println();
        }
    }
}
```

```java

public class EnhancedFor1 {
    public static void main(String[] args){
        int[] numbers = {1,2,3,4,5};

        // 일반 for문
        for(int i =0; i <numbers.length; ++i){
            int number = numbers[i];
            System.out.println(number);
        }

        // 향상된 for문 , for-each문
        for(int number : numbers){
            System.out.println(number);
        }

        // for-each문을 사용할 수 없는 경우, 증가하는 index 값 필요
        for(int i =0; i<numbers.length; ++i){
            System.out.println("number" + i + "번의 결과는: " + numbers[i]);
        }
    }
}
```
