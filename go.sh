#!/usr/bin/sh

export OMP_NUM_THREADS=1
echo "[OK: Sequential]"
./ok_seq.exe |&tee ./runlog_ng_seq.txt 2>&1

echo "[OK: 1 Thread]"
./ok_omp.exe |&tee ./runlog_ng_1omp.txt 2>&1

echo "[OK: 8 Threads]"
export OMP_NUM_THREADS=8
./ok_omp.exe |&tee ./runlog_ng_8omp.txt 2>&1

echo "-----------------------------------------"

export OMP_NUM_THREADS=1
echo "[NG: Sequential]"
./ng_seq.exe |&tee ./runlog_ng_seq.txt 2>&1

echo "[NG: 1 Thread]"
./ng_omp.exe |&tee ./runlog_ng_1omp.txt 2>&1

echo "[NG: 8 Threads]"
export OMP_NUM_THREADS=8
./ng_omp.exe |&tee ./runlog_ng_8omp.txt 2>&1
