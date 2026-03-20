# config/initializers/cors.rb
# これをそのままコピーして貼り付けてください（余計な文字が入らないように！）
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end