#!/bin/bash

source benchmark.env

readonly DATA=$*

./out/cpp/Sha512Benchmark $DATA
./out/cppGCGen/Sha512Benchmark $DATA
node out/Sha512Benchmark.js $DATA
node out/Sha512Benchmark.es6.js $DATA
java -jar out/java/Sha512Benchmark.jar $DATA
java -jar out/jvm/Sha512Benchmark.jar $DATA
hl out/Sha512Benchmark.hl $DATA
./out/hl/Sha512Benchmark $DATA
mono out/cs/bin/Sha512Benchmark.exe $DATA
haxe build/sha512/common.hxml --run Sha512Benchmark $DATA
php out/php/index.php $DATA
neko out/Sha512Benchmark.n $DATA
python3 out/Sha512Benchmark.py $DATA
# lua out/Sha512Benchmark.lua $DATA
