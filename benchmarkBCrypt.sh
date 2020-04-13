#!/bin/bash

source benchmark.env

readonly DATA=$*

./out/cpp/BCryptBenchmark $DATA
./out/cppGCGen/BCryptBenchmark $DATA
node out/BCryptBenchmark.js $DATA
node out/BCryptBenchmark.es6.js $DATA
java -jar out/java/BCryptBenchmark.jar $DATA
java -jar out/jvm/BCryptBenchmark.jar $DATA
hl out/BCryptBenchmark.hl $DATA
./out/hl/BCryptBenchmark $DATA
mono out/cs/bin/BCryptBenchmark.exe $DATA
haxe build/bcrypt/common.hxml --run BCryptBenchmark $DATA
php out/php/index.php $DATA
neko out/BCryptBenchmark.n $DATA
# python3 out/BCryptBenchmark.py $DATA
# lua out/BCryptBenchmark.lua $DATA

# second run to smooth graphs a little
./out/cpp/BCryptBenchmark $DATA
./out/cppGCGen/BCryptBenchmark $DATA
node out/BCryptBenchmark.js $DATA
node out/BCryptBenchmark.es6.js $DATA
java -jar out/java/BCryptBenchmark.jar $DATA
java -jar out/jvm/BCryptBenchmark.jar $DATA
hl out/BCryptBenchmark.hl $DATA
./out/hl/BCryptBenchmark $DATA
mono out/cs/bin/BCryptBenchmark.exe $DATA
