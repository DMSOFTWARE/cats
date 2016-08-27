import java.io.IOException;
import java.io.FileInputStream;

class Cat {
    public static void main(String[] args) throws IOException {
      byte[] buffer = new byte[131072];
      FileInputStream in = new FileInputStream("../data");      
      int n = 0;
      while ((n = in.read(buffer)) != -1) {
	System.out.write(buffer, 0, n);
      }
    }
}
