############### Data structure and Variable initialization #####################

# Scalar
integer_var <- 1L # R에서는 정수 형태로 지정하기 위해서는 숫자 뒤에 L을 붙여야 함
double_var <- 0.5
bool_var <- TRUE
character_var <- "apple"

special_var1 <- NULL
special_var2 <- NA
special_var3 <- NaN
special_var4 <- Inf


typeof(integer_var)
typeof(double_var)
typeof(bool_var)
typeof(character_var)

typeof(special_var1)
typeof(special_var2)
typeof(special_var3)
typeof(special_var4)

# Vector
num_vector <- c(1, 2, 3) #숫자형 벡터
num_vector2 <- c(1:3) # 1 ~ 3까지의 숫자를 넣고 싶을때
chr_vector <- c("a", "b", "c") #문자형 벡터
chr_vector2 <- c("1", "2", "3") #문자형 벡터
log_vector <- c(T, TRUE, FALSE) #논리형 벡터

num_vector
num_vector2
chr_vector
chr_vector2
log_vector

# Categorical data
blood_types <- c(1, 3, 2, 2, 4)
categorized <- factor(blood_types, labels = c("A", "B", "AB", "O")) 
categorized

# Matrix
x <- c(1,2,3,4,5,6)
matrix(x, nrow=3, ncol =2) # 3 X 2 행렬
matrix(x, nrow=2, ncol =3) # 2 X 3 행렬
matrix(x, nrow=2, ncol =3, byrow = T) # 2 X 3 행렬

vector1 <- c(460, 313.4)
vector2 <- c(532, 431.9)
vector3 <- c(122.3, 164.2)

matrix_ex <- matrix(c(vector1, vector2, vector3), nrow = 3, byrow = T)
matrix_ex

# Array
y <- c(1,2,3,4,5,6)
array(y, dim = c(2,2,3)) # 2행 2열의 3차원 배열

# List
list1 <- list(c(1,2,3), "Hello", TRUE)
list1

str(list1)

# DataFrame
ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울", "인천", "대구", "경기", "제주", "서울", "서울", "울산", "광주", "대전")
dataframe_ex <- data.frame(ID, SEX, AGE, AREA)
dataframe_ex

dataframe_ex1 <- data.frame(ID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                            SEX = c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F"),
                            AGE = c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38),
                            AREA = c("서울", "인천", "대구", "경기", "제주", "서울", "서울", "울산", "광주", "대전"))
dataframe_ex1

################################## Indexing ####################################
v1 <- c("Jimmy", "Elton", "Eddie", "Eggsy", "Roger", "Taron")

# Vector indexing
v1[1] # 벡터의 첫 번째 인자
v1[-1] # 벡터의 첫 번째 인자를 제외한 나머지
v1[1:3] # 벡터의 첫 번째 ~ 3번째 인자
v1[c(2,5)] # 벡터의 2 번째 & 5번 째 인자
v1[c(-1.-4)] # 벡터의 첫 번째 & 4번 째 인자를 제외한 나머지

# matrix indexing
matrix1 <- matrix(v1, ncol = 2, nrow = 3)
matrix1

matrix1[4]
matrix1[1,2]
matrix1[1:2, 2] # 2열의 1행 ~ 2행

# array indexing
array1 <- array(v1, dim = c(2,2,3))
array1

array1[1,1,3] # 3차원 행렬의 1행 1열
array1[1,1,1:3] # 1 ~ 3차원 행렬의 1행 1열
array1[-2, 1, 3] # 3차원 행렬의 2행을 제외한 1열

# list indexing
list1 <- list(c(1,2,3), v1)
list1

list1[[1]] # 첫 번째 데이터 유형
list1[[2]] # 두 번째 데이터 유형
list1[[1]][2] # 첫 번째 데이터 유형의 두 번째 인자
list1[[2]][3] # 두 번재 데이터 유형의 세 번째 인자

# dataframe indexing
dataframe_ex

## 숫자 인덱싱
dataframe_ex[1,3] # 1행 3열의 값
dataframe_ex[1,] # 첫 번째 행의 관측치 추출
dataframe_ex[, 1] # 인덱싱으로 열만(ID 변수) 추출
dataframe_ex[3:4, 1:2] # 3~4행의 1~2열의 값 추출

dataframe_ex$ID # 변수명으로 열 추출
dataframe_ex[, "AGE"] # 변수명 인덱싱으로 열 추출

## 조건부 인덱싱
dataframe_ex[dataframe_ex$AGE > 30, ] # 나이 열이 30 이상인 행들만 출력
dataframe_ex[dataframe_ex$AGE > 30, "AREA"] # 나이 열이 30 이상인 사람의 지역 추출
dataframe_ex[dataframe_ex$AGE > 30 & dataframe_ex$SEX =="M", "AREA"] # 나이가 30 이상이고, 남자인 사람의 지역
dataframe_ex[dataframe_ex$AGE > 50 | dataframe_ex$SEX == "F", "AREA"] # 나이가 30 이상이거나, 여자인 사람의 지역

