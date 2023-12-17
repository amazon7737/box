# LazyInitializationException
> findById , getById 를 사용하다가 발생한 에러입니다. 해당 로그에서는 user 테이블외의 joinColumn 을 이룬 follow 테이블을 찾아가서 null 값으로 인해 발생하였다고 작성되어있었습니다.

Hibernate에서 lazy loading을 사용하다 보면 한번 쯤 직면하는 문제.
(연관관계 매핑에서도 같은 오류가 발생하였음)

getById() 메서드의 스펙을 읽어보았다.

> Returns a reference to the entity with the given identifier. Depending on how the JPA persistence provider is implemented this is very likely to always return an instance and throw an EntityNotFoundException on first access. Some of them will reject invalid identifiers immediately.

refernce 즉 , 엔티티의 참조를 반환한다고 적혀있다. 기본적으로 Hibernate에서 지연 로딩을 구현하기 위해 실제 객체가 아닌 Proxy 객체를 사용함으로써 실제 객체를 메모리에 로드하지 않아 자원을 절약한다.
getById() 메서드는 지연 로딩을 지원하여 실제 객체가 아닌 Proxy 객체(엔티티의 참조)를 가져오며 실제 객체의 속성에 접근하는 순간 DB에 접근한다.

getById() 메서드는 EntityManager.getReference 를 사용하는데 해당 메서드가 프록시 객체를 반환한다.

오류 메시지를 다시 읽어보자면

> could not initializa proxy - no session

Session 은 영속성 컨텍스트를 관리하는 엔티티 매니저라고 생각하면 된다.

영속 상태인 Proxy 객체에 실제 데이터를 불려오려고 초기화를 시도하지만 Session이 close 되어서 준영속 상태가 되어 값을 가져올 수 없어 발생한 오류임을 알 수 있다.

지연 로딩을 하려면 해당 객체는 무조건 영속성 컨텍스트에서 관리 해야한다.


## 해결 방안 

* Transactional

기본적으로 스프링 컨테이너는트랜잭션범위의 영속성 컨텍스트 전략을 기본으로 사용한다. 즉, 영속 상태인 Proxy 객체에 실제 데이터를 불러오려고 초기화를 시도하지만 Session이 close 되어서 준영속상태가 되어 값을 가져올 수가 없어 발생한 오류임을 알 수 있다. (영속성 컨텍스트 생존 범위)

즉, 단위 테스트하는 메서드 위에 @Transactional 어노테이션을 붙이면 해당 메서드가 시작하고 끝날 때까지 같은 세션이 유지된다. Test Code 상의 경우 Rollback 처리를 진행한다.

* findById() 사용하기

즉시로딩(EAGER)을 지원하는 findById()를 사용할 수 있다.
기능은 동일하며 프록시 객체가 아닌 실제 객체를 반환한다.

아래는 findById() 구현체이다. 반환 값을 보면 EntityManager에서 직접 객체를 가져오는 Eager이다.

``` java
@Override
public Optional<T> findById(ID id){
  Assert.notNull(id, ID_MUST_NOT_BE_NULL);

  Class<T> domainType = getDomainClass();

  if (metadata == null){
    return Optional.ofNullable(em.find(domainType, id));
  }

  LockModeType type = metadata.getLockModeType();

  Map<String, Object> hints = new HashMap<>();
  getQueryHints().withFetchGraphs(em).forEach(hints::put);

  return Optional.ofNullable(type == null ? em.find(domainType, id, hints) : em.find(domainType, id, type, hints));
}

```


