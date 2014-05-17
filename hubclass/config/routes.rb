Hubclass::Application.routes.draw do
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

  root  "web_ui#index"

  namespace :api do
    resources :users do
      resources :groups do
        resources :assignments
        resources :attachments
        resources :courses
        resources :notes
      end
    end
    post 'file-upload', to: 'files#create'
  end

  get 'login', to: 'web_ui#login'
  post 'login', to: 'web_ui#sessions'
  delete 'logout', to: 'web_ui#logout', as: :logout

  get 'course', to: 'web_ui#course'
  get 'course/all', to: 'web_ui#course_all'
  get 'course/:group_id', to: 'web_ui#group_show'

  get 'group/all', to: 'web_ui#group_all'

  get 'note/new', to: 'web_ui#note_new'
  get 'note/show/:note_id', to: 'web_ui#note_show'
  get 'homework/new', to: 'web_ui#homework_new'


  get 'attachment', to: 'web_ui#attachment'

  get 'assignment', to: 'web_ui#assignment'

end
