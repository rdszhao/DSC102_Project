# Setup
Once credentials are properly configured, everything can be run with `sh client.sh`, which would launch an EC2 instance from the `cli` that would manage everything from there. The instance does the feature engineering through dask on itself, then launches an EMR instance that uses `Spark` to do the label generation, and finally fits and serializes a model that is sent to `S3`. Both the EC2 and EMR instance terminate at the end of this sequence.

### Feature Engineering
Aside from labelling and filtering out null values, categorical features were on one-hot encoded and pairs of features with high multicollinearity (> 0.9) were dropped. The final features were then uploaded as `.parquet` to `S3`.

### Label Generation
The label `default` was created as a boolean indicator of whether the days deliquent and the zero-balance codes met the standards for default. The labels were then grouped by loan sequence number, joined with the features, and uploaded as `label` to `S3`.

### Model Fitting
The `label` is imported from `S3` and fit into a `dask` Logistic Regressor, which was pickled and uploaded to `S3`.

### Scaling Up
The most obvious way to speed and scale up is to use more powerful and larger compute instances. This of course becomes expensive quickly and this cost consideration needs to weighed with performance considerations when building systems.

### Dataflow Diagram
![Dataflow](/dataflow.JPG)

### Dask UI
![daskui](/daskui.png)