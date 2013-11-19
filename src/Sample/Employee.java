package Sample;

import java.util.Date;

public class Employee {

	private Integer id;
    private String name;
    private Date birthdayDate;
    private String familyStatus;
    private String position;
    private Date enrollmentDate;
	private static int notUsedId = 1;

    public Employee(String name, Date birthdayDate, String familyStatus, String position)
    {
		this.id = notUsedId++;
        this.name = name;
        this.birthdayDate = birthdayDate;
        this.familyStatus = familyStatus;
        this.position = position;
		this.enrollmentDate = new Date();
    }

	public String getName() {
		return name;
	}

	public Date getBirthdayDate() {
		return birthdayDate;
	}

	public String getFamilyStatus() {
		return familyStatus;
	}

	public String getPosition() {
		return position;
	}

	public Date getEnrollmentDate() {
		return enrollmentDate;
	}

	public Integer getId() {
		return id;
	}
}
