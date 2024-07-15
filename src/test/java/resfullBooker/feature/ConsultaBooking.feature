Feature: Consulta de todas las reservas

  Background: Definicion de variables
    * url baseUrl
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

  @ConsultaBooking-001 @Booking @HappyPath @R01 @joel.leiva
  Scenario:Validar lel listado de las reservas
    Given path '/booking'
    When method GET
    Then status 200
    And print response



  @ConsultaBooking-002 @Booking @HappyPath @R01 @joel.leiva
  Scenario:Validar la consulta de los datos de la reserva por ID
    Given path '/booking/3'
    When method GET
    Then status 200
    And print response

