before %r[/categories/(\d+)] do |category_id|
  @category = Category.find(category_id)
end

before %r[/categories/(\d+)/articles/(\d+)] do |category_id, article_id|
  @article = @category.articles.find(article_id)
end

get '/categories/:category_id/articles' do
  # @category = Category.find(params[:category_id])
  @all_articles = @category.articles

  erb :"articles/show"
end

get '/categories/:category_id/articles/new' do
  erb :"articles/new"
end

post '/categories/:category_id/articles' do
  @article = Article.create(params[:article])

  @article.category = @category
  @article.save

  erb :"articles/success"
end

get '/categories/:category_id/articles/:article_id' do
  # @article = @category.articles.find(params[:article_id])

  erb :"articles/show"
end

get '/categories/:category_id/articles/:article_id/edit' do
  if params[:key] == @article.article_key
    erb :"articles/edit"
  else
    redirect '/'
  end
end

put '/categories/:category_id/articles/:article_id' do
  @article.update_attributes(params[:article])

  id = params[:category_id]

  redirect "/categories/#{id}/articles"
end

delete '/categories/:category_id/articles/:article_id' do
  @article.destroy

  id = params[:category_id]

  redirect "/categories/#{id}/articles"
end
