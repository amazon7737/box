<h1> sqld 주황색 문제집 풀면서 알게된것</h1>

# 과목 I
<hr>

## 1장 데이터 모델링의 이해

<hr>

### 1번 문제
* 모델링은 단지 시스템 구현만을 위해 수행하는 태스크가 아니며, 시스템 구현을 포함한 업무분석 및 업무 형상화를 하는 목적도 있음.


#### 싱글턴패턴
* 객체의 인스턴스가 오직 1개만 생성하는 것을 말한다.

<hr>

### 파생속성 
*  다른 속성 영향 , 계산된 값.

* 쿼리 문제 나오면 내가 따라 짜보기

* DCL => grant, revoke / TCL => commit , rollback

* 테이블명 , 컬럼명 문자로 시작

* RENAME ~ TO 으로 테이블 이름 변경을 할 수 있다

* VARCHAR("1") 문자수를 잘 봐야되는데 체크 안해서 틀린 문제가 있다.

* NULL 이면 표기 안해도 기본값이 NULL 이다.

* Insert into values ( ???) 이 문구를 벗어나면 Insert 문 벗어나는거 체크하면 된다.

* 오류나는걸 찾는건지 아닌지 체크 잘하자.

* 중복 DISTINCT 이다.

* 사용 용도가 없다 그러면 DELETE FROM 그냥 하면된다 (* 안씀)

#### 트랜잭션

* 데이터를 조작하기 위한 논리적인 작업단위 데이터 모델로 표현할 수 있으며, 데이터는 트랜잭션 범위로 묶일 수 있다.

#### 트랜잭션의 특성

* 원자성 => 트랜잭션에서 정의된 연산들은 모두 성공적으로 실행되던지 아니면 전혀 실행되지 않은 상태로 남아 있어야 한다.

* 일관성 => 트랜잭션이 실행 되기 전의 데이터베이스 내용이 잘못 되어 있지 않다면 트랜잭션이 실행된 이후에도 데이터베이스의 내용에 잘못이 있으면 안된다.

* 고립성 => 트랜잭션이 실행되는 도중에 다른 트랜잭션의 영향을 받아 잘못된 결과를 만들어서는 안된다.

* 지속성 => 트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이터베이스의 내용은 영구적으로 저장된다.

* Dirty Read => 다른 트랜잭션에 의해 수정되었지만 아직 커밋되지 않은 데이터를 읽는 것을 말한다.


# 과목 II

### ORDER BY 문장
* where
* group by
* having
* order by

* ASC 오름차순
* DESC 내림차순

### 55번 문제

