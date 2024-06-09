## Class

```java
public class Student {
    String name;
    int age;
    int grade;
}
```

```java
/**
 * 학생 정보 출력 프로그램 만들기
 * 두명의 학생 정보를 출력하는 프로그램을 작성해야 한다. 각 학생은 이름, 나이, 성적을 가지고 있다
 */
public class ClassStart1 {
    public static void main(String[] args){
        String student1Name = "학생1";
        int student1Age = 15;
        int student1Grade = 90;

        String student2Name = "학생2";
        int student2Age = 16;
        int student2Grade = 80;

        System.out.println("이름: " + student1Name + "나이: " + student1Age + " 성적: " + student1Grade);

        System.out.println("이름: " + student2Name + "나이: " + student2Age + " 성적: " + student2Grade);


    }
}
```

```java

/**
 * 이전 문제에 배열을 적용해보기
 */
public class ClassStart2 {
    public void main(String[] args){
        String[] studentNames = {"학생1" , "학생2"};
        int[] studentAges = {15, 16};
        int[] studentGrades = {90, 80};

        for (int i=0;i<studentNames.length;i++){
            System.out.println("이름: " + studentNames[i] + " 나이: " + studentAges[i] + " 성적: " + studentGrades[i]);


        }
    }
}
/**
 * 배열 사용의 한계
 * 배열을 사용해서 코드 변경을 최소화하는데는 성공했지만, 3개의 배열로 나누어 져서, 데이터를 변경할 때 매우 조심해서 작업해야 한다.
 * 학생 2의 데이터를 제거하려면 각각의 배열마다 학생2의 요소를 정확하게 찾아서 제거해주어야 한다.
 *
 */
```

```java

/**
 * 클래스 도입
 * 클래스를 사용해서 학생이라는 개념을 만들고, 각각의 학생 별로 본인의 이름, 나이, 성적을 관리
 *
 * 맴버 변수 (Member Variables) : 변수들은 특정 클래스에 소속된 멤버
 * 필드 (Field) : 데이터 항목을 가리키는 전통적인 용어, 데이터베이스 , 엑셀 등에서 데이터 각각의 항목을 필드라 함
 *
 * 클래스는 관례상 대문자로 시작, 낙타 표기법 사용
 */
public class ClassStart3 {
    public static void main(String[] args){
        Student student1;
        student1 = new Student();
        student1.name = "학생1";
        student1.age = 15;
        student1.grade = 90;

        Student student2 = new Student();
        student2.name = "학생2";
        student2.age = 15;
        student2.grade = 90;

        System.out.println("이름: " + student1.name + " 나이: " + student1.age + " 성적: " + student1.grade);
        System.out.println("이름: " + student2.name + " 나이: " + student2.age + " 성적: " + student2.grade);

    }
}

/**
 * 클래스와 사용지 정의 타입
 * 타입은 데이터의 종류나 형태를 나타냄
 *
 * 클래스는 설계도, 실제 메모리에 만들어진 실체를 객체 또는 인스턴스라 함.
 */

/**
 * 참조값을 변수에 보관해야 하는 이유
 *
 * new Student() 이 코드는 단순히 Student 클래스를 기반으로 메모리에 실제 객체를 만드는 것이다
 * 생성한 객체에 접근할 수 있는 방법이 필요하게 되는데, 객체를 생성할때 반환되는 참조값을 어딘가에 가지고 있어야 한다.
 * 따라서 student1 변수에 참조값을 저장하면 저장한 참조값을 통해서 실제 메모리에 존재하는 객체에 접근할 수 있다.
 *
 */

/**
 * 클래스 : 객체를 생성하기 위한 '틀' 또는 '설계도'
 * 객체가 가져야 할 속성(변수) 과 기능(메서드)를 정의
 *
 *
 * 객체 : 클래스에서 정의한 속성과 기능을 가진 실체, 독립적인 상태
 * student1 과 student2 객체가 있을때 서로 같은 클래스에서 만들어졌지만, 서로 다른 객체이다.
 *
 * 인스턴스 : 특정 클래스로부터 생성된 객체 , 객체와 인스턴스라는 용어는 자주 혼용
 * 주로 객체가 어떤 클래스에 속해있는지 강조할때 사용, ex) student1 객체는 Student 클래스의 인스턴스다.
 *
 * 객체 vs 인스턴스
 * 인스턴스는 객체보다 좀 더 관계에 초점을 맞춘 단어.
 * 특정 클래스와의 관계를 명확히 할 때 인스턴스라는 용어를 주로 사용
 *
 *
 */

```

