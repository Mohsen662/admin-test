Rails.application.routes.draw do
   devise_for :users
   root 'pages#index'
   resources :tutorials do 
      resources :reviews
   end

end
