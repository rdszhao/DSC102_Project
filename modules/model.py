from dask.diagnostics import ProgressBar
import dask.dataframe as dd
from dask_ml.linear_model import LogisticRegression
import pickle
import json
import s3fs
import numpy as np

ProgressBar().register()

def get_labels():
    return dd.read_parquet('s3://ds102-rayz-scratch/labels.parquet')

def fit_model(df):
    df = get_labels()
    X, y = df.drop(columns='default'), df.default
    lr = LogisticRegression()
    lr.fit(X, y)
    return lr

def pickl3(model):
    BUCKET_NAME = 's3://ds102-rayz-scratch'
    s3 = s3fs.S3FileSystem(anon=False)
    model_options = { "name": "logistic regression model"}
    json.dump(model_options, s3.open(f"{BUCKET_NAME}/options_{model_options['name'] + str(np.random.randint(10000))}.json",'w'))
    pickle.dump(model, s3.open(f"{BUCKET_NAME}/model_{model_options['name'] + str(np.random.randint(10000))}.pkl",'w'))

def main():
    df = get_labels()
    model = fit_model(df)
    pickl3(model)

if __name__ == '__main__':
    main()