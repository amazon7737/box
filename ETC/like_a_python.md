# 파이썬스럽게
> 파이썬 언어로 코딩테스트를 준비하기 위해서 공부했던 파이썬에 라이브러리 / 함수들을 정리하였습니다.



* 시간 복잡도 계산방법
* for 

* while

```python

treeHit = 0
while treeHit < 10: 
# 나무가 10보다 작은 상태라면 . 계속 실행해라 근데 10 보다 크다면 멈춰.
	treeHit = treeHit + 1
	print("나무를 %d번 찍었습니다." % treeHit)
	if treeHit == 10:
		print("나무 넘어갑니다.")

```

* 경우의 수 -> dp

### 내장함수
* sum()
* max()
* min()
* eval()
* sorted() / + lambda
* ord()/chr()
* replace()
* strip()
* join
* split
* round()
* isalpha()/isalnum()
* lower
* upper
* find
* count
* enumerate
* swap
* isdecimal()/isnumeric()
* isdigit()
* caplitalize()
* import re (re.sub)
* import os (..)
* list 내장함수
	* append
	* insert
	* remove
	* pop
	* index
	* reverse
	* clear
	* del

* ord() / chr()
```python

ord('a')
# >>> 97 문자열 -> 아스키

chr(65)
# >>> A 아스키 -> 문자열

```


* replace
```python
txt = "I like bananas"

x = txt.replace("bananas", "apples")

print(x)



```


```python

text = """
abcdef
ghijklm
"""

text.replace("\n","")

# abcdefghijklm
```

* strip()
```python

# len(i.strip()) == 0 # 시작 , 끝 부분의 공백을 다없애도 아무것도 없으면

# 

'www.example.com'.strip('w').strip('')
txt = "   banana   "
x = txt.strip()
print("of all fruits", x, "is my favorite", x , x)


```

* import re

```python
import re

re.sub(치환하고 싶은 문자열 (정규표현), 새로운 문자열 (정규 표현), 대상변수 [, 치환횟수])

import re

text = "abc123def456ghi"
new_text = re.sub(r"[a-z]", "", text) # 문자 a 부터 z 까지 있는거 다거르기
new_text2 = re.sub(r"[1-9]", "", text)
print(new_text)
print(new_text2)

```


* join -> 문자열 합치기

```python

arr = ["김", "강", "민"]

print(''.join(arr))


```


* sum()
```python

reulst = sum([1, 2, 3,4,5])
print(result)
```

* min()
```python
result = min(7,3,5,2)
print(result)
```

* max()
```python
result = max(7,3,5,2)
print(result)
```

* eval()
```python
result = eval("(3+5) * 7")
print(result)
```

* sorted()
=> 리스트에 튜플이 원소로 있을때, 이를 튜플의 두 번째 원소를 기준으로 내림차순 정렬하는 예시

```python
result = sorted([('박성재', 27), ('김프론', 33), ('이서버', 42)], key = lambda x: x[1], reverse = True)
print(result)

result = sorted([9 , 1, 8 ,5 , 4])
print(result)
result = sorted()
print(result)

result = sorted([('홍길동', 35), ('이순신',75 ), ('아무개', 50)],
key = lambda x: x[1], reverse = True)
print(result)

data = [9, 1, 8, 5, 4]
data.sort()
print(data)

```

* split()
```python
a = 'i have a apple'
print(a.split())
```

* round()
```python
# round : 반올림을 수행, 두번째 매개변수로 반올림할 소숫점 위치를 결정할 수 있다.
print(round(123.456)) # 첫째자리 반올림 이후 숫자늘수록 뒷자리 쭉~
```


* isalpha() / isalnum()

```python

text1 = 'abcd'
text1.isalpha()
# >>> True

# 문자만 판단
# 숫자나 띄어쓰기? 들어가있으면 false 로 반환하는 함수
ex1 = 'A'
ex2 = 'ABC'
ex3 = '앱피아'
ex4 = "Hello Appia"
ex5 = "100Appia"

print(ex1.isalpha())
print(ex2.isalpha())
print(ex3.isalpha())
print(ex4.isalpha())
print(ex5.isalpha())

# -- 


text2 = 1234
text2.isalnum()
# >>> True

# 띄어쓰기나 .이 있으면 false를 반환하는 함수
ex1 = "안녕"

ex2 = "Hello3"

ex3 = "1.Where"

ex4 = "1 Where"

print(ex1.isalnum())
print(ex2.isalnum())
print(ex3.isalnum())
print(ex4.isalnum())

```

