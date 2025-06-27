
Feature: Test de API súper simple

  Background:
    * configure ssl = true
    * def urlBase = 'http://localhost:8080'






  @listCharacter
  Scenario: Obtener todos los personajes y validar que alguno tenga un campo esperado
    Given url urlBase + '/testuser/api/characters'
    When method get
    Then status 200
    And print response
    And match response contains deep { name: 'Peaky Power', powers:  ["Random",  "Full"  ] }


  @createCharacterValid
  Scenario: Crear personaje Valid
    Given url urlBase + '/testuser/api/characters'
    And request {  "id": 2345,  "name": "Hombre araña",  "alterego": "Fuerte",  "description": "Super Heroe",  "powers": ["Fuerza", "Verde"]  }
    When method POST
    Then status 201
    And print response

  @createCharacterInvalid
  Scenario: Crear personaje (falta campos requeridos)
    Given url urlBase + '/testuser/api/characters'
    And request {  "name": "","description": "",  "powers": [],  "alterego": ""  }
    When method POST
    Then status 400
    And match response.name == 'Name is required'
    And match response.powers == 'Powers are required'

    @deleteCharacterValid
    Scenario: Eliminar personaje por Id Exitoso
    Given url urlBase + '/testuser/api/characters/4'
    When method DELETE
    Then status 204
    And print response








