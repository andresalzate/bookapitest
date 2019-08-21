# frozen_string_literal: true

When('Send post to endpoint book list') do
  @response = Helpers::API::Request.http_get
end

Then('Validate response code {int}') do |code|
  expect(@response.code).to eql code
end

When('Send post {string} to endpoint create books') do |type_payload|
  params = case type_payload
    when 'correct'
      { "title": Faker::Book.title,
        "author": Faker::Book.author }
    when 'wrong'
      { "title": Faker::Book.title }
    end
  @response = Helpers::API::Request.http_post(nil, params.to_json, {:content_type => 'application/json'})
end

When('Send post {string} to endpoint read books') do |type_payload|
  params = case type_payload
    when 'correct'
      '/Martin-Fierro'
    when 'wrong'
      '/esto-va-a-fallar'
    end
  @response = Helpers::API::Request.http_get(nil, params)
end

Then('JsonSchema: {string}') do |json_schema|
  expect(@response.body).to match_json_schema(json_schema)
end

When('Send post updte field {string} to endpoint update books') do |field|
  id = '/Martin-Fierro'
  params = { field => Faker::Book.publisher}
  @response = Helpers::API::Request.http_put(id, params, {:content_type => 'application/json'})
end

When('Send post {string} to endpoint delete books') do |type_payload|
  step "Send post 'correct' to endpoint create books"
  params = case type_payload
    when 'correct'
      "/#{JSON.parse(@response.body)['slug']}"
    when 'wrong'
      '/esto-va-a-fallar'
    end
  @response = Helpers::API::Request.http_delete(params, nil, {:content_type => 'application/json'})
end
