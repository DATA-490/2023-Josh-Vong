library(rvest)
library(dplyr)
library(foreach)

# Write a function to take in arguments, paste 0 str_c
# foreach package, store in vector or data frame

skip = 0
cub_meats_data = data.frame()
for(page_result in seq(from = 1, to = 13, by = 1)){
  
  cub_meat_link = paste0("https://www.cub.com/sm/pickup/rsid/1612/categories/meat-%26-seafood/meat-id-160600?page=",
                        page_result,"&skip=", skip)
  
  page = read_html(cub_meat_link)
  
  name = page %>% html_nodes(".bdDYJz")  %>% html_text()
  price = page %>% html_nodes(".ProductCardPrice--xq2y7a") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  cub_meats_data = rbind(cub_meats_data, data.frame(name,price))
}

meat <- rep("meat",nrow(cub_meats_data))
cub_meats_data <- cbind(meat,cub_meats_data)
colnames(cub_meats_data)[1] <- "category"
# Cub Bread section

skip_bread = 0
cub_bread_data = data.frame()
for(page_result in seq(from = 1, to = 18, by = 1)){
  
  cub_bread_link = paste0("https://www.cub.com/sm/pickup/rsid/1612/categories/bread-%26-bakery/breads-buns-%26-rolls-id-040300?page=",
                         page_result,"&skip=", skip_bread)
  
  page = read_html(cub_bread_link)
  
  name = page %>% html_nodes(".bdDYJz")  %>% html_text()
  price = page %>% html_nodes(".ProductCardPrice--xq2y7a") %>% html_text()
  
  skip_bread <- skip_bread + 30
  
  print(paste("Page:", page_result))
  
  cub_bread_data = rbind(cub_bread_data, data.frame(name,price))
}

bread <- rep("bread",nrow(cub_bread_data))
cub_bread_data <- cbind(bread,cub_bread_data)
colnames(cub_bread_data)[1] <- "category"

# Cub Egg section
skip_eggs = 0
cub_egg_data = data.frame()
for(page_result in seq(from = 1, to = 2, by = 1)){
  
  cub_egg_link = paste0("https://www.cub.com/sm/pickup/rsid/1612/categories/dairy-%26-eggs/eggs-%26-egg-substitutes-id-070600?page=",
                          page_result,"&skip=", skip_eggs)
  
  page = read_html(cub_egg_link)
  
  name = page %>% html_nodes(".bdDYJz")  %>% html_text()
  price = page %>% html_nodes(".ProductCardPrice--xq2y7a") %>% html_text()
  
  skip_eggs <- skip_eggs + 30
  
  print(paste("Page:", page_result))
  
  cub_egg_data = rbind(cub_egg_data, data.frame(name,price))
}

eggs <- rep("eggs",nrow(cub_egg_data))
cub_egg_data <- cbind(eggs,cub_egg_data)
colnames(cub_egg_data)[1] <- "category"

# Cub Milk section
skip_milk = 0
cub_milk_data = data.frame()
for(page_result in seq(from = 1, to = 8, by = 1)){
  
  cub_milk_link = paste0("https://www.cub.com/sm/pickup/rsid/1612/categories/dairy-%26-eggs/milk-%26-milk-substitutes-id-070800?page=",
                        page_result,"&skip=", skip_milk)
  
  page = read_html(cub_milk_link)
  
  name = page %>% html_nodes(".bdDYJz")  %>% html_text()
  price = page %>% html_nodes(".ProductCardPrice--xq2y7a") %>% html_text()
  
  skip_milk <- skip_milk + 30
  
  print(paste("Page:", page_result))
  
  cub_milk_data = rbind(cub_milk_data, data.frame(name,price))
}

dairy <- rep("dairy",nrow(cub_milk_data))
cub_milk_data <- cbind(dairy,cub_milk_data)
colnames(cub_milk_data)[1] <- "category"

# Cub vegetables section
skip_vegetables = 0
cub_vegetables_data = data.frame()
for(page_result in seq(from = 1, to = 9, by = 1)){
  
  cub_vegetables_link = paste0("https://www.cub.com/sm/pickup/rsid/1612/categories/fruits-%26-vegetables/vegetables-id-121300?page=",
                         page_result,"&skip=", skip_vegetables)
  
  page = read_html(cub_vegetables_link)
  
  name = page %>% html_nodes(".bdDYJz")  %>% html_text()
  price = page %>% html_nodes(".ProductCardPrice--xq2y7a") %>% html_text()
  
  skip_vegetables <- skip_vegetables + 30
  
  print(paste("Page:", page_result))
  
  cub_vegetables_data = rbind(cub_vegetables_data, data.frame(name,price))
}

produce <- rep("produce",nrow(cub_vegetables_data))
cub_vegetables_data <- cbind(produce,cub_vegetables_data)
colnames(cub_vegetables_data)[1] <- "category"

