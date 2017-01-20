json.extract! contestant, :id, :name, :description, :show_id, :placing, :created_at, :updated_at
json.url admin_contestant_url(contestant, format: :json)
