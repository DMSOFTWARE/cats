import java.io._

object Cat {
       def read(file: String) {
	   val is = new FileInputStream(file);
	   var n = 0;
	   val buffer = Array.fill[Byte](131072)(0);
	   do {
	   	 n = is.read(buffer);
		 if (n > 0) {
	   	    System.out.write(buffer, 0, n);
		 }
           } while (n > 0);
       }
       def main(args: Array[String]): Unit = {
       	   read("../data");
       }
}
