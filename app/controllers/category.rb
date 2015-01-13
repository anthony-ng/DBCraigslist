get '/categories' do
  @categories = Category.all
  p @categories

  erb :"/categories/index"
end



