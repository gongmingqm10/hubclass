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
        put 'absent/:student_id', action: :absent_student
        put 'vote/:student_id', action: :vote_student
        resources :homeworks do
          get 'create', on: :collection, action: :get_created_homeworks
          get 'submit', on: :collection, action: :get_todo_homeworks
          post 'submit', action: :submit_homework
          get 'remark/:submitter_id', on: :member, action: :show_remark_homework
          post 'remark', action: :remark_submit
          get 'submit', on: :member, action: :show_submit_homework
        end
        resources :courses
        resources :notes
      end
      get '/:user_id/homeworks', on: :collection, to: 'homeworks#all'
      resources :attachments do
        get 'uploaded', on: :collection, action: :uploaded
      end
    end
    post 'file-upload', to: 'attachments#create'
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
  get 'homework/:homework_id/remark/:submitter_id', to: 'web_ui#homework_remark'
  get 'homework/:homework_id/submit', to: 'web_ui#homework_submit'
  get 'homework/:id', to: 'web_ui#homework_show_origin'

  get 'attachment', to: 'web_ui#attachment'

  get 'assignment', to: 'web_ui#assignment'

end
