public class PhuongTrinhBac2 {
    public static void main(String[] args) {
        String ketqua =  phuongTrinhBac2(2,1,-1);
        System.out.println(ketqua);
    }

    public static String phuongTrinhBac2(int a,int b,int c) {
        double delta = Math.pow(b, 2) - 4 * a * c;
        double x1 ;
        double x2 ;
        if (delta < 0) {
            System.out.println("Phương trình này không có nghiệm!");
        } else if (delta == 0) {
            x1 = (-b / (2 * a));
            return "Phương trình bậc 2 này có 1 nghiệm là x1 = x2 = " + x1;
        } else {
            x1 = (-b + Math.sqrt(delta)) / (2 * a);
            x2 = (-b - Math.sqrt(delta)) / (2 * a);
            return "Phương trình bậc 2 này có 2 nghiệm x1 = " + x1 + " và x2 = " + x2;
        }
        return null;

    }
}
