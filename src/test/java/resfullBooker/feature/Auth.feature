Feature: Crear un token para la autentificacion para acceder a PUT y DELETE de booking

  Background: Definir las variables
    * def AuthRequest = read("classpath:resfullBooker/request/Auth.json")
    * url baseUrl
    * configure headers = {'Content-Type': 'application/json'}

  @Auth-001 @Auth @HappyPath @R01 @joel.leiva
  Scenario Outline: Validar la autentificacion con credenciales correctas
    Given path '/auth'
    And request <AuthRequest>
    When method POST
    Then status 200
    And print response
    And def tokenObtenido = response.token
    * print tokenObtenido

    Examples:
      | AuthRequest   |
      | AuthRequest[0] |


  @Auth-002 @Auth @NegativePath @R01 @joel.leiva
  Scenario Outline: Validar la autentificacion con credenciales invalidas
    Given path '/auth'
    And request <AuthRequest>
    When method POST
    Then status 200
    And print response
    And match response.reason == 'Bad credentials'

    Examples:
      | AuthRequest    |
      | AuthRequest[1] |

  @Auth-002 @Auth @NegativePath @R01 @joel.leiva
  Scenario Outline:  Validar la autentificacion con datos vacios
    Given path '/auth'
    And request <AuthRequest>
    When method POST
    Then status 200
    And print response
    And match response.reason == 'Bad credentials'

    Examples:
      | AuthRequest   |
      | AuthRequest[2] |


