#!/bin/bash

# Exit on error
set -e

# Step 1: Clean the build and old data
make clean
rm -rf ./ycsb-leveldb-data/

# Step 2: Build with specific flags
make BIND_LEVELDB=1 EXTRA_CXXFLAGS=-I/home/alex/XOY-leveldb-exp2/include

# Step 3: Load the database
./ycsb -load -db leveldb -P workloads/workloada -P leveldb/leveldb.properties -s

# Step 4: Run the workload
./ycsb -run -db leveldb -P workloads/workloada -P leveldb/leveldb.properties -s

echo "All steps completed successfully!"