# @GeneratedValue

> 수업리뷰사이트 개발 도중 알게된 해당 어노테이션의 역할.

```java
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;


```

위 코드에서 id는 학번을 넣는 Entity였다.
그래서 AutoIncrement 동작 없이 직접 데이터를 넣어야하는 칸이다.

@GeneratedValue의 역할은
"기본키 생성 전략" 이다.

## 각 전략이 무엇이 있는지 알아보자.

> GerationType

```java

package javax.persistence;

/**
 * Defines the types of primary key generation strategies.
 *
 *@seeGeneratedValue
*
 *@since1.0
 */
public enum GenerationType {

/**
     * Indicates that the persistence provider must assign
     * primary keys for the entity using an underlying
     * database table to ensure uniqueness.
     */
TABLE,

/**
     * Indicates that the persistence provider must assign
     * primary keys for the entity using a database sequence.
     */
SEQUENCE,

/**
     * Indicates that the persistence provider must assign
     * primary keys for the entity using a database identity column.
     */
IDENTITY,

/**
     * Indicates that the persistence provider should pick an
     * appropriate strategy for the particular database. The
     *<code>AUTO</code>generation strategy may expect a database
     * resource to exist, or it may attempt to create one. A vendor
     * may provide documentation on how to create such resources
     * in the event that it does not support schema generation
     * or cannot create the schema resource at runtime.
     */
AUTO
}
```

#### TABLE
> 데이터베이스에 키 생성 전용 테이블을 하나 만들고 이를 사용하여 기본키를 생성한다.

```java
package com.example.jwptodolist.todo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "todos")
public class Todo {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private Long id;

    protected Todo() {
    }

    public Todo(final Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}

```


```java
package com.example.jwptodolist.todo.domain;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.time.LocalDateTime;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
class TodoRepositoryTest {

    @Autowired
    private TodoRepository todoRepository;

    @DisplayName("@Id만 있을때 저장 테스트")
    @Test
    void idAnnotationTest() {
        final Todo todo = new Todo(null);

        final Todo save = todoRepository.save(todo);

        assertThat(save.getId()).isEqaulTo(1L);
    }
}

```

```java
create table hibernate_sequences (
       sequence_name varchar(255) not null,
        next_val bigint,
        primary key (sequence_name)
    )

create table todos (
       id bigint not null,
        content varchar(255),
        create_at datetime,
        status varchar(255),
        update_at datetime,
        primary key (id)
    )

```

#### SEQUENCE

> 데이터베이스의 특별한 오브젝트 시퀀스를 사용하여 기본키를 생성한다.

* DB Sequence란 유일한 값을 순서대로 생성하는 특별한 데이터베이스 오브젝트
* 테이블 마다 시퀀스 오브젝트를 따로 관리하고 싶으면 @SequenceGenerator에 sequenceName 속성을 추가한다.

