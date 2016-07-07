Rails.application.routes.draw do

  get 'home/index'

  get 'webauth/login' => 'authentication#login', as: :login
  get 'webauth/logout' => 'authentication#logout', as: :logout

  resources :batch_record_updates, only: [:index]
  resources :change_item_types, only: [:new, :create]
  resources :change_current_locations, only: [:new, :create]
  resources :change_home_locations, only: [:new, :create]
  resources :uni_updates_batches, only: [:show, :destroy]
  resources :withdraw_items, only: [:new, :create]
  resources :transfer_items, only: [:new, :create]
  resources :sal3_batch_requests_batches, only: [:new, :create]
  resources :encumbrance_reports, only: [:new, :create]
  resources :expenditure_reports, only: [:new, :create]

  get 'batch_record_updates/errors_for_batch' => 'batch_record_updates#errors_for_batch'
  get 'batch_record_updates/errors_for_batch/:batch_number' => 'batch_record_updates#errors_for_batch'
  get 'show_batches_complete' => 'batch_record_updates#show_batches_complete'
  get 'show_batches_not_complete' => 'batch_record_updates#show_batches_not_complete'
  get 'review_batches' => 'sal3_batch_requests#review_batches'

  get 'management_reports' => 'management_reports#index'
    get 'circulation_statistics_report' => 'management_reports#circulation_statistics_report'
    get 'shelf_selection_report' => 'management_reports#shelf_selection_report'
    get 'expenditures_with_circ_stats_report' => 'management_reports#expenditures_with_circ_stats_report'
    get 'endowed_funds_report' => 'management_reports#endowed_funds_report'
    get 'google_selection_report' => 'management_reports#google_selection_report'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
