StubhubScraper::Application.routes.draw do
  root to: "events#index"

  resources :events, only: [:index, :show, :new, :create] do
    resources :reports, only: [:new, :create], controller: "events/reports"
  end

  resources :batches, only: :show
end
