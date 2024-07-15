Feature: Eliminar una reserva

  Background: Definicion de variables
    * url baseUrl
    * def Booking_Request = read("classpath:resfullBooker/request/Booking.json")
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

  @DeleteBooking-001 @Booking @HappyPath @R01 @joel.leiva
  Scenario:Validar que se puede eliminar un codigo de reserva que exista
    Given path '/booking/663'
    When method DELETE
    Then status 201
    And print response

  @DeleteBooking-002 @Booking @NegativePath @R01 @joel.leiva
  Scenario:Validar que se puede eliminar un codigo de reserva que no exista
    Given path '/booking/87689'
    When method DELETE
    Then status 405
    And print response

