Feature: Actualizacion de una reserva

  Background: Definicion de variables
    * url baseUrl
    * def UpdateRequest = read("classpath:resfullBooker/request/UpdateBooking.json")
    * def token = call read("classpath:resfullBooker/feature/Auth.feature")

    * def tokenR = 'token=' + token.tokenObtenido

    * configure headers =
      """
      {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Cookie': '#(tokenR)',
      'Authorization': 'Basic YWRtaW46cGFzc3dvcmQxMjM='
      }
       """

  @ActualizacionBooking-001 @Booking @HappyPath @R01 @joel.leiva
  Scenario Outline:Validar la actualizacion de datos de una reserva con datos validos
    Given path '/booking/3'
    And request <UpdateRequest>
    When method PUT
    Then status 200
    And print response
    Examples:
      | UpdateRequest    |
      | UpdateRequest[0] |

  @ActualizacionBooking-002 @Booking @NegativePath @R01 @joel.leiva
  Scenario Outline:Validar la actualizacion de datos de la reserva con datos invalidos
    Given path '/booking/3'
    And request <UpdateRequest>
    When method PUT
    Then status 400
    And print response
    Examples:
      | UpdateRequest    |
      | UpdateRequest[1] |


  @ActualizacionBooking-003 @Booking @HappyPath @R01 @joel.leiva
  Scenario Outline:Validar la actualizacion con datos de una reserva con datos incompletos
    Given path '/booking/3'
    And request <UpdateRequest>
    When method PATCH
    Then status 200
    And print response

    Examples:
      | UpdateRequest    |
      | UpdateRequest[2] |

