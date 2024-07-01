#install.packages('jpeg')
library(jpeg)
img <- readJPEG('jadu.jpeg')
class(img)
dim(img)
R <- img[,,1] # 인덱스 순서는 가로,세로,차원 이라서
G <- img[,,2]
B <- img[,,3]

# center는 표준화인데 우리는 이미지를 다시 합칠거기 때문에 표준화시키지
# 않는다 따라서 f 표준화 시키면 데이터 중심 값이 0이 되어버린다
img.R.pca <- prcomp(R,center = F)
img.G.pca <- prcomp(G,center = F)
img.B.pca <- prcomp(B,center = F)

# 분리시킨거 다시 합치기
RGB.pca <- list(img.R.pca,img.G.pca,img.B.pca)
RGB.pca

# 축소할 차원의 수 정하기
pca.value <- c(2,10,50,100,300) # 축소할 차원 수

for (i in pca.value){
  pca.img <- sapply(RGB.pca,function(j){
    compressed.img <- j$x[,1:i] %*% t(j$rotation[,1:i])
  }, simplify = 'array')
  writeJPEG(pca.img, paste('jaduimg', i, '.jpeg',sep = ''))
}

img2 <- readJPEG('summer.jpeg')
class(img2)
dim(img2)

R2 <- img2[,,1]
G2 <- img2[,,2]
B2 <- img2[,,3]

img.R2.pca2 <- prcomp(R2,center = F)
img.G2.pca2 <- prcomp(G2,center = F)
img.B2.pca2 <- prcomp(B2,center = F)

RGB.pca2 <- list(img.R2.pca2,img.G2.pca2,img.B2.pca2)

for (i in pca.value){
  pca.img2 <- sapply(RGB.pca2,function(j){
    compressed.img <- j$x[,1:i] %*% t(j$rotation[,1:i])
  }, simplify = 'array')
  writeJPEG(pca.img2, paste('summerimg',i,'.jpeg',sep = ''))
}


# 1888년 스위스 내 47개주의 사회경제지표와 출산률
data('swiss')
head(swiss)
str(swiss)

# 정규화 (시험 꼭 출제)
Min <- apply(swiss, 2, min)
Max <- apply(swiss, 2, max)
# 변수값들의 단위가 다 다르기 때문에 정규화를 시켜줘야 함
swiss_new <- scale(swiss, center = Min, scale = (Max-Min))
# center 평균 scale 분산. 각각 T로 두면 표준정규화를 시켜 평균0 분산1을 만든다
head(swiss_new)

# 정규화2 (사용자 정의 함수)
normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
swiss_new2 <- normalize(swiss)
tail(swiss_new2)

# 요인분석
factanal(swiss_new,factors = 3)

admin <- read.csv('Admission.csv')
str(admin)
head(admin)
sum(is.na(admin))
colSums(is.na(admin)) # 열마다 결측치 확인
# 정규화
Min2 <- apply(admin,2,min)
Max2 <- apply(admin,2,max)
admin_new <- scale(admin,center = Min2, scale = (Max2-Min2))
admin_new

#
normal <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
admin_new <- normal(admin[,1:7]) # 입학 확률에 관한 것을 보는 것이기 때문에 8열은 빼준다
head(admin_new)

pairs(admin)
pairs(admin,panel = panel.smooth)
# 주성분 분석 (정규화 시켜준 걸 가지고 분석)
admin_pca <- princomp(admin_new,cor=T,scores=T)
summary(admin_pca)
plot(admin_pca,type='l') # 주성분 3개로 설정
biplot(admin_pca,scale=0)
# 수평인게 제일 영향력이 높다 CGPA(내신성적)이 젤 영향력이 많다는 걸 알 수 있다
admin_pca$loadings # 고유행렬 확인 (biplot과 비교)

#요인분석
factanal(admin_new,factors = 3)
# 7개의 데이터를 3개의 factor로 하니까 전체의 75퍼센트를 설명할 수 있다는 뜻



admin.pca <- prcomp(admin_new,center = T,scale. = T)
summary(admin.pca)

admin.pca$rotation

head(admin.pca$x)

plot(admin.pca,type='l')

head(admin.pca$x[,1:2])

biplot(admin.pca,scale=0)

