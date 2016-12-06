Rails.application.routes.draw do
  root 'main#top'
  post '/result' => 'main#result'
end
