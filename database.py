import pandas as pd
from sqlalchemy import create_engine

# PostgreSQL connection — apna password daalo
engine = create_engine('postgresql://postgres:8877@localhost:5432/company')

# CSV load karo — LATIN1 encoding ke saath
df = pd.read_csv(r'C:\Users\heman\Downloads\data.csv\data.csv', 
                 encoding='latin-1')

# Column names clean karo
df.columns = ['invoice_no', 'stock_code', 'description', 'quantity',
              'invoice_date', 'unit_price', 'customer_id', 'country']

# Date convert — 'mixed' format auto-detect karega
df['invoice_date'] = pd.to_datetime(df['invoice_date'], format='mixed')

print("✅ Date range:", df['invoice_date'].min(), "to", df['invoice_date'].max())
print("✅ Shape:", df.shape)

# Table replace karke daalo (clean data ke saath)
df.to_sql('online_retail', engine, if_exists='replace', index=False)

print("✅ PostgreSQL mein data successfully daal diya!")