~~~sql
ORDER BY (CASE WHEN ID = 999 THEN 0 ELSE ID END

~~~
* order by 절 case문에 의해 999는 0으로 치환되고 그외는 ID 값으로 정렬된다.

### 56번 문제

~~~sql
SELECT 지역, 매출금액 FROM 지역별매출 ORDER BY 년 ASC;
~~~
* SELECT 절의 실행순서에 의해서 SELECT 다음 ORDER BY절이 수행되기 때문에 SELECT 절에 기술되지 않는 "년"칼럼으로 정렬하는 것은 논리적으로 틀렸다. 하지만 오라클은 행기반이기에 데이터를 액세스할 때 행 전체 칼럼을 메모리에 로드되서 가능하다.

* 단, 아래와 같은 SQL일 겨웅에는 정렬할 수 없다.
~~~sql
SELECT 지역, 매출금액
FROM (
    SELECT 지역, 매출금액
      FROM 지역별매출
   )
ORDER BY 년 ASC;
~~~

* IN-LINE VIEW가 먼저 수행되어서 더 이상 SELECT절 외 칼럼을 사용할 수 없기 때문.

### 57번 문제

* ORDER BY 절에 컬럼명 대신 Alias 명이나 컬럼 순서를 나타내는 정수를 혼용하여 사용할 수 있다.

### ORDER BY 절 특징
* 기본 정렬순서 : 오름차순
* 숫자형 => 가장 작은 값부터
* 날짜형 => 가장 빠른 날부터

* Oracle : NULL 값을 가장 큰값

* SQL Server : NULL 값으 가장 작은 값

### 58번 문제

```sql
SELECT ID, AMT
FROM TBL
ORDER BY (CASE WHEN ID = 'A' THEN 1 ELSE 2 END),
          AMT DESC
```
* CASE절을 이용해서 원래의 정렬 순서를 변경하였다. 그래서 ID가 'A'인 것이 가장 먼저 표시되도록 하였다.

### Select 문장 실행 순서
* FROM => WHERE => Group by => Having => Select => Order By

### TOP () 예제 사원
* 테이블에서 급여가 높은 2명을 내림차순으로 출력하는데 같은 급여를 받는 사원이 있으면 같이 출력한다.

```sql
SELECT TOP(2) WITH TIES ENAME, SAL
FROM EMP
ORDER BY SAL DESC;
```

### EQUI JOIN 문장
* WHERE 절에 JOIN 조건을 넣는다.

### ANSI/ISO SQL 표준 EQUI JOIN 문장
* ON 절에 JOIN 조건을 넣는다.

### 62번 문제

```sql
SELECT 영화.영화명, 배우.배우명, 출연료
FROM 배우, 영화, 출연
WHERE 출연료 >= 8888
AND 출연.영화번호 = 영화.영화번호
AND 출연.배우번호 = 배우.배우번호;
```
* 영화명과 배우명은 출연 테이블이 아니라 영화와 배우 테이블에서 가지고 와야 하는 속성이므로 출연테이블의 영화번호와 영화테이블의 영화번호 및 출연테이블의 배우번호와 배우테이블의 배우번호를 조인하는 SQL문을 작성해야 함.

### 63번 문제 (어렵다..)

### 65번 문제

* 순수 관계 연산자에 해당하지 않는것 => UPDATE

### 66번 다시 풀어보기

* #custId# : ?

#### TO_CHAR

* 날짜 포맷변경

```sql
select TO_CHAR(SYSDATE, 'YYYYMMDD')

```

* YYYY: 년 , MM: 월, DD: 일, HH24: 24시간, HH: 12시간, MI: 분, SS: 초

### 67번 문제

#### 가운데 테이블로 만나서 inner join 한다는것이..

* 제품 - 생산제품 - 생산라인은 1:N , N:1의 관계를 갖는다. 생산 제품 테이블은 제품-생산라인이 N:M 관계를 해소하기 위한 조인 테이블이므로 특정 생산라인 번호에서 생산되는 제품의 제품명을 알기 위해서는 제품과 생산제품 2개의 엔티티 사이에 JOIN이 필요하다.


#### 카타시안 곱(Cartesian Product)
> join 쿼리 중에 where 절에 기술하는 join 조건이 잘못 기술되었거나 아예 없을 경우 발생하는 현상


#### inner join을 하는 상황

* 조인(inner join) : 기준 테이블과 조인 테이블 모두 데이터가 존재해야 조회됨

* 아우터 조인(outer join) : 기준 테이블에만 데이터가 존재하면 조회됨

### 69번 문제를  풀면서

* 상황에서 어떤 엔터티가 어떤 테이블과 어떤 관계인지 어떤 상황인지 이해하면서 필요한 sql문을 생각하자

* BETWEEN JOIN 이란 구문은 없다. 그래서 오류가 발생한다.

### 71번 문제

#### CROSS JOIN

> join 조건이 없는 경우 생길 수 있는 모든 데이터의 조합
> 양 쪽 데이터 집합이 M*N 건으로 발생하게 된다


### OUTER JOIN

* 아우터 조인에서 LEFT , RIGHT는 기준 테이블을 지정하는 것이며, 조인 테이블에 데이터가 없어도 기준테이블의 모든 데이터가 조회된다. 그래서 없는거는 NULL로 표시된다.

```sql
-- 1번
고객 A LEFT OUTER JOIN 단말기 B

-- 2번
고객 A RIGHT OUTER JOIN 단말기 B

```

* 1번문은 고객 A를 기준으로 2번문은 단말기 B를 기준으로 기준테이블을 정하여 데이터를 조회한다.

### 73번 문제

#### FULL OUTER JOIN

> 조인 수행시 좌측 , 우측 테이블의 모든 데이터를 읽어 JOIN 하여 결과를 생성한다.
> 즉, RIGHT OUTER JOIN 과 LEFT OUTER JOIN의 결과를 합집합으로 처리한 결과와 동일하다.

### 77번 문제

#### ANSI 표준 구문
> 미국 국가표준 협회(American National Standards Institute)는 미국에서 제품, 서비스, 과정, 시스템, 인력관리 분야에서 표준을 개발하는 것을 감독하는 비영리 민간 기구

#### Oracle 에서 SQL Server로 구문 변경 할때

> 오라클 아우터 조인 시 대상 컬럼에 "(+)" 기호를 붙여서 조인하면 된다.
> 오라클에서는 OUTER JOIN 구문의 (+)을 사용하여 처리할 수 있음. 변경하기 위해서는 Inner쪽 테이블(게시글)에 조건절을 ON절에 함께 위치시켜야 정상적인 OUTER JOIN을 수행할 수 있다.

### 79번 문제

### 집합 연산자의 종류

* UNION : 합집합
* UNION ALL : 합집합 + 중복
* INTERSECT : 교집합
* EXCEPT : 제외

### 80번 문제

* NOT EXIST , MINUS , WHERE 들이 같이 연관되어 비슷한 출력이 나오는 것은? 같은 유형이 자주 나온다.

### 82번 문제

* order by 1, 2 : 1은 첫번째 컬럼을 의미하고 2는 두번째 컬럼을 의미한다.

> 알파벳 순서로 order by 하는 문제를 주의하자.

### UNION 우선순위

* UNION ALL 다음 UNION 이 수행된다

### 87번 문제

* START WITH : 계층 구조의 시작점을 지정하는 구문

* CONNECT BY PRIOR : 각 행들의 연결 관계를 설정

* ORDER SIBLINGS BY : 형제 노드 사이에서 정렬을 지정하는 구문

### 89번 문제


* CONNECT BY 절에 작성된 조건절은 WHERE 절에 작성된 조건절과 다르다.
* START WITH 절에서 필터링된 시작 데이터는 무조건 결과목록에 포함되어지며, 이후 CONNECT BY 절에 의해 필터링 된다.
* 그래서 NULL 인 데이터가 결과목록에 포함되어진다.
* 그 이후 리커시브 조인에 의해 입사일자가 필터링 된다.

* 리커시브 조인 : 재귀 조인

### 90번 문제

#### 계층형 질의문(Hierarchical Query)

> 계층형 데이터를 조회하기 위한 질의.
> ex) 상위 사원(관리자)과 하위 사원 관계에서의 테이블 데이터 조회

