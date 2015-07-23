require 'sinatra'
require 'sinatra/flash'

enable :sessions
set :session_secret, '0df287fcda8f2ec78794558c79073feb97675d158c1b29b1a913fa390353dd77e1285720bf739676aa49015c2228939274da7d9b1eeb0ce188ea9852bb778a32'

get "/" do
  haml :index, :format => :html5
end

post "/" do
  @email = params[:email]
  open("emails.txt", "a") do |l| 
    l << @email + "\n"
  end
  flash[:success] = "Pomyślnie dodano adres email."
  redirect "/"
end
