Rails.application.routes.draw do
   devise_for :users
   root 'tutorials#index'
   resources :tutorials do 
      resources :reviews
   end

end
