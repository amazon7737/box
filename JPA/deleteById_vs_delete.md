# deleteById 와 delete 의 차이

```java
@Service
public class UserService{

  private final UserRepository userRepository;

  public UserService(UserRepository userRepository){
    this.userRepository = userRepository;
  }

  public void delete(User user){
    userRepository.delete(user);
  }

  public void deleteById(Long userId){
    userRepository.deleteById(userId);
  }
}


```

deleteById 와 delete의 구현 부분을 확인해보면서 차이를 찾아봄

## deleteById 

* deleteById 내부적으로 delete를 호출하고 있다.
* 넘어온 id값으로 findById를 사용하여 delete에 인자로 넘겨줄 데이터를 조회하고 잇다.
* 넘어온 id 값이 null 인 경우는 EmptyResultDataAccessException을 발생시키고 잇다.

## delete

* entity에 대해 null체크를 한 후 EntityManager를 통해 삭제를 진행하고 있다.

delete 메소드는 findById와 조합해서 쓰는 경우가 많다.

findById + delete = deleteById 두 방법으로 나눠진다.

### deleteById의 장점
내부적으로 id에 대한 null 체크를 해주기 때문에 서비스 로직에서 id의 null 체크를 하지 않았더라도 의도치 않은 NullPointerException 발생을 예방할 수 있다.

### findById + delete 의 장점
deleteById를 사용하면 내부적인 findById 조회 시 값이 없을 경우 EmptyResultDataAccessException이 발생한다.
findById를 직접사용하면 예외처리를 커스텀하여 서버 개발자가 원하는 메시지를 클라이언트로 보내줄 수 있다는 장점이 있다.

## 결론
성능 상 차이없음 / 각각의 특징을 고려해서 상황에 맞춰서 사용하면됨
