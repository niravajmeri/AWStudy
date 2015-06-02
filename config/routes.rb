LASAwStudy::Application.routes.draw do
  resources :subtask_question_users

  resources :subtask_questions

  resources :subtask_users

  resources :task_users

  resources :subtasks

  resources :tasks

  resources :users

  post "update_user_response" => "home#update_user_response", :as => "update_user_response"
  post "record_user_response" => "home#record_user_response", :as => "record_user_response"
  post "signin" => "home#signin", :as => "sigin"
  
  get "workflow_completion_survey" => "home#workflow_completion_survey", :as => "workflow_completion_survey"
  get "pre_participation_survey" => "home#pre_survey", :as => "pre_participation_survey"
  get "welcome" => "home#welcome", :as => "welcome"
  get "logout" => "home#logout", :as => "logout"
  get "login" => "home#login", :as => "login"
  get "survey" => "home#survey", :as => "survey"
  get "timed_survey" => "home#timed_survey", :as => "timed_survey"
  get "untimed_survey" => "home#untimed_survey", :as => "untimed_survey"

  get "update_task_status" => "home#update_task_status", :as => "update_task_status"



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#login'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
