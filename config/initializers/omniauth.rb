Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :github, ENV['github_key'], ENV['GITHUB_SECRET']
end
