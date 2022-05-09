install.packages("rvest")

library(rvest)
library(dplyr)

#주토피아 네비어 영화 평점 크롤링
url <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code=130850&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=1"
html <- read_html(url, encoding = 'UTF-8')


#요소 긁어오기
html %>% html_nodes("div.score_reple") %>% html_node("span#_filtered_ment_0") %>% html_text()

#리뷰 가져오기 (1페이지)


rev <- c()
for(i in c(0:9)){
  rev <- c(rev,html %>% html_nodes("div.score_reple") %>% html_node(paste0("span#_filtered_ment_",i)) %>% html_text())
  rev <- rev[!is.na(rev)]
  rev <- gsub('[\r\n\t]',"",rev)
}
rev

#리뷰 가져오기 (1~10페이지)

rev <- c()
for(i in c(1:10)){
  url <- paste0("https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code=130850&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=",i)
  html <- read_html(url, encoding = 'UTF-8')
  for(i in c(0:9)){
    rev <- c(rev,html %>% html_nodes("div.score_reple") %>% html_node(paste0("span#_filtered_ment_",i)) %>% html_text())
    rev <- rev[!is.na(rev)]
    rev <- gsub('[\r\n\t]',"",rev)
  }
}
rev