* filter( 조건 함수, 순회 가능 데이터)
```python
# filter 는 일부의 데이터만 추려낼 때 사용하는 함수임! 특히 출력을 filter 자료형으로 하기 때문에, 출력 값에 list를 씌워줘야함 !

string = '0001100'
res = list(filter(lambda x: string[x] == '0', range(len(string))))
# >>> [0, 1, 2, 5, 6]

```

* 문자열 내장함수

```python
# lower

s = "HapPineSS"
# 소문자 casting 된 문자열 반환
print(s.lower()) # happiness
print(s) # HapPineSS
```

```python
# upper

# 대문자 casting 된 문자열 반환
print(s.upper())


```

```python
# find

# "s" 가 위치한 index 찾기
# 여러 개일 경우 가장 앞쪽 index

print(s.find("s")) # 7
```

```python

# count
# 문자열 내의 "s" 의 개수
print(s.count("s"))
```

* 리스트 내장함수

```python
# append

a = [1, 2, 3, 4, 5]

# insert : i 번 인덱스에 v 추가
a.insert(3, 7)

# pop
a.pop() # 마지막 원소 꺼내기

# remove(효율성 x)
#a.remove(v) : v 값을 찾아서 제거
a.remove(4)

# index

 a.index(v) : v 가 리스트의 몇 번째 index에 있는지 반환

# reverse

a = [1, 3, 2, 7, 5]

# 리스트 원소 순서 뒤집기

a.reverse() # [5, 7, 2, 3, 1]

# clear

a.clear() # 빈 리스트로 만들기


```

```python
# enumerate

a = [12, 19, 34, 21, 50]

for x in enumerate(a):
	print(x)
for x in enumerate(a):
	print(x[0], x[1])

for i, val in enumerate(a):
	print(i, val)
	
```

```python
a = [11, 12, 42, 38 ,7]
# all (iterable 리스트, 튜플, 딕셔너리 등)
# 모든 요소가 참이면 True, 하나라도 거짓이면 False

a = [11, 12, 42, 38, 7]
if all(60 > x for x in a):
	print("모든 원소가 60 미만입니다")

# all (iterable 리스트, 튜플, 딕셔너리 등)
# 요소가 하나라도 참이라면 True, 전부 거짓이면 False
if any(10 > x for x in a):
	print("20미만인 원소가 존재합니다.")


```

* 2차원 리스트

```python

array = [[0] * n for _ in range(n)]
```

* swap

```python
a, b = b, a
```

* isdecimal(), isnumeric()

```python
a="3"
print(a.isdecimal())
print(a.isnumeric())
# False (decimal)
# True

```

* isdigit()
```python
# 숫자인지 확인하기
# 숫자 이외에 다른것이 있으면 무조건 false 반환

ex1 = "010-1234-5678"
ex2 = "123456"
ex3 = "R4R3"

print(ex1.isdigit())
print(ex2.isdigit())
print(ex3.isdigit())

```


* Capitalize()
```python
# Calpitalize 내장함수를 사용하면 첫 문자가 알파벳일 경우 대문자로 만들고
# 두번째 문자부터는 자동으로 소문자로 만든다
# 첫 문자가 알파벳이 아니면 그대로 리턴
def solution(s):
	answer = ''
	s = s.split(' ')
	for i in range(len(s)):
		s[i] = s[i].capitalize()
	answer = ' '.join(s)
	return answer

txt = "hello, and welcome to my world."
print(txt.capitalize())

```

-----

## itertools 라이브러리

* permutaions: 순열
* combinations : 조합
* product: 중복 허용 순열
* combinations_with_replacement: 중복 허용 조합

-permutaions
```python
from itertools import permutations

data = ['A', 'B', 'C']
result = list(permutaions(data, 3))

print(result)
```

