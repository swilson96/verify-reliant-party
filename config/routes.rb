Rails.application.routes.draw do
  post 'verify/receive'

  get 'welcome/index'

  root 'welcome#index'
end
