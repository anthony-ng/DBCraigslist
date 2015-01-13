get '/categories/:category_id/articles' do
  @category = Category.find(params[:category_id])
  @articles = @category.articles

  erb :"articles/articles"
end

get '/categories/:category_id/articles/new' do
  @category = Category.find(params[:category_id])

  erb :"articles/new"
end

post '/categories/:category_id/articles' do
  # @category = Category.find(params[:category_id])
  p "hello"
  p  @category

  # puts "this is category:"
  # p category
  article = Article.create(params[:article])
  article.update_attributes(category_id: 1)
  redirect "/categories/1/articles"
end

get '/categories/:category_id/articles/:article_id' do
  @category = Category.find(params[:category_id])
  @article = @category.articles.find(params[:article_id])

  erb :"articles/articles"
end


