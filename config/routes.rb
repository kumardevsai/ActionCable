Rails.application.routes.draw do
  root 'rooms#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  # Action Cableを有効にするため、mount ActionCable.server => '/cable' のコメントを外します。
end
