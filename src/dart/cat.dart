import 'dart:io';

// const int BLOCK_SIZE = 131072;

void main() {
  final inStream = new File("../data").openRead();
  inStream.pipe(stdout);
}