# cub fruits section
skip_fruits = 0
cub_fruits_data = data.frame()
for(page_result in seq(from = 1, to = 9, by = 1)){
  
  cub_fruits_link = paste0("https://www.cub.com/sm/pickup/rsid/1612/categories/fruits-%26-vegetables/fruits-id-120500?page=",
                               page_result,"&skip=", skip_fruits)
  
  page = read_html(cub_fruits_link)
  
  name = page %>% html_nodes(".bdDYJz")  %>% html_text()
  price = page %>% html_nodes(".ProductCardPrice--xq2y7a") %>% html_text()
  
  skip_fruits <- skip_fruits + 30
  
  print(paste("Page:", page_result))
  
  cub_fruits_data = rbind(cub_fruits_data, data.frame(name,price))
}

produce <- rep("produce",nrow(cub_fruits_data))
cub_fruits_data <- cbind(produce,cub_fruits_data)
colnames(cub_fruits_data)[1] <- "category"

final_cub_data <- rbind(cub_meats_data,cub_bread_data,cub_bread_data,cub_egg_data,cub_milk_data,cub_fruits_data,cub_vegetables_data)

date <- rep("03-3-23",nrow(final_cub_data))
final_cub_data <- cbind(date,final_cub_data)
colnames(final_cub_data)[4] <- "date"


# ////////////////////////////////////////////////////////////////////////////////////////////////////
# Shoprite store

shoprite_meat_link = "https://www.shoprite.com/sm/pickup/rsid/3000/categories/meat/beef-id-519883"
page = read_html(shoprite_meat_link)

name = page %>% html_nodes(".efUpUY")  %>% html_text()
price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()



skip = 0
shoprite_meats_data = data.frame()
for(page_result in seq(from = 1, to = 8, by = 1)){
  
  shoprite_meat_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/meat/beef-id-519883?page=",
                         page_result,"&skip=", skip)
  
  page = read_html(shoprite_meat_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_meats_data = rbind(shoprite_meats_data, data.frame(name,price))
}

meat <- rep("meat",nrow(shoprite_meats_data))
shoprite_meats_data <- cbind(meat,shoprite_meats_data)
colnames(shoprite_meats_data)[1] <- "category"

# Chicken shoprite
skip = 0
shoprite_meats_chicken_data = data.frame()
for(page_result in seq(from = 1, to = 4, by = 1)){
  
  shoprite_meat_chicken_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/meat/chicken-id-519882?page=",
                              page_result,"&skip=", skip)
  
  page = read_html(shoprite_meat_chicken_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_meats_chicken_data = rbind(shoprite_meats_chicken_data, data.frame(name,price))
}

meat <- rep("meat",nrow(shoprite_meats_chicken_data))
shoprite_meats_chicken_data <- cbind(meat,shoprite_meats_chicken_data)
colnames(shoprite_meats_chicken_data)[1] <- "category"

# shoprite pork
skip = 0
shoprite_meats_pork_data = data.frame()
for(page_result in seq(from = 1, to = 4, by = 1)){
  
  shoprite_meat_pork_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/meat/pork-id-519887?page=",
                                      page_result,"&skip=", skip)
  
  page = read_html(shoprite_meat_pork_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_meats_pork_data = rbind(shoprite_meats_pork_data, data.frame(name,price))
}

meat <- rep("meat",nrow(shoprite_meats_pork_data))
shoprite_meats_pork_data <- cbind(meat,shoprite_meats_pork_data)
colnames(shoprite_meats_pork_data)[1] <- "category"


# shoprite bread
skip = 0
shoprite_bread_data = data.frame()
for(page_result in seq(from = 1, to = 2, by = 1)){
  
  shoprite_bread_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/packaged-bread/all-other-id-519963?page=",
                              page_result,"&skip=", skip)
  
  page = read_html(shoprite_bread_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_bread_data = rbind(shoprite_bread_data, data.frame(name,price))
}

bread <- rep("bread",nrow(shoprite_bread_data))
shoprite_bread_data <- cbind(bread,shoprite_bread_data)
colnames(shoprite_bread_data)[1] <- "category"

# shoprite eggs
skip = 0
shoprite_eggs_data = data.frame()
for(page_result in seq(from = 1, to = 2, by = 1)){
  
  shoprite_eggs_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/dairy/eggs-%26-egg-substitutes-id-520591?page=",
                               page_result,"&skip=", skip)
  
  page = read_html(shoprite_eggs_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_eggs_data = rbind(shoprite_eggs_data, data.frame(name,price))
}

eggs <- rep("eggs",nrow(shoprite_eggs_data))
shoprite_eggs_data <- cbind(eggs,shoprite_eggs_data)
colnames(shoprite_eggs_data)[1] <- "category"

