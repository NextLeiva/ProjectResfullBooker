Feature: Crear un nueva reserva

  Background: Definicion de variables
    * url baseUrl
    * def BookingRequest = read("classpath:resfullBooker/request/Booking.json")
    * def token = call read("classpath:resfullBooker/feature/Auth.feature")
    * def tokenR = 'token=' + token.tokenObtenido

    * configure headers =
      """
      {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Cookie': '#(tokenR)',}
      'Authorization': 'Basic YWRtaW46cGFzc3dvcmQxMjM='
      }
       """

  @CrearBooking-001 @Booking @HappyPath @R01 @joel.leiva
  Scenario Outline:Validar la creacion de una reserva con datos validos
    Given path '/booking'
    And request <BookingRequest>
    When method POST
    Then status 200
    And print response
    And def BookingId = response.bookingid
    * print BookingId

    Examples:

      | BookingRequest    |
      | BookingRequest[0] |
      | BookingRequest[1] |


  @CrearBooking-002 @Booking @NegativePath @R01 @joel.leiva
  Scenario Outline:Validar la creacion de una reserva con datos incompletos
    Given path '/booking'
    And request <BookingRequest>
    When method POST
    Then status 500
    And print response
    And def BookingId = response.bookingid
    * print BookingId

    Examples:

      | BookingRequest    |
      | BookingRequest[2] |





