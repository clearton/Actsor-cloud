json.extract! actuator, :id, :name, :status, :description, :location, :created_at, :updated_at
json.url actuator_url(actuator, format: :json)