####################### indexing을 통한 값 추가 및 치환 #######################
# Vector
v2 <- c("유빈", "하빈", "준혁")
## 벡터에 값 추가
v2[4] <- "예은"
v2
## 벡터의 값 치환
v2[2] <- "윤영"
v2

# Matrix
matrix1 
## 매트릭스의 값 치환
matrix1[1,1] <- "James"
matrix1[2,] <- c("John", "Henk")
matrix1

# List
list1
## 리스트에 값 추가
list1[[3]] <- c(TRUE, FALSE) # 리스트에 새로운 유형의 데이터 추가
list1[[2]][length(list1[[2]])+1] <- "Henk" # 리스트의 2번째 데이터유형의 데이터에 값 추가
list1

## 리스트의 값 치환
list1[[1]] <- c(4, 5, 6) 
list1[[2]][1] <- "James"
list1

# Array
array1

## 배열의 값 치환
array1[1,1,1] <- "Jimmy" # 값 하나만 변경
array1[1, , 2] <- c("Henk", "James") # 2차원 배열의 1행의 열 변경
array1

array1[,,] <- "Taron" # 모든 차원, 모든 행과 열의 값을 변경
array1

# Dataframe 
dataframe_ex

## 데이터프레임에 새로운 값 추가
dataframe_ex$DISEASE <- c(0,1,0,0,1,0,0,0,1,1) # 새로운 열 추가
dataframe_ex
dataframe_ex[11,] <-c(11, "M", 40, "부산", 0) # 새로운 행 추가
dataframe_ex

## 데이터프레임에 원하는 값 치환
dataframe_ex$AGE[10] <- 90
dataframe_ex[7, 4] <- "충청"
dataframe_ex[4,] <-c(4, "F", 44, "대구", 1) 
dataframe_ex

################################## Operator ###################################
a <- 3
b <- 5

## 산술 연산자
a + b # 더하기
a - b # 빼기
a / b #나누기
a * b # 곱하기
a %/% b #몫
a %% b # 나머지
a ** b # 제곱
a ^ b # 제곱

## 비교 연산자
a > b # 크다
a >= b # 크거나 같다
a < b # 작다
a <= b # 작거나 같다
a == b # 같다
a != b #같지 않다

## 논리 연산자
x <- 1:3
y <- 3:1

(x > 0) & (y > 1)
(x < 0) & (y < 1)

# 벡터에서의 연산자
c <- c(1, 2, 3, 4, 5)

c + 10
c > 3

################################### Function ###################################
?max # 함수 검색 / Help 창 확인

## 내장 함수
seq(1, 10, 2) # 1 ~ 10까지 2 간격으로 순서대로 수를 돌려줌
rep(1:3, 3) # 1 ~ 3을 3번 반복
rep(1:3, each=3) # 1 ~ 3의 수를 각각 3번씩 반복

a <- c(1, 2, 3, 4, 5)
max(a) # 최대값 찾기
sum(a) # 합계 구하기
sum(a > 2) # a에서 2보다 큰 수의 개수

### matrix의 행, 열에 이름 붙이기
matrix_ex
row <- c("New Hope", "Jedi returns", "The empire strikes back")
col <- c("US", "Non-US")
rownames(matrix_ex) <- row
colnames(matrix_ex) <- col
matrix_ex

rowSums(matrix_ex) # 행 방향으로 합산
colSums(matrix_ex) # 열 방향으로 합산

last_jedai <- c(338.8, 572.9)
starwars <- rbind(matrix_ex, last_jedai)
world <- rowSums(starwars)
all <- cbind(starwars, world)

all

### Data loading
data <- read.table("states.txt", sep = "/", stringsAsFactors = F, header = T)

### See Data
View(data)
head(data, 3)
tail(data,2)

### Data exploration
str(data)
mode(data)
class(data)
typeof(data)

summary(data)

### Data preprocessing
data[order(data$area_sqm, decreasing= T),] # data의 행을 면적 내림차순으로 정렬
tapply(data$pop_mil, data$Metropolitan, mean) # Metropolitan 여부 별로 인구수 평균 구하기
aggregate(pop_mill ~ Metropolitan, data, FUN = mean) # Metropolitan 여부 별로 인구수 평균 구하기

## 사용자 정의 함수
cube <- function(n){
  return(n*n*n)
}
cube(3)

diff.max.min <- function(...){ # 받은 변수들 중 최대값 - 최소값 계산하기)
  a <-c(...) #받은 변수들을 벡터로 저장
  largest <- max(a)
  smallest <- min(a)
  
  cat(largest - smallest)
}
diff.max.min(6, 4, 23, 6, 25, 5)

### return의 존재 여부 차이
result1 <- cube(3) # return문 있음
result2 <- diff.max.min(6, 4, 23, 6, 25, 5) # return문 없음

result1
result2

## if 문
a<-10
### if-else문으로 짝수 홀수 구분하기
if(a%%2 == 0) {
  print("짝수입니다.") # 조건이 참일때 실행
} else {
    print("홀수입니다.") # 조건이 거짓일때 실행
}

if(a%%2 == 0) {
  print("짝수입니다.") # 조건이 참일때 실행
} 

