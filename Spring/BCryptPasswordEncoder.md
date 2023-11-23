# 1. BCryptPasswordEncoder란?
> 스프링 시큐리티(Spring Security) 프레임워크에서 제공하는 클래스 중 하나로 비밀번호를 암호화하는데 사용할 수 있는 메서드를 가진 클래스

* BCrypt 해싱 함수(BCrypt hashing function)를 사용해서 비밀번호를 인코딩해주는 메서드와 사용자의 의해 제출된 비밀번호와 저장소에 저장되어 있는 비밀번호의 일치 여부를 확인해주는 메서드를 제공함
* PasswordEncoder 인터페이스를 구현한 클래스
* 생성자의 인자 값(verstion, strength, SecureRandom instance)를 통해서 해시의 강도를 조절

* 기본적으로 웹 개발을 하면 사용자의 비밀번호를 데이터베이스에 저장하기 된다. 허가되지 않은 사용자가 접근하지 못하도록 기본적인 보안이 되어 있을 것이다. 하지만 기본적 보안이 되어 있더라도, 만약 그 보안이 뚫리게 된다면 비밀번호 데이터는 무방비하게 노출된다. 이런 경우를 대비해 BCryptPasswordEncoder에서 제공하는 메서드를 활용하여 비밀번호를 암호화하여 비밀번호 데이터가 노출되더라도 확인하기 어렵도록 만들어 줄 수 있다.

# 2. 메서드 구성
> 스프링 시큐리티 5.4.2 기준 3개의 메서드 (encdoe() , matchers() , upgradeEncoding() )


#### encode(java.lang.CharSequence rawPassword)
* 패스워드를 암호화해주는 메서드 , SHA-1 , 8바이트로 결합된 해쉬 , 랜덤하게 생성된 솔트(salt)를 지원
* 매개변수는 java.lang.CharSequence타입의 데이터를 입력(CharSequence를 구현하고 있는 java.lang의 클래스 String, StringBuffer, StringBuilder )
* 반환 타입 : String 
* 똑같은 비밀번호를 해당 메서드를 통하여 인코딩하더라도 매번 다른 인코딩된 문자열을 반환


#### matchers(java.lang.CharSequence rawPassword , java.lang.String encodePassword)
* 제출된 인코딩되지 않은 패스워드(일치 여부를 확인하고자 하는 패스워드)와 인코딩된 패스워드의 일치 여부를 확인
* 첫 번째 매개변수는 일치 여부를 확인하고자 하는 인코딩 되지 않은 패스워드를 두 번째 매개변수는 인코딩된 패스워드를 입력
* 반환 타입 : boolean


#### upgradeEncoding(java.lang.String encodePassword)
* 더 나은 보안을 위해서 인코딩된 암호를 다시 한번 더 인코딩해야 하는 경우 사용
* 매개변수는 인코딩 필요 여부를 확인하고자하는 인코딩 된 패스워드(String 타입)를 입력
* 반환 타입은 인코딩이 필요한 경우 true를, 필요하지 않은 경우는 false를 입력
* 기본 구현에는 항상 false를 반환
* encde() 메서드를 통해서 암호화된 패스워드들은 upgradeEncoding()을 사용했을 때 모두 기본적으로 false를 반환
* 따라서 해당 메서드는 오버라이딩하여 더 강력한 해시를 해야할지의 기준을 정한 뒤 로직 처리하여 활용할 수 있을 것 같음.


