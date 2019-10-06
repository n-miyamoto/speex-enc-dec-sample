#!/bin/bash

# compile 
gcc test_enc.c -lspeex -o test_enc
gcc test_dec_int.c -lspeex -o test_dec_int

# encode decode

sox $1 tmp.raw
./test_enc tmp.raw > tmp.spx
./test_dec_int out.raw < tmp.spx  
sox -r 16000  -c 1 -b 16  -e signed-integer  "out.raw" "out.wav" 

