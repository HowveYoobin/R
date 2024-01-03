# Data type, structure, and Variable initialization

## Scalar
integer_var <- 1L # R에서는 정수 형태로 지정하기 위해서는 숫자 뒤에 L을 붙여야
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

## Vector
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

## Categorical data
blood_types <- c(1, 3, 2, 2, 4)
categorized <- factor(blood_types, labels = c("A", "B", "AB", "O")) 
categorized

## Matrix
x <- c(1,2,3,4,5,6)
matrix(x, nrow=3, ncol =2) # 3 X 2 행렬
matrix(x, nrow=2, ncol =3) # 2 X 3 행렬
matrix(x, nrow=2, ncol =3, byrow = T) # 2 X 3 행렬

vector1 <- c(460, 313.4)
vector2 <- c(532, 431.9)
vector3 <- c(122.3, 164.2)

matrix1 <- matrix(c(vector1, vector2, vector3), nrow = 3, byrow = T)
matrix1

row <- c("New Hope", "Jedi returns", "The empire strikes back")
col <- c("US", "Non-US")
rownames(matrix1) <- row
colnames(matrix1) <- col
matrix1

## Array
y <- c(1,2,3,4,5,6)
array(y, dim = c(2,2,3)) # 2행 2열의 3차원 배열

## list
list1 <- list(c(1,2,3), "Hello", TRUE)
list1

str(list1)

## DataFrame
ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울", "인천", "대구", "경기", "제주", "서울", "서울", "울산", "광주", "대전")

dataframe_ex <- data.frame(ID, SEX, AGE, AREA)
dataframe_ex

# Indexing
v1 <- c("Jimmy", "Elton", "Eddie", "Eggsy", "Roger", "Taron")

## Vector indexing
v1[1] # 벡터의 첫 번째 인자
v1[-1] # 벡터의 첫 번째 인자를 제외한 나머지
v1[1:3] # 벡터의 첫 번째 ~ 3번째 인자
v1[c(2,5)] # 벡터의 2 번째 & 5번 째 인자
v1[c(-1.-4)] # 벡터의 첫 번째 & 4번 째 인자를 제외한 나머지

## matrix indexing
matrix1 <- matrix(v1, ncol = 2, nrow = 3)
matrix1

matrix1[4]
matrix1[1,2]
matrix1[1:2, 2] # 2열의 1행 ~ 2행

## array indexing
array1 <- array(v1, dim = c(2,2,3))
array1

array1[1,1,3] # 3차원 행렬의 1행 1열
array1[1,1,1:3] # 1 ~ 3차원 행렬의 1행 1열
array1[-2, 1, 3] # 3차원 행렬의 2행을 제외한 1열

## list indexing
list1 <- list(c(1,2,3), v1)
list1

list1[[1]] # 첫 번째 데이터 유형
list1[[2]] # 두 번째 데이터 유형
list1[[1]][2] # 첫 번째 데이터 유형의 두 번째 인자
list1[[2]][3] # 두 번재 데이터 유형의 세 번째 인자

## dataframe indexing
dataframe_ex

### 숫자 인덱싱
dataframe_ex[1,3] # 1행 3열의 값
dataframe_ex[1,] # 첫 번째 행의 관측치 추출
dataframe_ex[, 1] # 인덱싱으로 열만(ID 변수) 추출
dataframe_ex[3:4, 1:2] # 3~4행의 1~2열의 값 추출

dataframe_ex$ID # 변수명으로 열 추출
dataframe_ex[, "AGE"] # 변수명 인덱싱으로 열 추출

### 조건부 인덱싱
dataframe_ex[dataframe_ex$AGE > 30, ] # 나이 열이 30 이상인 행들만 출력
dataframe_ex[dataframe_ex$AGE > 30, "AREA"] # 나이 열이 30 이상인 사람의 지역 추출
dataframe_ex[dataframe_ex$AGE > 30 & dataframe_ex$SEX =="M", "AREA"] # 나이가 30 이상이고, 남자인 사람의 지역
dataframe_ex[dataframe_ex$AGE > 50 | dataframe_ex$SEX == "F", "AREA"] # 나이가 30 이상이거나, 여자인 사람의 지역

## indexing을 통한 값 추가 및 치환
v2 <- c("유빈", "하빈", "준혁")
v2[4] <- "예은" # 값 추가
v2

v2[2] <- "윤영" # 값 치환
v2


