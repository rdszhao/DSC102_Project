from pyspark.sql import SparkSession
from pyspark.sql.functions import when
from pyspark.sql.types import IntegerType

def spark_session():
    return SparkSession.builder.config(
        'spark.jars.packages',
        'org.apache.hadoop:hadoop-aws:2.7.0'
    ).getOrCreate()

def get_features(spark, src='s3://ds102-rayz-scratch/features_parquet/*.parquet'):
    features = spark.read.parquet(src).drop('__null_dask_index__').collect()
    return features

def get_labels(spark, src='s3://ds102-rayz-scratch/performance.txt'):
    labels = spark.read.format('csv').option('delimiter', '|').load(src)
    labels = labels.select('_c0', '_c3', '_c8')
    labels = labels.withColumn('_c3', labels._c3.cast(IntegerType())).withColumn('_c8', labels._c8.cast(IntegerType()))
    labels = labels.withColumn('default', when(labels._c3 >= 90, 1).otherwise(0))
    labels = labels.withColumn('default', when((labels._c8 == 3) | (labels._c8 == 6) | (labels._c8 == 9), 1).otherwise(0))
    labels = labels.select('_c0', 'default').groupby('_c0').max()
    return labels

def get_data(spark, label_src, feat_src):
    return get_features(spark, feat_src), get_labels(spark, label_src)

def processing(spark, out_path='s3://ds102-rayz-scratch/labels'):
    labels, features = get_data(spark)
    full = features.join(labels, features.c20 == labels._c0, 'left')
    full.write.mode('overwrite').save(out_path)

def main():
    spark = spark_session()
    processing(spark)

if __name__ == '__main__':
    main()