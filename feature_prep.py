# %%
from dask.distributed import LocalCluster, Client
import dask.dataframe as dd
# %%
cluster = LocalCluster()
client = Client(cluster)
print(client.scheduler_info()['services'])
# %%
df = dd.read_csv('data/sample_orig_2020.txt', sep='|')
# %%
df
# %%
