from dask.diagnostics import ProgressBar
import dask.dataframe as dd
# from dask.distributed import LocalCluster, Client
import dask.array as da
from dask_ml.preprocessing import Categorizer, DummyEncoder
from sklearn.pipeline import make_pipeline
import pandas as pd
import numpy as np

# if __name__ == '__main__':
#     client = Client('172.31.2.54:8786')
# print(client.scheduler_info()['services'])

ProgressBar().register()