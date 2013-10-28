package Sample;

import javax.lang.model.element.Name;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Администратор
 * Date: 22.10.13
 * Time: 23:44
 * To change this template use File | Settings | File Templates.
 */
public class Employee {
    public String Name;
    public Date BirthdayDate;
    public String FamilyStatus;
    public String Position;
    public Date EnrollmentDate;

    public Employee(String name, Date birthdayDate, String familyStatus, String position)
    {
        Name = name;
        BirthdayDate = birthdayDate;
        FamilyStatus = familyStatus;
        Position = position;
        EnrollmentDate = new Date();
    }
}