#### SQL Server 에서의 계층형 질의문

> CTE(Common Table Expression)를 재귀 호출함으로써 계층 구조를 전개한다.
> 앵커 멤버를 실행하여 기본결과 집합을 만들고 이후 재귀 멤버를 지속적으로 실행한다.

#### Oracle 에서의 계층형 질의문

> WHERE 절은 모든 전개를 진행한 이후 필터 조건으로서 조건을 만족하는 데이터만을 추출하는데 활용된다.
> PRIOR 키워드는 SELECT , WHERE 절에서도 사용할 수 있다.
> 'PRIOR 자식 = 부모' 형태로 사용하면 순방향 전개로 수행된다.

```sql

SELECT item_name, item_id , parent_id
FROM bom
START WITH parent_id IS NULL --루트노드를 지정
CONNECT BY PRIOR item_id = parent_id; --부모와 자식노드들간의 관계를 연결

```

* PRIOR => CONNECT BY 절에서 사용
* 'PRIOR 자식 = 부모' 형태는 부모에서 자식방향으로 순방향 데이터 전개.
* 'PRIOR 부모 = 자식' 형태는 자식에서 부모방햐응로 역방향 데이터 전개.
* NOCYCLE : CYCLE이 발생한 이후의 데이터는 전개되지 않아서 런타임 오류 방지
* ORDER SIBLINGS BY 절 : 동일한 LEVEL을 가진 노드 사이에서 정렬을 수행한다.