```java

public class ClassStart4 {
    public static void main(String[] args){
        Student student1 = new Student();
        student1.name = "학생1";
        student1.age = 15;
        student1.grade = 90;

        Student student2 = new Student();
        student2.name = "학생2";
        student2.age = 16;
        student2.grade = 80;

        Student[] students = new Student[2];
        students[0] = student1;
        students[1] = student2;

        System.out.println("이름: " + students[0].name + " 나이: " + students[0].age + "성적 : " + students[0].grade);

        System.out.println("이름: " + students[1].name + " 나이: " + students[1].age + "성적 : " + students[1].grade);


    }
}

```

```java
/**
 * 배열 도입 - 리팩토링
 */
public class ClassStart5 {
    public static void main(String[] args) {
        Student student1 = new Student();
        student1.name = "학생";
        student1.age = 15;
        student1.grade = 90;

        Student student2 = new Student();
        student2.name = "학생2";
        student2.age = 16;
        student2.grade = 80;

        // 배열 선언
        Student[] students = new Student[]{student1, student2};

        // for문 적용
        for(int i=0; i<students.length; i++){
            System.out.println("이름:"+students[i].name + "나이:"+students[i].age + " 성적:"+students[i].grade);
        }

    }

}
```

# Class2

```java
public class VarChange1 {
    public static void main(String[] args) {
        int a = 10;
        int b = a;

        System.out.println("a = " +a);
        System.out.println("b = " +b);

        // a 변경
        a = 20;
        System.out.println("변경 a = 20");
        System.out.println("a = " + a);
        System.out.println("b = " + b);

        // b 변경
        b = 30;
        System.out.println("변경 b = 30" );
        System.out.println("a = " + a);
        System.out.println("b = " + b);
    }
}
```

```java
public class Data {
    int value;
}

```

```java
public class VarChange2 {
    public static void main(String[] args) {
        Data dataA = new Data();
        dataA.value = 10;
        Data dataB = dataA;

        System.out.println("dataA 참조값=" + dataA);
        System.out.println("dataB 참조값=" + dataB);
        System.out.println("dataA.value = " + dataA.value);
        System.out.println("dataB.value = " + dataB.value);

        // dataA 변경
        dataA.value = 20;
        System.out.println("변경 dataA.value = 20");
        System.out.println("dataA.value = " + dataA.value);
        System.out.println("dataB.value = " + dataB.value);

        // dataB 변경
        dataB.value = 30;
        System.out.println("변경 dataB.value = 30");
        System.out.println("dataA.value = " + dataA.value);
        System.out.println("dataB.value = " + dataB.value);

    }
}
```

```java
/**
 * 기본형 vs 참조형3 - 메서드 호출
 *
 * 항상 변수의 값을 복사해서 대입한다.
 * 기본형과 메서드 호출
 */
public class MethodChange1 {
    public static void main(String[] args) {
        int a = 10;
        System.out.println("메서드 호출 전: a = " + a);
        changePrimitive(a);
        System.out.println("메서드 호출 후: a = " + a);
    }

    static void changePrimitive(int x){
        x = 20;
    }
}
```