### if-if else -else문으로 성적 매기기
b <- 80
if (b >=90) {
  print("A 학점입니다.")
} else if (b >= 80) {
  print("B 학점입니다.")
} else {
  print("C 학점입니다.")
}

## 반복문
### for문
for(i in 1:9) { # for문으로 구구단 2단 출력
  a <- 2 * i
  print(a)
}

for(i in 2:9) { # for문으로 구구단 2단~9단 출력
  for(j in 1:9) {
    print(paste(i, "*", j, "=", i*j))
  }
}


### while문
i <- 0
while(i <= 9) {
  print(i)
  i <- i + 1
}

i <- 0
while(i <= 9) { # 만약 조건을 계속 충족하게 되면 무한루프에 빠짐
  print(i)
}

i <- 0
while(i >= 0) { 
  print(i)
  i <- i+1
  if (i == 5) {
    break    
  }
}


## 패키지 함수
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

############################## Data Preprocessing ##############################
# 데이터 로드
data(mtcars)
View(mtcars)

# 데이터 살펴보기
nrow(mtcars)
str(mtcars)

# 데이터 추출하기
## 행 추출하기
### 실린더 개수가 4기통인 자동차를 추출
filter(mtcars, cyl == 4) 
### 6기통 이상인 자동차 중 연비가 20 miles/gallon을 초과하는 자동차 추출
filter(mtcars, cyl >=6 & mpg > 20) 

### 열 추출하기
## 변속기(am)과 기어(gear) 데이터만 추출하기
head(select(mtcars, am, gear))
## 변속기, 기어, 실린더, vs, 무게 데이터 제외한 데이터 추출
head(select(mtcars, -am, -gear, -cyl, -vs, -wt))

# 데이터 정렬하기
### 무게(wt)를 기준으로 오름차순 정렬하여 상위 6개만 보기
head(arrange(mtcars, wt)) 
###연비(mpg)를 기준으로 오름차순 정렬한 후 무게(wt)를 기준으로 내림차순 정렬
head(arrange(mtcars, mpg, desc(wt))) 

# 데이터 추가
## 열 추가
### mtcars 데이터에 years라는 생산일자 열을 추가
head(mutate(mtcars, years = "1974"))
### 자동차별 연비 순위를 rank() 함수로 구해 열 할당
head(mutate(mtcars, mpg_rank = rank(mpg)))

# 중복값 제거
### 실린더 개수(cyl)에 따른 종류와 기어 개수 (gear)에 따른 종류 확인
distinct(mtcars, cyl) # 실린더의 중복값 제거
distinct(mtcars, gear) # 기어의 중복값 제거
distinct(mtcars, cyl, gear) # 기어와 실린더의 중복값 동시 제거

# 그룹별 연산
## mtcars에서 동일한 실린더 개수를 가진 차가 몇 대 있는지 확인
gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n())

## cyl 그룹에서 기어값이 중복인 데이터를 제외한 개수
gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n_distinct(gear))

# 샘플 데이터 추출하기
sample_n(mtcars, 10) # 샘플 10개 추출
sample_frac(mtcars, 0.2) #전체 데이터의 20% 데이터 추출

# 파이프 연산자
group_by(mtcars, cyl) %>% summarise(n())
mutate(mtcars, mpg_rank=rank(mpg)) %>% arrange(mpg_rank)

## carb가 4인 자동차 중 6기통 자동차들만 뽑아 변수에 저장하기
carb4_cyl6_cars <- mtcars %>% filter(carb==4) %>% filter(cyl == 6)
carb4_cyl6_cars

## carb가 4인 자동차 중 6기통 자동차들의 disp와 무게를 더한 total 열 추가하기
carb4_cyl6_cars <- carb4_cyl6_cars %>% mutate(total = disp +wt)
carb4_cyl6_cars

##  manufacturer별 cty의 평균 구하기
mpg %>% group_by(manufacturer) %>% summarise(mean_cty=mean(cty))

## 실습문제
mpg %>%
  group_by() %>% 
  filter() %>% 
  mutate() %>% 
  summarise() %>% 
  arrange() %>% 
  head()


################################ Visualization #################################
# 그래프 기본 틀 그리기
ggplot(mpg, aes(x = hwy, y = displ))

# 산점도 그리기
ggplot(mpg, aes(x = hwy, y = displ)) + geom_point(size = 3, color = "red")
# 선 그래프 그리기
ggplot(mpg, aes(x = hwy, y = displ)) + geom_line(color = "blue")
# 막대 그래프 그리기 
ggplot(mpg, aes(x = drv)) + geom_bar(aes(fill = class), width = 0.5)
# 평균 막대 그래프 그리기
ggplot(mpg, aes(x = drv, y = displ)) + geom_col()
# 히스토그램 그리기
ggplot(mpg, aes(hwy)) + geom_histogram()
# 상자 그림 그리기
ggplot(mpg, aes(x = model, y = displ, group = model)) + geom_boxplot()

# 다양한 옵션 추가
ggplot(mpg, aes(x = model, y = displ, group = model)) + geom_boxplot() + theme(axis.text.x=element_text(angle=45, hjust=1))
                                                                               