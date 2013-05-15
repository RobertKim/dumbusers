enable 'sessions'

get '/' do
  erb :index
end

post '/' do
  p params
  user = User.find_by_email_and_encrypted_password(params[:email],params[:password])

  
  session[:id] = user.id unless user.nil?
  redirect '/secret_page'
end

post '/signup' do
  usr = User.find_or_create_by_email(name: params[:name], email: params[:email], encrypted_password: params[:password])
  session[:id] = usr.id
  redirect '/secret_page'
end

get '/secret_page' do
  redirect '/' if session[:id].nil?
  erb :secrets
end


get '/logout' do
  session.clear
  redirect '/'
end