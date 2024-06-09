# Git 쓸때 알야아 하는 것들
> git 쓰면서 자주 사용한다 싶은것들 모아놓음

### 1. git 데이터 땡겨오기

```
git init
git remote add origin (해당 repository 위치 .git)

git pull origin (브랜치)



```

* git clone 을 사용해도 좋지만 pull로 땡겨오면 나중에 branch 꼬일일이 없음.

### 2. git push 하기

```
git init
git status
git add (파일)
git commit -m "커밋내용"

git push origin (브랜치)


```

### git commit 취소하기
push는 하지않고 commit을 변경하고 싶을 때 사용

```
git reset --soft HEAD^
```

### git push 취소하기

#### 가장 최근의 commit을 취소한다.
```
git log
git reset HEAD^
```
#### 원하는 시점으로 워킹 디렉토리를 되돌린다.

```
git reflog 또는 git log -g
git reset HEAD@{number} 또는 git reset [commit id]
```
#### 되돌려진 상태에서 다시 commit 한다

```
git commit -m "message"
```

#### 원격 저장소에 강제로 push한다.

```
git push -f origin [branch name]
```
