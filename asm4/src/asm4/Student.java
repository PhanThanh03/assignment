package asm4;

public class Student {

    private long id;
    private String name;
    private String hometown;
    private int diem;

    public Student(long id,String  name, String hometown) {
        this.id = id;
        this.name = name;
        this.hometown = hometown;
        this.diem = 0;
    }

    public int getDiem(){
        return this.diem;
    }
    public void setDiem(int diem){
            this.diem = diem;
        }

    public void congDiem(int diemCong){
        this.diem += diemCong;
    }

    public void printStudent(){
        System.out.println("Tên: "+this.name);
        System.out.println("Diem:"+this.diem);
        if (this.diem < 4 ){
        System.out.println("Hoc Luc yeu");}
        else if (this.diem>=4 && this.diem <=6){
            System.out.println("Hoc Luc TB");
        }else if (6 < this.diem && this.diem < 8 ){
            System.out.println("Hoc Luc Kha");
        }else {
            System.out.println("Hoc Luc Gioi");
        }


    }


}
