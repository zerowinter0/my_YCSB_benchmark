#!/bin/bash

# Exit on error
set -e

# Step 1: Clean the build
echo "Running: make clean"
make clean

rm -rf /tmp/ycsb-leveldb/

# Step 2: Build with specific flags
echo "Running: make BIND_LEVELDB=1 EXTRA_CXXFLAGS=-I/home/alex/XOY-leveldb-exp2/include"
make BIND_LEVELDB=1 EXTRA_CXXFLAGS=-I/home/alex/XOY-leveldb-exp2/include

# Step 3: Load the database
echo "Running: ./ycsb -load -db leveldb -P workloads/workloade -P leveldb/leveldb.properties -s"
./ycsb -load -db leveldb -P workloads/workloada -P leveldb/leveldb.properties -s

# Step 4: Run the workload
echo "Running: ./ycsb -run -db leveldb -P workloads/workloade -P leveldb/leveldb.properties -s"
./ycsb -run -db leveldb -P workloads/workloada -P leveldb/leveldb.properties -s

echo "All steps completed successfully!"