# shoprite milk
skip = 0
shoprite_milk_data = data.frame()
for(page_result in seq(from = 1, to = 4, by = 1)){
  
  shoprite_milk_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/dairy/milk-id-520592?page=",
                              page_result,"&skip=", skip)
  
  page = read_html(shoprite_milk_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_milk_data = rbind(shoprite_milk_data, data.frame(name,price))
}

milk <- rep("milk",nrow(shoprite_milk_data))
shoprite_milk_data <- cbind(milk,shoprite_milk_data)
colnames(shoprite_milk_data)[1] <- "category"


# shoprite vegetables
skip = 0
shoprite_vegetables_data = data.frame()
for(page_result in seq(from = 1, to = 15, by = 1)){
  
  shoprite_vegetables_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/produce/fresh-vegetables-id-520538?page=",
                              page_result,"&skip=", skip)
  
  page = read_html(shoprite_vegetables_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_vegetables_data = rbind(shoprite_vegetables_data, data.frame(name,price))
}

produce <- rep("produce",nrow(shoprite_vegetables_data))
shoprite_vegetables_data <- cbind(produce,shoprite_vegetables_data)
colnames(shoprite_vegetables_data)[1] <- "category"


#shoprite fruits
skip = 0
shoprite_fruit_data = data.frame()
for(page_result in seq(from = 1, to = 10, by = 1)){
  
  shoprite_fruit_link = paste0("https://www.shoprite.com/sm/pickup/rsid/3000/categories/produce/fresh-vegetables-id-520538?page=",
                                    page_result,"&skip=", skip)
  
  page = read_html(shoprite_fruit_link)
  
  name = page %>% html_nodes(".efUpUY")  %>% html_text()
  price = page %>% html_nodes(".ProductPrice--w5mr9b") %>% html_text()
  
  skip <- skip + 30
  
  print(paste("Page:", page_result))
  
  shoprite_fruit_data = rbind(shoprite_fruit_data, data.frame(name,price))
}

produce <- rep("produce",nrow(shoprite_fruit_data))
shoprite_fruit_data <- cbind(produce,shoprite_fruit_data)
colnames(shoprite_fruit_data)[1] <- "category"

final_shoprite_data <- rbind(shoprite_meats_data,shoprite_meats_chicken_data,shoprite_meats_pork_data,shoprite_bread_data,shoprite_eggs_data
                        ,shoprite_milk_data,shoprite_fruit_data,shoprite_fruit_data)

date <- rep("03-9-23",nrow(final_shoprite_data))
final_shoprite_data <- cbind(date,final_shoprite_data)
colnames(final_shoprite_data)[4] <- "date"


# ///////////////////////////////////////////////////////////////////////////////////////////////////////


# farewaymeatmarket ribeye
farewaymeat_data = data.frame()
farewaymeat_link = "https://www.farewaymeatmarket.com/shop/suggested-products/prime-beef/ribeye-steaks"
page = read_html(farewaymeat_link)
name = page %>% html_nodes(".cms_title a")  %>% html_text()
price = page %>% html_nodes(".item-price") %>% html_text()
farewaymeat_data = rbind(farewaymeat_data, data.frame(name,price))
meat <- rep("meat",nrow(farewaymeat_data))
farewaymeat_data <- cbind(meat,farewaymeat_data)
colnames(farewaymeat_data)[1] <- "category"

# farewaymeatmarket seafood
farewaymeatseafood_data = data.frame()
farewaymeatseafood_link = "https://www.farewaymeatmarket.com/shop/suggested-products/seafood/"
page = read_html(farewaymeatseafood_link)
name = page %>% html_nodes(".cms_title a")  %>% html_text()
price = page %>% html_nodes(".item-price") %>% html_text()
farewaymeatseafood_data = rbind(farewaymeatseafood_data, data.frame(name,price))
meat <- rep("meat",nrow(farewaymeatseafood_data))
farewaymeatseafood_data <- cbind(meat,farewaymeatseafood_data)
colnames(farewaymeatseafood_data)[1] <- "category"

final_farewaymeat <- rbind(farewaymeat_data,farewaymeatseafood_data)

date <- rep("03-8-23",nrow(final_farewaymeat))
final_farewaymeat <- cbind(date,final_farewaymeat)
colnames(final_farewaymeat)[4] <- "date"


final_cub_data$name <- gsub(",","",final_cub_data$name)


write.csv(final_cub_data, file = "C:\\Users\\theca\\Downloads\\Math-490-capstone\\cub_food_data.csv",row.names = FALSE)
write.csv(final_shoprite_data, file = "C:\\Users\\theca\\Downloads\\Math-490-capstone\\shoprite_food_data.csv",row.names = FALSE)
write.csv(final_farewaymeat, file = "C:\\Users\\theca\\Downloads\\Math-490-capstone\\fareway_food_data.csv",row.names = FALSE)

