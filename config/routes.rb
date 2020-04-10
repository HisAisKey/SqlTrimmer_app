Rails.application.routes.draw do
  root "home#top"
  get "/home" => "home#top"
  post "/home/result" => "home#result"
end