-combinations
```python
from itertools import combinations

data = ['A', 'B', 'C']
result = list(combinations(data, 2))
print(result)


```

-product
```python
from itertools import product

data = ['A', 'B', 'C']
result = list(product(data, repeat = 2))

print(result)
```

-combinations_with_replacement
```python
from itertools import combinations_with_replacement

data = ['A', 'B', 'C']
result = list(combinations_with_replacement(data, 2))

print(result)

```

## heapq 라이브러리
 
```python
# 힙 정렬 heapq로 구현하는 예제

import heapq

def heapsort(iterable):
	h = []
	result = []
	
	# 모든 원소를 차례대로 힙에 삽입
	for value in iterable:
		heapq.heappush(h, value)

	# 힙에 삽입된 모든 원소를 차례대로 꺼내어 담기
	for i in range(len(h)):
		result.append(heapq.heappop(h))

	return result

result = heapsort([1, 3, 5, 7, 9, 2, 4, 6, 8, 0])
print(result)
		

```

```python
# 최대 힙 구현하여 내림차순 힙 정렬 구현
import heapq

def heapsort(iterable):
	h = []
	result = []

	for value in iterable:
		heapq.heappush(h, -value)

	for i in range(len(h)):
		result.append(-heapq.heappop(h))
	return result
	
result = heapsort([1, 3, 5, 7, 9, 2, 4, 6, 8, 0])

print(result)

```

## bisect 라이브러리

```python
from bisect import bisect_left, bisect_right

a = [1, 2, 4, 4, 8]
X = 4

print(bisect_left(a, X))
print(bisect_right(a, X))

```

```python
# 정해진 범위에 해당하는 수 개수 구하기

import bisect

def count_bi(nums, left_value, right_value):
	ri = bisect.bisect(nums,right_value)
	li = bisect_left(nums, left_value)

	return ri - li

nums = [-1, -3, 5, 5, 4, 7, 1, 7, 2, 5, 6]
nums.sort() # 정렬은 필수 

print(count_bi(nums, 5, 7)) #5 ~ 7 에 있는 수의 개수 구하기

```

```python

# 이진탐색을 도와주는 함수
import bisect

result = []
scores = [33, 99, 77, 70, 89, 90, 100] # 애들이 받은 점수
grades = [60, 70, 80, 90] # 기준점수를 등급으로 바꿔주자

for score in scores:
    pos = bisect.bisect(grades, score)
    print(pos)
    grade = 'FDCBA'[pos]
    result.append(grade)
    


```

```python

# bisect의 push함수
import bisect
a = [60, 70, 80, 90]

# insert와 비슷한 역할 정렬이 될 수 있는 위치를 자동으로 찾아서 들어간다
bisect.insort(a, 85)
print(a)


```


```python
# <활용>
# '정렬된 리스트'에서 값이 특정 범위에 속하는 원소의 개수를 구하고자 할때, 효과적으로 사용됨

from bisect import bisect_left, bisect_right

#값이 [left_value, right_value]인 데이터의 개수를 반환하는 함수
def count_by_range(a, left_value, right_value):
	right_index = bisect_right(a, right_value)
	left_index = bisect_left(a, left_value)
	return right_index - left_index
	
# 리스트 선언
a = [1, 2, 3, 3, 3, 3, 4, 4,8,9]

# 값이 4인 데이터 개수 출력
print(count_by_range(a, 4, 4)) # >>> 2

# 값이 [-1, 3] 범위에 있는 데이터 개수 출력
print(count_by_range(a, -1, 3)) # >>> 6
```

## collections 라이브러리

#### deque 활용 예시 소스코드

```python
# deque
from collections import deque

data = deque([2, 3, 4])
data.appendleft(1)
data.append(5)

print(data) # >>> deque([1, 2, 3, 4, 5])
print(list(data)) # >>> [1, 2, 3, 4, 5]
```

#### Counter 활용 예시 소스코드
```python
# Counter

from collections import Counter

counter = Counter(['red', 'blue', 'red', 'green', 'blue', 'blue'])

print(counter['blue']) # >>> 3
print(counter['green']) # >>> 1
print(dict(counter)) # >>> {'red' : 2, 'blue':3, 'green': 1}
```

