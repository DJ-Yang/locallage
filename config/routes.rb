Rails.application.routes.draw do
    
    devise_for :user
    root 'freelancers#index'

    #메인페이지
    get 'new' => 'freelancers#new'
    post 'category' => 'freelancers#category'
    
    #영상관련
    get 'video' => 'freelancers#video'
    get 'video/show/:id' => 'freelancers#video_show'
    get 'video/new' => 'freelancers#video_new'
    post 'video/create' => 'freelancers#video_create'
    get 'video/:id/edit' => 'freelancers#video_edit'
    patch 'video/show/:id/update' => 'freelancers#video_update'
    get 'video/show/:id/delete' => 'freelancers#video_destroy'
    
    #디자인관련
    get 'design' => 'freelancers#design'
    get 'design/show/:id' => 'freelancers#design_show'
    get 'design/new' => 'freelancers#design_new'
    post 'design/create' => 'freelancers#design_create'
    get 'design/:id/edit' => 'freelancers#design_edit'
    patch 'design/show/:id/update' => 'freelancers#design_update'
    get 'design/show/:id/delete' => 'freelancers#design_destroy'
    
    #로그인관련
    get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'me', to: 'me#show', as: 'me'
end
