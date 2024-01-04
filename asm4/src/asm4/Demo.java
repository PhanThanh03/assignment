package asm4;

public class Demo {
    public static void main(String[] args) {
        Student nam = new Student(1,"Nam","HN");
        Student Lan = new Student(2,"LAN","SG");

        nam.setDiem(7);
        System.out.println("Diem hien tai cua Nam: "+nam.getDiem());
        nam.congDiem(1);
        nam.printStudent();

    }
}