### math 라이브러리
```python
#factorial

import math
print(math.factorial(5))

# sqrt

print(math.sqrt(7))

#gcd(a, b) #최대 공약수
print(math.gcd(21, 14))

print(math.pi)

print(math.e)

# gcd를 활용한 최소 공배수 구하기
num1=2
num2=3
print(num1*num2 // math.gcd(num1, num2))

```

------------------------
#### 기타 라이브러리 

* reduce()

```python

from functools import reduce

def sum(a, b):
	print(f"[a = {a}, b = {b}] sum = {a} + {b} = {a+b}")
	return a + b

numbers = [1, 2, 3 ,4 ,5]
total = reduce(sum, numbers)
print(f"total = {total}")

```

```python
# reduce 와 lambda
from functools import reduce

numbers = [1, 2, 3, 4, 5]
total = reduce(lambda a, b:a+b, numbers)
print(f"total = {total}")

```

```python
# reduce() 로 최대 값 계산

from functools import reduce

def max(a, b):
	if a > b:
		return a
	else:
		return b

numbers = [10, 21, 421, 223, 52]
max_value = reduce(max, numbers)
print(f"max_value = {max_value}")

```

```python
# lambda 와 reduce() 로 최대 값 계산

from functools import reduce

numbers = [10, 21, 421, 223, 52]
max_value = reduce(lambda a, b:a if a > b else b, numbers)
print(f"max_value = {max_value}")

```

------


## 람다 특수 사용

```python
# 기본적으로 lambda 안에 함수를 탑재할 수 있다.
# 람다(lambda) 함수: 익명으로 만드는 함수 , 별도의 def로 사용자 정의 함수를 만들지 않고 작업을 수행하는 익명 함수이다.

lambda 인자1, 인자2, ...., 인자n: 코드

# lambda 예제

def add(a, b):
	return a + b

print("1과 2의 합은 ", add(1, 2), "이다.")
# 1과 2의 합은 3이다.

# lambda를 이용한 방법
print("1과 2의 합은", (lambda a, b: a+b)(1, 2), "이다.")
# 1과 2의 합은 3이다.




```

--------

## 딕셔너리 (해시)

```python
dict_ = {1:'hello1', 2:'hello2'}

dict_[3] = "nothing"

# 값을 가져오고 싶을때
dict_[1]

# 딕셔너리 get
# key 가 없는 경우엔 무시하고 넘어가고
# key 가 있을때는 value를 가져온다.
dict_.get(10)
dict_.get(2)

# 딕셔너리 keys, values, in , items

dict_.keys()

1 in dict_.keys()
# => True

# dict_ 리스트형으로 만든다

dict_.values()

'hello1' in dict_.values()
# => True

dict_.items()

# key 와 value를 쌍으로 이뤄진 튜플을 보여준다.

(1, 'hello1') in dict_.items()
# => True





```

### Get
```python

# [] 기호 사용해 원소 가져오기
dict = {'하이': 300, '헬로': 180, 3:5}
dict['헬로'] # 180

```

```python
# Get 메소드를 이용해 원소 가져오기 1
# 딕셔너리에 해당 key가 없을때 Key Error 를 내는 대신, 특정한 값을 가져온다.

dict = {'하이' : 300, '헬로': 180}
dict.get('동동', 0) # 0
# 만약 값이없다면 0으로 출력해라 라는 것.

```

```python

# Get 메소드를 이용해 원소 가져오기 2
# 물론, 딕셔너리에 해당 Key 가 있는 경우 대응하는 value 를 가져온다.

dict = {'하이': 300, '헬로': 180}
dict.get('헬로', 0) # 180

```

### Set

```python
# 값 집어넣기

dict = {'김철수':300, 'Anna':180}
dict['홍길동'] = 100
dict # {'Anna':180, '김철수':300, '홍길동':100}

```

```python
# 값 수정하기1

dict = {'김철수':300, 'Anna':180}
dict['김철수'] = 500

dict # {'Anna':180, '김철수':500}

```

