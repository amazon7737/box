## 02 기본형과 참조형

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
public class Student {
    String name;
    int age;
    int grade;
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
public class Data {
    int value;
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

```
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

```
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

