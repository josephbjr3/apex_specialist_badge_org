/**
 * * This class has a method that returns a string called taskPriority, given a state abbreviation. If the state abrreviation equals CA, the taskPriority is to high. For all other state abrreviations, the taskPrioirity is set to normal.
 */
public class TaskUtil {
    /**
     * * This method returns a string called taskPriority given a state abbreviation. If the state abrreviation equals CA, the taskPriority is to high. For all other state abrreviations, the taskPrioirity is set to normal.
     * @param leadState The parameter where you input the state abbreviation.
     */
    public static String getTaskPriority(String leadState) {
        // Validate input
        if (String.isBlank(leadState) || leadState.length() > 2) {
            return null;
        }
        String taskPriority;
        if (leadState == 'CA') {
             taskPriority = 'High'; 
        } else {
             taskPriority = 'Normal';
        }
        return taskPriority;
    }
}