```java
public class MethodChange2 {

    public static void main(String[] args) {
        Data dataA = new Data();
        dataA.value = 10;
        System.out.println("메서드 호출 전: dataA.value = " + dataA.value);
        changeReference(dataA);
        System.out.println("메서드 호출 후: dataA.value = " + dataA.value);
    }

    static void changeReference(Data dataX){
        dataX.value = 20;
    }
}
```

```java
public class ClassStart3 {
    public static void main(String[] args) {

        Student student1;
        student1 = new Student();
        student1.name = "학생1";
        student1.age = 15;
        student1.grade = 90;

        Student student2 = new Student();
        student2.name = "학생2";
        student2.age = 16;
        student2.grade = 80;

        System.out.println("이름:" + student1.name + " 나이:" + student1.age + " 성적: " + student1.grade);
        System.out.println("이름:" + student2.name + " 나이:" + student2.age + " 성적: " + student2.grade);
    }

}
```

```java
public class Student {
    String name;
    int age;
    int grade;
}
```

```java
public class Method1 {
    public static void main(String[] args) {
        Student student1 = new Student();
        initStudent(student1, "학생1" , 15, 90);

        Student student2 = new Student();
        initStudent(student2, "학생2", 16, 80);

        printStudent(student1);
        printStudent(student2);
    }


    static void initStudent(Student student, String name , int age, int grade){
        student.name = name;
        student.age = age;
        student.grade = grade;
    }

    static void printStudent(Student student){
        System.out.println("이름: " + student.name + " 나이:" + student.age + " 성적:" + student.grade);
    }
}
```

```java
public class Method2 {
    public static void main(String[] args) {
        Student student1 = createStudent("학생1" , 15, 90);
        Student student2 = createStudent("학생2" , 16, 80);

        printStudent(student1);
        printStudent(student2);
    }

    static Student createStudent(String name, int age, int grade){
        Student student = new Student();
        student.name = name;
        student.age = age;
        student.grade = grade;
        return student;
    }

    static void printStudent(Student student){
        System.out.println("이름:" + student.name + " 나이:" + student.age + " 성적:" + student.grade);
    }
}
```

```java
public class InitData {
    int value1; // 초기화 하지 않음
    int value2 = 10; // 10으로 초기화

}
```

```java
public class InitMain {
    public static void main(String[] args) {
        InitData data = new InitData();
        System.out.println("value1 = " + data.value1);
        System.out.println("value2 = " + data.value2);
    }
}
```

```java
/**
 * null 값 할당
 *
 * null : 택배를 보낼 때 제품은 준비가 되었지만, 보낼 주소지가 아직 결정되지 않아서, 주소지가 결정될 때까지는 주소지를 비워 두어야 할 수 있다.
 * 참조형 변수에는 항상 객체가 있는 위치에 참조값이 들어감. 아직 가리키는 대상이 없거나, 가리키는 대상을 나중에 입력하고 싶다면 어떻게?
 * 참조형 변수에서 아직 가리키는 대상이 없다면 null 이라는 특별한 값을 넣음.
 * 존재하지 않는 , 없다는 뜻
 */
public class NullMain1 {
    public static void main(String[] args) {
        Data data = null;
        System.out.println("1, data = " + data);
        data = new Data();
        System.out.println("2. data = " + data);
        data = null;
        System.out.println("3. data = " + data);
    }

    /**
     * 추가설명:
     * Data 타입을 받을 수 있는 참조형 변수 data를 만들고 null을 할당.
     * 아직 가리키는 객체가 없다는 뜻
     * 마지막에 다시 null 값을 할당 -> 더는 참조하지 않는다.
     * GC - 아무도 참조하지 않는 인스턴스의 최후
     * JVM의 GC(가비지 컬렉션)이 자동으로 메모리에서 제거해줌
     *
     */
}
```

```java
/**
 * NullPointerException
 * 주소지 없이 택배를 발송하면?
 *
 */
public class NullMain2 {
    public static void main(String[] args) {
        Data data = null;
        data.value = 10; // NullPointerException 예외 발생
        System.out.println("data = " + data.value);
    }
}
```

