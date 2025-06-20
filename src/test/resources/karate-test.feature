
Feature: Test de API súper simple

  Background:
    * configure ssl = true
    * def urlBase = 'http://bp-se-test-cabcd9b246a5.herokuapp.com'

   @listCharacter
  Scenario: Obtener todos los personajes
    Given url urlBase + '/testuser/api/characters'
    When method get
    Then status 200
    And print response

  @characterID
  Scenario: Obtener personaje porID
    Given url urlBase + '/testuser/api/characters/199'
    When method get
    Then status 200
    And print response

  @createCharacter
  Scenario: Crear personaje exitoso
    Given url urlBase + '/testuser/api/characters'
    When method POST
    Then status 200
    And print response

