Rails.application.routes.draw do
  devise_for :authors
	root 'blog/posts#index'

	namespace :authors do
		get '/account' => 'accounts#edit', as: :account
		put '/info' => 'accounts#update_info', as: :info
		put '/change_password' => 'accounts#change_password', as: :change_password
  	resources :posts
  end

	scope module: 'blog' do
		get 'about' => 'pages#about', as: :about
		get 'contact' => 'pages#contact', as: :contact
		get 'posts' => 'posts#index', as: :posts
		get 'posts/:id' => 'posts#show', as: :post
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html