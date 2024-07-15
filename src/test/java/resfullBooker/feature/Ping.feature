Feature: Servicio disponible

  Background: Definicion de variables
    * url baseUrl
    * configure headers =
     """
      {
      'Content-Type': 'application/json'
      }
     """
  @Ping-001 @Ping @HappyPath @R01 @joel.leiva
  Scenario: Validar que el servicio este disponible
    Given path '/ping'
    When method GET
    Then status 201
    And print response


