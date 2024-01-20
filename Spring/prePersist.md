# 수정글 적용하면 create_time 에 null이 들어가는 오류중 해결한 부분
> 

```java

@Getter
@MappedSuperclass
public class JpaBaseEntity{

  @Column(updatable = false)
  private LocalDateTime createdDate;

  private LocalDateTime createdDate;

  @PrePersist
  public void prePersist(){

    LcalDateTime now = LocalDateTime.now();
    createdDate = now;
    updatedDate = now;

  }

  @PreUpdate
  public void preUpdate(){
    updatedDate = LocalDateTime.now();

  }

}


```
