#include <iostream>
#include <fstream>

#define BUFSIZE 131072
//#define BUFSIZE 512

int main(int argc, char** argv) {
  std::ifstream ds("../data");
  if (ds.is_open()) {
    char buffer[BUFSIZE];
    while (ds.read(buffer,BUFSIZE)) std::cout.write(buffer,BUFSIZE);
    ds.close();
  }
  return 0;
}
