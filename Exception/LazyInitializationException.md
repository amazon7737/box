# LazyInitializationException
> findById , getById 를 사용하다가 발생한 에러입니다. 해당 로그에서는 user 테이블외의 joinColumn 을 이룬 follow 테이블을 찾아가서 null 값으로 인해 발생하였다고 작성되어있습니다.


데이터베이스 설계 팀 프로젝트를 진행하며 스키마 30여개를 Entity로 작성하여 테스트코드를 진행하던 도중 발생한 예외였다. 당시 4-5일동안 계속해서 고쳐보려고 했으나 엔티티에 대한 이해가 부족하던 상태여서 예외를 해결하지 못했다.
무심코 사용하던 Lazy Loading에 대해서 알아보자.

Hibernate에서 lazy loading을 사용하다 보면 한번 쯤 직면하는 문제.
(연관관계 매핑에서도 같은 오류가 발생하였음)

## 프록시(Proxy)
대리, 가짜라는 의미를 가지고 있다.

## 프록시를 사용하는 이유는?
예를 들어, Member 엔티티를 조회할 때 Team도 함께 조회해야 하면

비즈니스 로직에서 필요하지 않을 때를 구분 짓기 위해서
낭비를 줄이기 위해서
이러한 낭비를 지연로딩과 프록시라는 개념으로 해결하게 된다.

## 프록시에 대해서 조금더 살펴보자면..
JPA에서 em.find() 말고 em.getReference()라는 메서드도 제공된다.
em.find()는 DB를 통해서 실제 엔티티 객체를 조회하는 메서드이고
em.getReference()는 가짜(프록시) 엔티티 객체를 조회하는 메서드이다.

## 즉시로딩(EAGER)
실제 DB에서 한방에 조회하는 것

## 프록시와 즉시로딩
(자바 ORM 표준 JPA 프로그래밍 책에 따르면..)

* 가급적 지연로딩만 사용
* 즉시로딩을 사용하면 예상치 못한 SQL 문제 발생
* 즉시로딩은 JPQL에서 N+1 문제를 발생시킴
* @ManyToOne / @OneToOne 은 기본이 즉시로딩 -> LAZY로 변경해야함
* @ManyToMany / @OneToMany 는 기본이 지연로딩

## 문제 발생 이유 (SQL 오류가 나는 이유)
내가 예상한 쿼리가 아닌 다른 쿼리가 나갈 수 있다.

## 왜?
(fetch = FetchType.EAGER) 로 묶여있을 경우
Member만 조회를 필요로 했으나, Team 정보도 같이 나오기 때문!
이 문제가 N+1로 발생할 수 있고, 서비스가 커지면 걷잡을 수 없다.


## 또 다른 고려 사항..
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


* Transactional

기본적으로 스프링 컨테이너는트랜잭션범위의 영속성 컨텍스트 전략을 기본으로 사용한다. 즉, 영속 상태인 Proxy 객체에 실제 데이터를 불러오려고 초기화를 시도하지만 Session이 close 되어서 준영속상태가 되어 값을 가져올 수가 없어 발생한 오류임을 알 수 있다. (영속성 컨텍스트 생존 범위)

즉, 단위 테스트하는 메서드 위에 @Transactional 어노테이션을 붙이면 해당 메서드가 시작하고 끝날 때까지 같은 세션이 유지된다. Test Code 상의 경우 Rollback 처리를 진행한다.

-> DAO 레이어(Sprgin Data 에서 Repository ) 상위에서 세션을 시작해 DAO 계층 밖에서도 세션이 종료되지 않도록 트랜잭션을 거는 방법이다.

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


