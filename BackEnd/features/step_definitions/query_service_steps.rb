# features/step_definitions/query_service_steps.rb

require 'httparty'

Given("que faço uma requisição GET para o endpoint de consulta") do
  @response = HTTParty.get('https://portal.vr.com.br/api-web/comum/enumerations/VRPAT')
end

Then("a resposta deve conter a chave {string}") do |key|
  expect(@response.body).to include(key)
end

And("printo aleatoriamente um tipo de estabelecimento") do
  parsed_response = JSON.parse(@response.body)
  establishment_types = parsed_response["typeOfEstablishment"]
  random_type = establishment_types.sample
  puts "Tipo de estabelecimento: #{random_type}"
end
