Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :courses
  resources :grades
  resources :students
  resources :instructors

  get '/dashboard' => 'users#show'
  match 'instructors/edit_my_student/:id', to: 'instructors#editmystudent', as: :edit_my_student, via: 'get'
  match 'instructors/edit_my_student/:id', to: 'instructors#addstudentcourse', as: :addstudentcourse, via: 'get'
  match 'instructors/add_a_course/:id', to: 'instructors#add_instructor_course', as: :add_instructor_course, via: 'get'


  root 'users#index'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#create',       via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  post '/chart' => 'grades#chart'
  post '/instructor_chart' => 'grades#instructor_chart'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
