json.extract! admin_user, :id, :name, :cpf, :email, :status, :role, :created_at, :updated_at
json.url admin_user_url(admin_user, format: :json)
