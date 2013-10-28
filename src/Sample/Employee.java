package Sample;

import java.util.Date;

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
