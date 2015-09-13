 ###Worked on it with Casey, power of pair programming

require 'pry'
require 'sinatra'
require 'csv'

get '/articles' do
  articles = CSV.readlines('articles.csv', headers: true)
  erb :index, locals: { articles: articles }
end

get '/articles/new' do
  erb :new_article
end

post '/articles/new' do
  title = params['title']
  url = params['url']
  description = params['description']

  File.open('articles.csv', 'a') do |file|
    file.puts("#{title},#{url},#{description}")
  end

  redirect '/articles'
end
input = nil


get "/tasks" do
  tasks = ["pay bills", "buy milk", "learn Ruby", "get a lock", "don't forget to bring sweatshirt", "check weather"]

  erb :test, locals: { tasks: tasks, input: input }
end

post "/tasks" do
  # Read the input from the form the user filled out
  if params["task_name"].length >= 5
    task = params["task_name"]
    input = nil
    redirect "/tasks"
  else
    input = params["task_name"]
    redirect "/tasks"
  end
end
