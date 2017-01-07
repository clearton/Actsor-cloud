json.extract! sensor, :id, :name, :status, :ball_id, :dynamodb_table, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)