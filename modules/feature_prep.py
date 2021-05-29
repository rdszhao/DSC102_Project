# %%
from dask.diagnostics import ProgressBar
import dask.dataframe as dd
# from dask.distributed import LocalCluster, Client
import dask.array as da
from dask_ml.preprocessing import Categorizer, DummyEncoder
from sklearn.pipeline import make_pipeline
import pandas as pd
import numpy as np
# %%
# if __name__ == '__main__':
#     client = Client('172.31.2.54:8786')
# print(client.scheduler_info()['services'])

ProgressBar().register()
def get_features():
    return dd.read_csv('s3://ds102-rayz-scratch/origination.txt', sep='|', blocksize=None, dtype={25: 'object'})

def process(df):
    df.columns = [f"c{i}" for i in range(1, len(df.columns)+1)]
    df = df.set_index('c20')
    df.persist()

    # PREPROCESSING
    drops = 'c4 c27'.split()
    df['c3'] = (df['c3'] == 'Y').astype(int)
    df['c32'] = df['c4'].astype(str).str[:4].astype(int)
    df['c33'] = df['c4'].astype(str).str[4:].astype(int)
    df['c5'] = df['c5'].fillna(0)
    df['c6'] = df['c6'].replace(999, pd.NA)
    df['c7'] = df['c7'].replace(99, -1)
    df['c8'] = df['c8'].replace(9, 'N').astype('category')
    df['c9'] = df['c9'].replace(999, pd.NA)
    df['c10'] = df['c10'].replace(999, pd.NA)
    df['c12'] = df['c12'].replace(999, pd.NA)
    df['c14'] = df['c14'].replace(9, 'N').astype('category') # OHE
    df['c15'] = (df['c15'] == 'Y').astype(int)
    df['c16'] = (df['c16'] == 'FRM').astype(int)
    df['c17'] = df['c17'].astype('category') # OHE
    df['c18'] = df['c18'].replace(99, 'N').astype('category') # OHE
    df['c19'] = df['c19'].fillna(0)
    df['c21'] = df['c21'].replace(9, 'U').astype('category') # OHE
    df['c23'] = df['c23'].replace(99, pd.NA)
    df['c24'] = df['c24'].astype('category') # OHE
    df['c25'] = df['c25'].astype('category') # OHE
    df['c26'] = (df['c26'] == 'Y').astype(int)
    df['c28'] = (df['c28'] == 'H').astype(int)
    df['c29'] = (df['c29'] == 'Y').astype(int)
    df['c30'] = df['c30'].replace(9, 4)
    df['c31'] = (df['c31'] == 'Y').astype(int)
    df = df.drop(columns=drops).dropna()

    # OHE FOR CATEGORICALS
    pipe = make_pipeline(Categorizer(), DummyEncoder())
    hots = 'c8 c14 c17 c18 c21 c24 c25'.split()
    dummies = pipe.fit_transform(df[hots])
    df = dd.merge(df, dummies, left_index=True, right_index=True)
    df = df.drop(columns=hots)

    # DROPPING MULTICOLLINEARITIES
    quants = list(df.columns)
    cols = np.array(quants)
    corr_threshold = 0.9
    corr = df[cols].corr().abs().values
    corr = corr.compute_chunk_sizes()
    corr = da.triu(corr)
    out = (corr != 1) & (corr > corr_threshold)
    out = out.compute()
    cols_to_remove = []
    for o in out:
        cols_to_remove += list(cols[o])
    cols_to_remove = list(set(cols_to_remove))
    return df.drop(columns=cols_to_remove).reset_index()

# EXPORT
def export_parquet(df):
    df.to_parquet('https://ds102-rayz-scratch.s3-us-west-2.amazonaws.com/features_parquet')

def main():
    df = get_features()
    df = process(df)
    export_parquet(df)

if __name__=='__main__':
    main()
# %%
