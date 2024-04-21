# features/query_service.feature

Feature: Verificar se o JSON retornado pelo serviço contém a chave "typeOfEstablishment"

  Scenario: Verificar se o JSON possui a chave "typeOfEstablishment"
    Given que faço uma requisição GET para o endpoint de consulta
    Then a resposta deve conter a chave "typeOfEstablishment"
    And printo aleatoriamente um tipo de estabelecimento

