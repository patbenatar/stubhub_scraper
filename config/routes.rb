StubhubScraper::Application.routes.draw do
  root to: "events#index"
  resources :events, only: [:index, :show]
  resources :batches, only: :show
end