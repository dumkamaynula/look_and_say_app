Rails.application.routes.draw do

	root 'look_and_say_builders#result'
  	post 'look_and_say_builders/calculation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
