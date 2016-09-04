import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

class Cat {
    private static final long BLOCK_SIZE = 131072;

    private static void copyFile( File from, File to ) throws IOException {

        if ( !to.exists() ) { to.createNewFile(); }

        try (
                FileChannel in = new FileInputStream( from ).getChannel();
                FileChannel out = new FileOutputStream( to ).getChannel()
        ) {
            long start = 0;
            long transferred = 0;
            do {
                transferred = out.transferFrom(in, start, BLOCK_SIZE);
                start += transferred;
            } while (transferred > 0);
        }
    }

    public static void main(String[] args) throws IOException {
        final File data = new File("../data");
        final File stdout = new File("/dev/stdout");
        copyFile(data, stdout);
    }
}
