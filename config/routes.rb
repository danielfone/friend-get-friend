FriendGetFriend::Application.routes.draw do
  root to: 'entries#new'
  resource :entry

  namespace :admin do
    resources :entries do
      collection { post :draw_winners }
    end
  end
end
