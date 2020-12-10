json.extract! pwa_user, :id, :name, :cpf, :email, :status, :role, :created_at, :updated_at
json.url user_url(pwa_user, format: :json)