```java
public class BigData {
    Data data;
    int count;
}
```

```java
/**
 * 멤버 변수와 null
 * 지역 변수의 경우에는 null 문제를  파악하는 것이 어렵지 않다.
 * 멤버 변수가 null 경우는?
 */
public class NullMain3 {
    public static void main(String[] args) {
        BigData bigData = new BigData();
        System.out.println("bigData.count = " + bigData.count);
        System.out.println("bigData.data = " + bigData.data);

        // NullPointerException
        System.out.println("bigData.data.value = " + bigData.data.value);
    }
}
```

```java
public class NullMain4 {
    public static void main(String[] args) {
        BigData bigData = new BigData();
        bigData.data = new Data();
        System.out.println("bigData.count = " + bigData.count);
        System.out.println("bigData.data = " + bigData.data);
        System.out.println("bigData.data.value = " + bigData.data.value);
    }
}

```

```java
/**
 * 상품 주문 시스템 개발 - 리팩토링
 */
public class ProductOrderMain2 {
    public static void main(String[] args) {

        // 여러 상품의 주문 정보를 담는 배열 생성
        ProductOrder[] orders = new ProductOrder[3];
        // createOrder()를 여러번 사용해서 상품 주문 정보들을 생성하고 배열에 저장
        orders[0] = createOrder("두부" , 2000, 2);
        orders[1] = createOrder("김치" , 5000, 1);
        orders[2] = createOrder("콜라" , 1500, 2);

        // printOrders()를 사용해서 상품 주문 정보 출력
        printOrders(orders);
        // getTotalAmount()를 사용해서 총 결제 금액 계산
        int totalAmount = getTotalAmount(orders);
        // 총 결제 금액 출력
        System.out.println("총 결제 금액: " + totalAmount);


    }

    static ProductOrder createOrder(String productName, int price , int quantity){
        ProductOrder order = new ProductOrder();
        order.productName = productName;
        order.price = price;
        order.quantity = quantity;
        return order;
    }

    static void printOrders(ProductOrder[] orders){
        for(ProductOrder order : orders){
            System.out.println("상품명:" + order.productName + " , 가격: " + order.price + " , 수량: " + order.quantity);
        }
    }

    static int getTotalAmount(ProductOrder[] orders){
        int totalAmount = 0;
        for (ProductOrder order : orders){
            totalAmount += order.price * order.quantity;
        }
        return totalAmount;
    }
}
```

```java
public class ProductOrderMain3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("입력할 주문의 개수를 입력하세요: ");
        int n = scanner.nextInt();
        scanner.nextLine();

        ProductOrder[] orders = new ProductOrder[n];

        for(int i=0;i<orders.length;i++){
            System.out.println((i+1) + "번째 주문 정보를 입력하세요");
            System.out.print("상품명: " );
            String productName = scanner.nextLine();

            System.out.print("가격: ");
            int price = scanner.nextInt();

            System.out.print("수량: ");
            int quantity = scanner.nextInt();
            scanner.nextLine();

            orders[i] = createOrder(productName, price, quantity);
        }

        printOrders(orders);
        int totalAmount = getTotalAmount(orders);
        System.out.println("총 결제 금액: " + totalAmount);
    }


    static ProductOrder createOrder(String productName , int price, int quantity){
        ProductOrder order1 = new ProductOrder();
        order1.productName = productName;
        order1.price = price;
        order1.quantity = quantity;
        return order1;
    }

    static void printOrders(ProductOrder[] orders){
        for(ProductOrder order : orders){
            System.out.println("상품명: " + order.productName + " , 가격: " + order.price + " , 수량: " + order.quantity);
        }
    }

    static int getTotalAmount(ProductOrder[] orders){
        int totalAmount = 0;
        for (ProductOrder order : orders){
            totalAmount += order.price * order.quantity;
        }
        return totalAmount;
    }

    /**
     * 정리
     *
     * 원칙 : 자바는 항상 변수의 값을 복사해서 대입한다
     * 기본형이면 사용하는 값을 복사
     * 참조형이면 참조값을 복사
     *
     *
     */
}
```

