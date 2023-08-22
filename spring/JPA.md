<h1>JPA 사용법</h1>
<hr>

<h1>1.Entity</h1>
<hr>
* 데이터 베이스에 저장하기 위해 유저가 정의한 클래스를 <bold>Entity</bold>
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

