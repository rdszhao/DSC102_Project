from dask.diagnostics import ProgressBar
import dask.dataframe as dd
from dask_ml.preprocessing import Categorizer, DummyEncoder

ProgressBar().register()

def get_features():
    return dd.read_parquet('s3://ds102-rayz-scratch/labels/*.parquet')

def main():
    pass

if __name__ == '__main__':
    main()