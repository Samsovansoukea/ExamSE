import java.time.LocalDate;
import java.util.Scanner;
public class Student {
	private int Sid;
    private String Sname,SDOB,Stelephone,Scity,Scountry,SgroupName;

    public int getId() {
        return Sid;
    }

    public void setId(int id) {
        Sid = id;
    }

    public String getName() {
        return Sname;
    }

    public void setName(String name) {
        this.Sname = name;
    }

    public String getDateOfBirth() {
        return SDOB;
    }

    public String getTelephone() {
        return Stelephone;
    }
    public String getCity() {
        return Scity;
    }

    public void setCity(String city) {
        this.Scity = city;
    }

    public String getCountry() {
        return Scountry;
    }

    public void setCountry(String country) {
        this.Scountry = country;
    }

    public String getGroupName() {
        return SgroupName;
    }
    public void setTelephone(String telephone) {
        String teleFormat = telephone.substring(0,4);
        if(teleFormat.equals("+855")){
            this.Stelephone = telephone;
        }else{
            throw new ArithmeticException("Worng Telephone Number!!!Use Cambodia Mobile code");
        }
    }
    public void setDateOfBirth(String dateOfBirth) {
        String date = dateOfBirth;
        int year = Integer.parseInt(date.substring(6));
        LocalDate today = LocalDate.now();
        int currentYear = today.getYear();
        Boolean checkYear = currentYear - year >= 15;
        if(checkYear){
            this.SDOB = dateOfBirth;
        }else{
            this.SDOB = null;
            throw new ArithmeticException("Sorry Can't Enroll at lest 15 year old up!!!");
        }

    }
    public void setGroupName(String groupName) {
        String start = groupName.substring(0,1);
        int middle = Integer.parseInt(groupName.substring(1,2));
        String end = groupName.substring(2);

        if(start.equalsIgnoreCase("I") || start.equalsIgnoreCase("T")){
            if(start.equalsIgnoreCase("I")){
                if(middle >=1 && middle<=5){
                    if(end.matches("\\w+")){
                        this.SgroupName = groupName;
                    }else {
                        throw new ArithmeticException("Letter only!!!");
                    }
                }else{
                    throw new ArithmeticException("Engineering have class from 1-5");
                }
            }
            if(start.equalsIgnoreCase("T")){
                if(middle >=1 && middle<=2){
                    if(end.matches("\\w+")){
                        this.SgroupName = groupName;
                    }else {
                        throw new ArithmeticException("Letter only!!!");
                    }
                }else{
                    throw new ArithmeticException("Technician have class from 1-2");
                }
            }
        }else {
            throw new ArithmeticException("Can't identify your group!! Group only I or T");
        }

    }
    public static void main(String[] args) {
        Student student = new Student();
        student.Input();
    }
    public void Input() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Student Record");
        System.out.println("");
        System.out.printf("Input Id: ");
        setId(Integer.parseInt(sc.nextLine()));
        System.out.printf("Enter Name: ");
        setName(sc.nextLine());
        System.out.printf("Input DOB(Day/Month/Year): ");
        setDateOfBirth(sc.nextLine());
        System.out.printf("Input Telephone(+885+xx+xxx+xxx): ");
        setTelephone(sc.nextLine());
        System.out.printf("Input City: ");
        setCity(sc.nextLine());
        System.out.printf("Input Country: ");
        setCountry(sc.nextLine());
        System.out.printf("Input Group Name(ex: I4,T2): ");
        setGroupName(sc.nextLine());
        System.out.println("Done!!!");
        System.out.println(Result());
    }
    public String Result(){
        return "Student's Name: \n" + getName()+"ID: \n" + getId()+"Date of Birth: \n" + getDateOfBirth()+"Telephone: \n" + getTelephone()+
                "City: \n" + getCity()+
                "Country: \n" + getCountry()+
                "Group: \n" + getGroupName();
    }
}