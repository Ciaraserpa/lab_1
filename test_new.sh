#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab_1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab_1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /lab_1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../map-reduce-test-data/access.log /lab_1/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file ../../lab_1/lab_1/mapper_new.py -mapper ../../lab_1/mapper_new.py \
-file ../../lab_1/lab_1/reducer_new.py -reducer ../../lab_1/reducer_new.py \
-input /logstat2/input/* -output /lab_1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /lab_1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab_1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab_1/output/
../../stop.sh
