#see https://emberigniter.com/modern-bridge-ember-and-rails-5-with-json-api/
ActiveSupport.on_load(:action_controller) do
  require 'active_model_serializers/register_jsonapi_renderer'
end

ActiveModelSerializers.config.adapter = :json_api
