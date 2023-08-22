<h1>JPA 사용법</h1>
<hr>

<h1>1.Entity</h1>
<hr>

* 데이터 베이스에 저장하기 위해 유저가 정의한 클래스를 <bold>Entity</bold> 라고 한다.

* Domain이라고 생각하면 됨

* 보통 RDBMS에서 Table을 객체화 시킨것.
* 그래서 Table 의 이름 , 컬럼의 정보를 가짐.

```java

@Entity
public class Member{
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;

  @Column
  private String name;

  @Column
  private int age;

  public long getId(){
    return id;
  }

  public void setId(long id){
    this.id = id;
  }

  public String getName(){
    return name;
  }

  public void setName(String name){
    this.name = name;
  }

  public int getAge(){
    return age;
  }

  public void setAge(int age){
    this.age = age;
  }

}

```

<h1> 2. @Id </h1>
<hr>

* primary key 를 가지는 변수를 선언하는 것, @GeneratedValue 어노테이션은 해당 Id 값을 어떻게 자동으로 생성할지 전략을 선택. 위 코드에서 선택한 전략은 "AUTO"

<h1> 3. @Table </h1>
<hr>

* 데이터베이스 테이블 매핑 , 기본적 @Entity로 선언된 클래스 이름은 실제 데이터 베이스 테이블 명과 일치하는 것을 매핑. @Entity 클래스 명과 데이터베이스 테이블 명이 다를 경우 @Table(name = " ")과 같은 형식을 사용해서 매핑 가능.

<h1> 4. @Column </h1>
<hr>

* @Column 선언이 꼭 필요한 것은 아님. 하지만 @Column에서 지정한 변수명, 데이터베이스 컬럼명을 서로 다르게 주고 싶다면 @Column(name = " ")과 같은 형식으로 작성. 그렇지 않다면 멤버 변수명과 일치하는 데이터베이스 컬럼 매핑.

<h1> 5. Repository 인터페이스 작성 </h1>
<hr>

* 스프링부트는 Entity의 <bold>기본적인 CRUD가 가능하도록 JpaRepository 인터페이스를 제공함.</bold>

```java

public interface MemberRepository extends JpaRepository<Member, Long> {

}

```

* <bold>JpaRepository 인터페이스를 상속하기만 해도됨.</bold> 인터페이스에 따로 @Repository등의 annotation을 추가할 필요가 없다.

JpaRepository를 상속받을 때는 사용될 Entity 클래스와 ID 값이 들어감. => <bold>JpaRepository<T, ID></bold>

* 단순하게 상속하는 것으로 아래와 같은 기능을 제공(method)

  * save()
    * 레고드 저장(insert, update)

  * findOne()
    * primary key로 레코드 한건 찾기

  * findAll()
    * 전체 레코드 불러오기, 정렬(sort), 페이징(pageable) 가능

  * count()
    * 레코드 갯수

  * delete()
    * 레코그 삭제