### 92번 문제

* 셀프조인 (SELF JOIN) : 동일 테이블 사이의 조인 / FROM 절에 동일 테이블이 두번 이상 나타난다. 동일 테이블 사이의 조인을 수행하면 테이블과 칼럼 이름이 모두 동일하기 때문에 식별을 위해 반드시 테이블 별칭(Alias)를 사용해야 한다.

* 셀프 조인은 한 테이블 내에서 일어나는거기 때문에 두 테이블이라고 말하면 무조건 잘못됫다


#### 서브쿼리

* 단일 행 서브 쿼리
  * 서브 쿼리가 단일 행 비교 연산자 (= , < , <= , > , >= , <>)와 함께 사용할 때는 서브쿼리의 결과 건수가 반드시 1건 이하여야 한다. 만약 2건 이상일 경우 오류 발생

```sql
SELECT C1, C2 , C3
FROM T1
WHERE C1 = (SELECT C1
            FROM T2
            WHERE C2 = '3')
ORDER BY C1, C2, C3;
```
* 만약 T2 테이블의 C2 = 3 인 조건을 만족하는 C1 의 값이 2건 이상인 경우 오류 발생

```sql
SELECT C1, C2, C3
FROM T1
WHERE C1 <= (SELECT AVG(C1)
            FROM T2
            WHERE C2 = '3')
ORDER BY C1, C2, C3;
```
* 그룹 함수를 사용하는 경우 결과값이 1건이기 때문에 단일 행 서브쿼리로써 사용 가능하다.

* 다중 행 서브 쿼리
  * 서브 쿼리의 결과가 2건 이상 반환될 수 있다면 반드시 다중 행 비교 연산자 (IN, ALL , ANY , SOME)와 함께 사용해야 한다.

```sql
SELECT C1, C2, C3
FROM T1
WHERE C1 IN (SELECT C1
            FROM T2
            WHERE C2 = '3')
ORDER BY C1, C2, C3;
```
* 만약 T2 테이블의 C2 = 3 인 조건을 만족하는 C1의 값이 2건 이상인 경우 = 이 아닌 IN을 사용해야 합니다.

* 다중 칼럼 서브 쿼리
  * 서브쿼리 결과로 여러 개의 칼럼이 반환되어 메인쿼리의 조건과 동시에 비교되는 것을 의미합니다.

```sql
SELECT C1, C2, C3
FROM T1
WHERE (C1, C2) IN (SELECT C1, C2
                  FROM T2
                  WHERE C2 = '3')
ORDER BY C1, C2, C3;
```

* 연관 서브쿼리
  * 서브쿼리 내에 메인 쿼리 컬럼이 사용된 서브쿼리 입니다.

```sql
SELECT T1.C1, T1.C2, T1.C3
FROM T1 T1
WHERE (T1.C1, T1.C2) IN (SELECT T2.C1, T2.C2
              FROM T2 T2
              WHERE T2.C2 = T1.C2) -- 메인 쿼리의 컬럼을 서브쿼리에 사용

ORDER BY T1.C1, T1.C2, T1.C3;
```

* 스칼라 서브쿼리
  * 한행, 한 컬럼만을 반환하는 서브쿼리

> SELECT 절을 사용하는 서브쿼리

```sql
SELECT T1.C1, (SELECT AVG(T2.C1) FROM T2 T2)
FROM T1 T1;
```

> FROM 절에 사용하는 서브쿼리
인라인 뷰라고 한다.
SQL 문이 실행될 때만 임시적으로 생성되는 동적인 뷰이기 때문에 저장되지는 않는다.


