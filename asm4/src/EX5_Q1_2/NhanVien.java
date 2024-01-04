package EX5_Q1_2;

public class NhanVien extends Canbo {
    private String congViec;

    public NhanVien(String name, int age, String gender, String address, String congViec) {
        super(name, age, gender, address);
        this.congViec = congViec;
    }
}
