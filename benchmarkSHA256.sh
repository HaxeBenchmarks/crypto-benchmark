#!/bin/bash

source benchmark.env

readonly DATA=$*

./out/cpp/Sha256Benchmark $DATA
./out/cppGCGen/Sha256Benchmark $DATA
node out/Sha256Benchmark.js $DATA
node out/Sha256Benchmark.es6.js $DATA
java -jar out/java/Sha256Benchmark.jar $DATA
java -jar out/jvm/Sha256Benchmark.jar $DATA
hl out/Sha256Benchmark.hl $DATA
./out/hl/Sha256Benchmark $DATA
mono out/cs/bin/Sha256Benchmark.exe $DATA
haxe build/sha256/common.hxml --run Sha256Benchmark $DATA
php out/php/index.php $DATA
neko out/Sha256Benchmark.n $DATA
# python3 out/Sha256Benchmark.py $DATA
# lua out/Sha256Benchmark.lua $DATA

# second run to smooth graphs a little
./out/cpp/Sha256Benchmark $DATA
./out/cppGCGen/Sha256Benchmark $DATA
node out/Sha256Benchmark.js $DATA
node out/Sha256Benchmark.es6.js $DATA
java -jar out/java/Sha256Benchmark.jar $DATA
java -jar out/jvm/Sha256Benchmark.jar $DATA
hl out/Sha256Benchmark.hl $DATA
./out/hl/Sha256Benchmark $DATA
mono out/cs/bin/Sha256Benchmark.exe $DATA
haxe build/sha256/common.hxml --run Sha256Benchmark $DATA
php out/php/index.php $DATA