```sql
SELECT T1.C1, T2.C1, T2.C2
FROM T1 T1,
      (SELECT C1, C2 FROM T2) T2
WHERE T1.C1 = T2.C1;
```

> HAVING 절에서 사용하는 서브쿼리

```sql
SELECT T1.C1, T2.C1, T2.C2
FROM T1 T1, T2 T2
WHERE T1.C1 = T2.C1
GROUP BY T1.C1, T2.C1, T2.C2
HAVING AVG(T1.C1) < (SELECT AVG(C1)
          FROM T2);
```

* 그룹함수와 함께 사용될 때 그룹핑된 결과에 대해 부가적인 조건을 주기 위해 사용합니다.

> UPDATE 문의 SET 절에서 사용하기

```sql
UPDATE T1 T1
  SET T1.C1 = (SELECT T2.C1 FROM T2 T2 WHERE T2.C1 = T1.C1);
```

> INSERT 문의 VALUES 절에서 사용하기

```sql
INSERT INTO T1 (C1, C2, C3) SELECT C1, C2, C3 FROM T2;
```

```sql
INSERT INTO T1 (C1, C2, C3) VALUES ((SELECT C1 FROM T2), (SELECT C2 FROM T2), (SELECT C3 FROM T2));
```

> 서브 쿼리는 단일 행 (Single Row) 또는 복수 행(Multi Row) 비교 연산자와 함께 사용할 수 있다.
> 서브 쿼리는 SELECT 절 , FROM 절 , HAVING 절 , ORDER BY 절 등에서 사용이 가능하다
> 다중 컬럼 서브쿼리는 서브쿼리의 결과로 여러 개의 컬럼이 반환 되어 메인쿼리의 조건과 동시에 비교되는 것을 의미하며 Oracle 및 SQL Server 등의 DBMS에서 사용 할 수 있다.
> 서브쿼리의 결과가 복수 행 결과를 반환하는 경우에는 IN , ALL , ANY 등의 복수 행 비교 연산자와 사용하여야 한다.
> 다중 컬럼 서브 쿼리는 서브쿼리의 결과로 여러 개의 컬럼이 반환되어 메인 쿼리의 조건과 비교되는데 , SQL Server에서는 현재 지원하지 않는 기능이다.

#### 서브 쿼리의 종류

Single Row (단일 행 서브 쿼리 ) : = , < , <= , > , >= , <>
Multi Row (다중 행 서브 커리) : IN , ALL , ANY , SOME ,EXISTS
Multi Column : 여러 컬럼을 반환



<hr>



#### 모델링의 특징 세 가지는 무엇인가?
	* 추상화 , 단순화 , 명확화







#### 각 속성이 가질 수 있는 값의 범위를 뜻하는 용어는?
	* 도메인(Domain)

#### DCL에 속하는 명령어는?
	* GRANT , REVOKE

#### DDL에 속하는 명령어는?
	* CREATE , ALTER , DROP , TRUNCATE

#### SELECT 할 때 데이터 중복을 제거해주는 키워드는?
	* DISTINCT

#### 트랜잭션의 특징은?
	* 원자성, 일관성, 고립성, 지속성

#### 독립성, 편리성, 보안성 하면 떠오르는 이것은?
	* 뷰(VIEW)

#### 순위가 1 2 3 4 5 ... 일 때 생각나는 함수는?
	* DENSE_RANK

#### 교집합을 구하는 집합 연산자는 무엇인가?
	* INTERSECT

#### SELECT , NULLIF('A', 'A') FROM DUAL;의 결과는?
	* NULL

#### SELET 문의 논리적인 수행 순서는?
	* FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY

#### 모델링에서 부모 테이블 데이터를 삭제하면 자식 테이블 데이터도 삭제되는 옵션은?
	* CASCADE

#### UNION과 UNION ALL의 차이는?
	* UNION은 중복데이터를 제거하고 UNION ALL은 제거하지 않음