# Class 문제

## 영화 리뷰 정보

```java
public class MovieReview {
    String title;
    String review;
}
```

```java

/**
 * 영화 리뷰 관리하기 1
 * 영화 리뷰 정보를 관리하려고 한다. 영화 리뷰 정보를 담을 수 있는 MoviewReview 클래스를 사용해보자.
 */
public class MovieReviewMain {
    public static void main(String[] args) {
        // 영화 리뷰 정보 선언
        MovieReview inception = new MovieReview();
        inception.title = "인셉션";
        inception.review = "인생은 무한 루프";

        MovieReview aboutTime = new MovieReview();
        aboutTime.title = "어바웃 타임";
        aboutTime.review = "인생 시간 영화!";

        // 영화 리뷰 정보 출력
        System.out.println("영화 제목: " + inception.title + ", 리뷰:" + inception.review);
        System.out.println("영화 제목: " +aboutTime.title + ", 리뷰:" + aboutTime.review);
    }
}
```

```java
/**
 * 영화 리뷰 관리하기2
 * 기존 문제에 배열을 도입하고, 영화 리뷰를 배열에 관리하자
 * 리뷰를 출력할 때 배열과 for문을 사용해서 System.out.println을 한번만 사용하자.
 */
public class MovieReviewMain2 {
    public static void main(String[] args) {
        MovieReview[] reviews = new MovieReview[2];

        MovieReview inception = new MovieReview();
        inception.title = "인셉션";
        inception.review = "인생은 무한 루프";
        reviews[0] = inception;

        MovieReview aboutTime = new MovieReview();
        aboutTime.title = "어바웃 타임";
        aboutTime.review = "인생 시간 영화!";
        reviews[1] = aboutTime;

        for(MovieReview review : reviews){
            System.out.println("영화 제목: " + review.title + ", 리뷰: " + review.review);
        }


    }
}
```

## 상품 주문 정보

```java
/**
 * 상품 주문 시스템 개발
 * 상품 주문 정보를 담을 수 있는 ProductOrder 클래스를 만들어 보자.
 */

/**
 * 1. ProductOrder 클래스는 다음과 같은 멤버 변수를 포함해야 한다.
 * 상품명(productName)
 * 가격(price)
 * 주문 수량(quantity)
 * 2. ProductOrderMain 클래스에 여러 상품 주문 정보를 배열로 관리, 정보 출력 , 계산해서 출력
 */
public class ProductOrder {
    String productName;
    int price;
    int quantity;
}
```

```java
public class ProductOrderMain {
    public static void main(String[] args) {
        // 여러 상품의 주문 정보를 담는 배열 생성
        ProductOrder[] orders = new ProductOrder[3];

        // 상품 주문 정보를 ProductOrder 타입의 변수로 받아 저장

        // 첫 번째 상품 주문 정보 입력
        ProductOrder order1 = new ProductOrder();

        order1.productName = "사과";
        order1.quantity = 2;
        order1.price = 5000;

        orders[0] = order1;

        // 두 번째 상품 주문 정보 입력
        ProductOrder order2 = new ProductOrder();

        order2.productName = "김치";
        order2.quantity = 2;
        order2.price = 2300;

        orders[1] = order2;

        // 세 번째 상품 주문 정보 입력
        ProductOrder order3 = new ProductOrder();

        order3.productName = "콜라";
        order3.quantity = 3;
        order3.price = 3000;

        orders[2] = order3;

        // 상품 주문 정보와 최종 금액 출력

        int totalAmount = 0;
        for (ProductOrder order : orders){
            System.out.println("상품명:" + order.productName + ", 가격 : " + order.price + ", 수량 : " + order.quantity);
            totalAmount += order.price * order.quantity;
        }

        System.out.println("총 결제 금액 : " + totalAmount);

    }
}
```

