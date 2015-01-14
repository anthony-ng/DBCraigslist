get '/categories/:category_id/articles' do
  @category = Category.find(params[:category_id])
  @articles = @category.articles

  erb :"articles/show"
end

get '/categories/:category_id/articles/new' do
  @category = Category.find(params[:category_id])

  erb :"articles/new"
end

post '/categories/:category_id/articles' do
  id = params[:category_id]

  article = Article.create(params[:article])

  article.category = Category.find(id)
  article.save

  redirect "/categories/#{id}/articles"
end

get '/categories/:category_id/articles/:article_id' do
  @category = Category.find(params[:category_id])
  @article = @category.articles.find(params[:article_id])

  erb :"articles/show"
end

get '/categories/:category_id/articles/:article_id/edit' do
  @category = Category.find(params[:category_id])
  @article = @category.articles.find(params[:article_id])

  erb :"articles/edit"
end

put '/categories/:category_id/articles/:article_id' do
  id = params[:category_id]

  article = Article.find(params[:article_id])
  article.update_attributes(params[:article])

  redirect "/categories/#{id}/articles"
end

delete '/categories/:category_id/articles/:article_id' do
  id = params[:category_id]

  article = Article.find(params[:article_id])
  article.destroy

  redirect "/categories/#{id}/articles"
end


