Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :races
		end
	end
end
