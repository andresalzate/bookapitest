# frozen_string_literal: true

RSpec::Matchers.define :match_json_schema do |schema|
  match do |response|
    schema_directory = "#{Dir.pwd}/features/json_schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, response, strict: true, validate_schema: true)
  rescue JSON::Schema::ValidationError => error
    @error_message = error.message
    false
  end

  failure_message do
    @error_message
  end
end
