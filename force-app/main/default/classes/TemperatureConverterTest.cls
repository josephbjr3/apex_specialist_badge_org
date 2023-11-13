/**
 * This class tests the TemperatureConverter class.
 */
@isTest
private class TemperatureConverterTest {
  // test case for postive temp b/w freezing and boiling point
  @isTest
  static void testWarmTemp() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
    System.assertEquals(21.11, celsius);
  }
  // test case for freezing point
  @isTest
  static void testFreezingPoint() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
    System.assertEquals(0, celsius);
  }
  // test case for boiling point
  @isTest
  static void testBoilingPoint() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
    // Simulate failure
    System.assertEquals(
      0,
      celsius,
      'Boiling point temperature is not expected.'
    );
  }
  // test case for negative temp
  @isTest
  static void testNegativeTemp() {
    Decimal celsius = TemperatureConverter.FahrenheitToCelsius(-10);
    System.assertEquals(-23.33, celsius);
  }
}