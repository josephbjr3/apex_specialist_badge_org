/**
 * *This class converts a temperature from F to C.
 */
public class TemperatureConverter {
    /**
     * * This method converts a temperature from F to C. It returns the Celsius temp. as a decimal.
     * @param fh The parameter where you input the Fahrenheit temp.
     */
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}