FriendGetFriend::Application.routes.draw do
  root to: 'entries#new'
  resource :entry
end