#### 데이터를 빠르게 조회하기 위해 미리 계산된 값이 저장되는 속성은?
	* 파생속성

#### 계층 쿼리에서 형제 노드 간의 정렬을 지정하는 구문은?
	* ORDER SIBLINGS BY

#### 의미상 더는 분리되지 않는 최소의 데이터 단위는?
	* 속성(Attribute)

#### SELECT 절에 오는 서브쿼리는?
	* 스칼라 서브쿼리

#### 제1정규형(1NF)의 특징은?
	* 모든 속성은 반드시 하나의 값(원자값)만 가져야 한다.

#### 제2정규형(2NF)의 특징은?
	* 모든 속성은 반드시 모든 기본키에 종속되어야 한다

#### 제3정규형(3NF)의 특징은?
	* 기본키가 아닌 모든 속성(일반속성) 간에는 서로 종속될 수 없다

#### 관계의 표기법에 표현되는 개념 세 가지는?
	* 관계명, 관계차수, 관계선택사양

#### SELECT COALESCE(NULLIF ('A', 'A'), 'B') FROM DUAL; 의 결과는?
	* B

#### SUMMER 테이블 이름을 FALL로 바꾸려면?
	* RENAME SUMMER TO FALL;

#### 다양한 권한을 그룹으로 묶어 관리할 수 있는 것은?
	* ROLE

#### 사용자에게 권한을 부여하는 명령어는?
	* GRANT

#### 카티션 곱을 생성하는 JOIN은?
	* CROSS JOIN

#### SELECT ABS(-3.8) FROM DUAL;의 결과는?
	* 3.8

#### 그룹함수 세 가지는 무엇인가?
	* ROLLUP, CUBE, GROUPING SETS

#### SELECT FLOOR(12.5) FROM DUAL;의 결과는?
	* 12

#### INSERT랑 UPDATE랑 한방에 할 수 있는 것은?
	* MERGE INTO

#### 웁쓰! INSERT , UPDATE, DELETE를 잘못 날렸을 때 되돌리는 것은?
	* ROLLBACK

#### 차집합을 구하는 집합 연산자는?
	* MINUS

#### 이름이 같은 컬럼을 기준으로 EQUIJOIN하는 것은?
	* NATURAL JOIN

#### WHERE 절에서 OR와 AND 중 우선순위가 높은 것은?
	* AND

#### SELECT SIGN(-77) FROM DUAL;의 결과는?
	* -1

#### COMMIT, ROLLBACK, SAVPOINT를 묶어서 뭐라고 하는가?
	* TCL(Transaction Control Language)

#### COUNT( * ) 와 COUNT(컬럼명)의 차이는?
	* NULL을 세는가(*) 안 세는가(컬럼명)

#### ORDER BY 할 때 NULL을 맨 끝으로 보내는 옵션은?
	* NULLS LAST

#### DELETE보다 빠르지만 로그가 남지 않아 돌이킬 수 없는 것은?
	* TRUNCATE

#### FROM 절에 오는 서브쿼리는?
	* 인라인 뷰

#### GROUP BY 할때 사용하는 조건절은?
	* HAVING

#### SELECT CEIL(-2.7) FROM DUAL;의 결과는?
	* -2

#### 날짜형 데이터를 문자형으로 변환하는 함수는?
	* TO_CHAR

#### 계층 쿼리에서 가장 상위 LEVEL의 값은?
	* 1

#### SELECT SUBSTR('NEXT LEVEL', -5, 3) FROM DUAL;의 결과는?
	* LEV

#### 둘 이상의 속성으로 구성된 식별자는?
	* 복합 식별자

#### 주어진 문자열을 대문자로 변환하는 함수는?
	* UPPER

#### SELECT IFNULL(NULL, 'S') FROM DUAL;의 결과는?
	* s

#### 파티션 별로 특정 수만큼 앞선 데이터를 구하는 함수는?
	* LAG

#### 파티션 별 합계에서 차지하는 비율을 구하는 함수는?
	* RATIO_TO_REPORT












