import sys 
import pandas as pd

#A small script to convert parquet file to csv
file_name = sys.argv[1]
pd.read_parquet(file_name).to_csv(file_name.replace('.parquet', '.csv'), index=False)