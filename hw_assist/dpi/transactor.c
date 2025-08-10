/* File: hw_assist/dpi/transactor.c
   Minimal DPI-C skeleton to illustrate how to call into C from SV for hw-assist.
   compile with: gcc -shared -fPIC -o libtransactor.so transactor.c
*/
#include <svdpi.h>
#include <stdio.h>

void dpi_send_to_hw(const svOpenArrayHandle data) {
  // convert and send to hardware/emulator API (vendor-specific)
  printf("[DPI] Called dpi_send_to_hw\n");
}

// exported DPI function
void dpi_send(svBitVecVal *ptr) {
  (void)ptr; dpi_send_to_hw(NULL);
}