```python

# 값 수정하기2
dict = {'김철수':300, 'Anna':180}
dict['김철수'] += 500
dict # {'Anna':180, '김철수':800}

```

### Delete

* Del
* Pop
```python



```

---------

### String Module

```python





```

----
#### 정렬 알고리즘


----


#### DFS / BFS

##### 인접행렬
```python
INF = 999999999

# 2차원 리스트를 이용해 인접행렬 표현
graph = [
		 [0,7,5],
		 [7,0,INF],
		 [5,INF,0]
]
print(graph)

```

##### 인접 리스트
```python
# 행 (Row) 이 3개인 2차원 리스트로 인접 리스트 표현
graph = [[] for _ in range(3)]

# 노드 0에 연결된 노드 정보 저장(노드 , 거리)
graph[0].append((1,7))
graph[0].append((2,5))

# 노드 1에 연결된 노드 정보 저장(노드 , 거리)
graph[1].append((0,7))

# 노드 2에 연결된 노드 정보 저장(노드, 거리)
graph[2].append((0,5))

print(graph)

```

#### DFS

![[Pasted image 20230404111842.png]]

```python

# DSF 메서드 정의
def dfs(graph, v, visited):
    # 현재 노드를 방문 처리
    visited[v] = True
    print(v, end=' ')
    # 현재 노드와 연결된 다른 노드를 재귀적으로 방문
    for i in graph[v]:
        if not visited[i]:
            dfs(graph, i, visited)

# 각 노드가 연결된 정보를 리스트 자료형으로 표현(2차원 리스트)
graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

# 각 노드가 방문된 정보를 리스트 자료형으로 표현
visited = [False] * 9

# 정의된 DFS 함수 호출
dfs(graph, 1, visited)

##  1 2 7 6 8 3 4 5


```

#### BFS

![[Pasted image 20230404111853.png]]

```python

from collections import deque

# BFS 메서드 정의
def bsf(graph, start, visited):
    # 큐(Queue) 구현을 위해 deque 라이브러리 사용
    queue = deque([start])
    # 현재 노드를 방문 처리
    visited[start] = True
    # 큐가 빌 때까지 반복
    while queue:
        # 큐에서 하나의 원소를 뽑아 출력
        v = queue.popleft()
        print(v, end=' ')
        # 해당 원소와 연결된, 아직 방문하지 않은 원소들을 큐에 삽입
        for i in graph[v]:
            if not visited[i]:
                queue.append(i)
                visited[i] = True

# 각 노드가 연결된 정보를 리스트 자료형으로 표현(2차원 리스트)
graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

# 각 노드가 방문된 정보를 리스트 자료형으로 표현(1차원 리스트)
visited = [False] * 9

# 정의된 BFS 함수 호출
bsf(graph, 1, visited)

## 1 2 3 8 7 4 5 6

```

|DFS|BFS|
|------|---|
|스택|큐|
|재귀 함수 이용|큐 자료구조 이용|

#### DFS/BFS 정리

=> 코딩 테스트 중 2차원 배열에서 탐색 문제를 만나면
그래프 형태로 바꿔서 생각하면 풀이 방법이 좋다
탐색 문제보면 그래프 형태로 표현해서 풀이법을 고민해보자.
----


#### 2차원 배열 순회 , 부분 집합(비트 연산) 


----

#### 다익스트라 최단 경로 알고리즘

----

#### 소수 찾기 알고리즘

```python

# O(N ** 0.5) 시간에 동작하는 소수 판별 알고리즘

def isPrime(N):
	if (N <= 1):
		return False
	if (N <= 2):
		return True

	# 2의 배수 (짝수) 제외
	if not (N % 2):
		return False

	# 합성수 N = p * q 일 때, p <= (N ** 0.5) && q >= (N ** 0.5) 이므로,
	# (N ** 0.5) 까지 순회하는 것으로 합성수 판별이 가능하다.
	sqrtn = int(N ** 0.5)

	# 3이상의 홀수로 나누어 판별, 짝수를 제외한 경우에 대해서 판별
	for div in range(3, sqrtn+1, 2):
		if not (N % div):
			return False
	return True

print(isPrime(14))

```

----

#### 에라토스테네스의 체


----
