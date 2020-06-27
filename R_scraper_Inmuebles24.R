library(stringr)
library(dplyr)
install.packages("rvest")
library(rvest)

marketwatch <- read_html(
  "https://www.inmuebles24.com/departamentos-en-venta-en-distrito-federal.html"
)

marketwatch %>% 
  html_node("title") %>% 
  html_text()

makeDF <-function() {
  location <- marketwatch %>% 
  html_nodes("span.posting-location.go-to-posting") %>% 
  html_text() %>% 
  str_squish() 
  
  price <- marketwatch %>% 
    html_nodes("div.posting-price-container.go-to-posting") %>% 
    html_text() %>% 
    str_squish()
  
   return(df <- data.frame(price, location))
}

myData <- makeDF()
View(myData)