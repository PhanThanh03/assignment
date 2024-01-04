package EX5_Q1_2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class QLCB {
private Scanner scanner = new Scanner(System.in);
private ArrayList<Canbo> listCanBo = new ArrayList<>();

    public void menu(){
        while (true){
            System.out.println("Moi Chon Chuc Nang: ");
            System.out.println("1.Them moi Can Bo");
            System.out.println("2.Xem danh sach");
            System.out.println("3.Tim kiem can bo");
            System.out.println("4.Xoa can bo");
            System.out.println("5.Exit");

            int chon = scanner.nextInt();
            switch (chon){
                case 1:
                    create();
                    break;
                case 2:
                    getList();
                    break;
                case 3:
                    searchCanBo();
                    break;
                case 4:
                    deleteCanbo();
                    break;

            }



        }

    }

    private void deleteCanbo() {
        scanner.nextLine();
        System.out.println("Nhap ten can bo can xoa: ");
        String nameDelete = scanner.nextLine();
        boolean checkTontai = false;
        Iterator<Canbo> iter = listCanBo.iterator();
        for (Canbo canbo: listCanBo){
            if (canbo.getName().equals(nameDelete)){
               iter.remove();
               getList();
                checkTontai = true;
            }
        }
        if (checkTontai == false){
            System.out.println("Khong tim thay can bo can xoa!");
        }
    }

    private void searchCanBo() {
        System.out.println("Nhap ten can bo can tim: ");
        scanner.nextLine();
        String nameSearch = scanner.nextLine();
        boolean checkTontai = false;
        for (Canbo canbo: listCanBo){
            if (canbo.getName().equals(nameSearch)){
                System.out.println(canbo.toString());
                checkTontai = true;
            }
        }
        if (checkTontai == false){
            System.out.println("Khong tim thay can bo nay!");
        }
    }

    private void getList() {
        System.out.println("Danh sach can bo: ");
        for (Canbo canbo: listCanBo){
            System.out.println(canbo.toString());
        }
    }

    private void create() {
        System.out.println("Them moi can bo");
        System.out.println("Nhap vao ten: ");
        scanner.nextLine();
        String name = scanner.nextLine();
        System.out.println("Nhap vao tuoi:");
        int age = scanner.nextInt();
        scanner.nextLine();
        System.out.println("Nhap vao gioi tinh:");
        String gender = scanner.nextLine();
        System.out.println("Nhap vao dia chi:");
        String address = scanner.nextLine();

        Canbo canbo = new Canbo(name,age,gender,address);
        listCanBo.add(canbo);

    }

}
