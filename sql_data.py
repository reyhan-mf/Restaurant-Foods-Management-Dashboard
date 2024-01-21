import pandas as pd
import sqlalchemy as sqla
from sqlalchemy import create_engine
import streamlit as st
import mysql.connector 
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

db = sqla.create_engine('mysql://root:@localhost/restoran')

def info(a):
    return pd.read_sql(a, db).info()

def sqlc(a):
   return pd.read_sql_query(a, db)

def showtables():
    print(sqlc("SHOW TABLES"))

def desc(a):
    return sqlc(f"DESC {a}")
def selecttable(a):
    return sqlc(f"SELECT * FROM {a}")
def endl(n):
    for i in range(n):
        print("\n")


# In[ ]:





# In[6]:


host = "localhost"
user = "root1"
password = "root"
database = "restoran"
address_table = "address"
customers_table = "customers"
items_table = "item"
food_table ="foods"

engine = create_engine(f"mysql+mysqlconnector://{user}:{password}@{host}/{database}")




# In[ ]:





# In[77]:


#daftar makanan
daftar_harga_makanan_df = sqlc(f"""SELECT
  foods.food,
  foods.item_cat,
  foods.item_price
FROM
  foods
""")


# daftar semua pendapatan restoran per hari
total_pendapatan_df = sqlc(f"""SELECT
  date,
  SUM(price) AS total_pendapatan
FROM
  orders
GROUP BY
  date""")

total_pendapatan_df.head()

def total_pendapatan_chart():
  plt.figure(figsize=(15, 6))
  plt.plot(total_pendapatan_df["date"], total_pendapatan_df["total_pendapatan"], marker='o', linewidth=2, color="#72BCD4")
  plt.title("Total Pendapatan per Hari ", loc="center", fontsize=20)
  plt.xlabel("Days", fontsize=14)
  plt.ylabel("Pendapatan", fontsize=14)
  plt.xticks(rotation=45, ha='right', fontsize=10)
  plt.yticks(fontsize=10)
  plt.grid(axis='y', linestyle='--', alpha=0.7)
  plt.tight_layout()
  plt.show()
  return plt




# daftar total pesanan restoran per hari
total_pesanan_df = sqlc(f"""SELECT
  date,
  COUNT(quantity) AS total_pesanan
FROM
  orders
GROUP BY
  date""")
total_pesanan_df.head()

def total_pesanan_chart():
  plt.figure(figsize=(15, 6))
  plt.plot(total_pesanan_df["date"], total_pesanan_df["total_pesanan"], marker='o', linewidth=2, color="#72BCD4")
  plt.title("Total Pesanan Per Hari ", loc="center", fontsize=20)
  plt.xlabel("Days", fontsize=14)
  plt.ylabel("Number of Orders", fontsize=14)
  plt.xticks(rotation=45, ha='right', fontsize=10)
  plt.yticks(fontsize=10)
  plt.grid(axis='y', linestyle='--', alpha=0.7)
  plt.tight_layout()
  plt.show()
  return plt

#daftar semua pelanggan yang paling sering memesan
pelanggan_terbaik_df = sqlc(f"""SELECT
  c.cust_id,
  CONCAT(c.cust_firstname, ' ', c.cust_lastname) AS nama_pelanggan,
  COUNT(*) AS jumlah_pesanan,
  SUM(o.price) AS total_harga 
FROM
  orders o
JOIN
  customers c ON o.cust_id = c.cust_id
GROUP BY
  c.cust_id
ORDER BY
  jumlah_pesanan DESC;
""")

def pelanggan_terbaik_chart():
  fig, ax = plt.subplots(figsize=(15, 6))  # Use only one subplot

  # Warna yang digunakan
  colors = ["RED", "#72BCD4", "#72BCD4", "#72BCD4", "#72BCD4"]

  # Plotting untuk Recency
  sns.barplot(y="total_harga", x="nama_pelanggan", data=pelanggan_terbaik_df.sort_values(by="total_harga", ascending=False).head(5), palette=colors, ax=ax)
  ax.set_ylabel(None)
  ax.set_xlabel(None)
  ax.set_title("Customer Terbaik", loc="center", fontsize=18)
  ax.tick_params(axis='x', labelsize=15)

  plt.show()
  return fig


# In[271]:


#kota dengan pesanan terbanyak
best_region_df = sqlc(f"""SELECT
  a.add_id,
  a.delivery_address,
  a.delivery_city,
  COUNT(o.order_id) AS total_pesanan,
  SUM(o.price) AS total_harga
FROM
  orders o
JOIN
  foods f ON o.food = f.food
JOIN
  address a ON o.add_id = a.add_id
WHERE
  o.delivery = 1
GROUP BY
  a.add_id, a.delivery_address, a.delivery_city
ORDER BY
  total_pesanan DESC
""")

best_region_df.head()




def best_region_chart():
  fig, ax = plt.subplots(figsize=(12, 6))  

  colors = ["#72BCD4", "#D3D3D3", "#D3D3D3", "#D3D3D3", "#D3D3D3"]

  sns.barplot(x="total_harga", y="delivery_address", data=best_region_df.sort_values(by="total_harga", ascending=False).head(5), palette=colors, ax=ax, orient="h")
  ax.set_ylabel(None)
  ax.set_title("5 Best Performing Region", loc="center", fontsize=15)
  ax.tick_params(axis='x', labelsize=12)

  plt.show()
  return fig


#Pesanan terlaris
best_sellers_df = sqlc(f"""SELECT
  foods.food,
  COUNT(*) AS jumlah_pesanan
FROM
  orders
  JOIN foods ON orders.food = foods.food
GROUP BY
  foods.food
ORDER BY
  jumlah_pesanan DESC
""")
best_sellers_df.head()

def pesanan_terlaris_chart():
  fig, ax = plt.subplots(figsize=(12, 6))  

  colors = ["#72BCD4", "#D3D3D3", "#D3D3D3", "#D3D3D3", "#D3D3D3"]

  sns.barplot(x="jumlah_pesanan", y="food", data=best_sellers_df.head(5), palette=colors, ax=ax, orient="h")
  ax.set_ylabel(None)
  ax.set_title("5 Best Performing Products", loc="center", fontsize=15)
  ax.tick_params(axis='x', labelsize=12)

  plt.show()
  return fig


# In[78]:


#Makanan yang belum pernah dipesan
unbought_foods_df = sqlc(f"""SELECT
  f.food
FROM
  foods f
WHERE
  NOT EXISTS (
    SELECT *
    FROM orders o
    WHERE o.food = f.food
  );
""")


# In[79]:


# Kuantitas Semua makanan
quantity_df = sqlc(f"""SELECT food, SUM(quantity) AS total_quantity
FROM inventory
GROUP BY food;
""")

quantity_df['total_quantity'] = quantity_df['total_quantity'].astype(str).str.rstrip('.0')


# In[131]:


#Stok dan harga bahan makanan yang dibutuhkan
stok_bahan_df = sqlc(f"""SELECT i.food, i.ing_name, i.int_price, COALESCE(inventory.quantity, 0) AS stock
FROM ingredient i
LEFT JOIN inventory ON i.food = inventory.food
ORDER BY i.food, i.ing_name;
""")


# In[132]:


#Detail Pesanan
order_details_df = sqlc(f"""SELECT orders.order_id, customers.cust_firstname, customers.cust_lastname, foods.food, orders.date, orders.quantity, orders.price
FROM orders
JOIN customers ON orders.cust_id = customers.cust_id
JOIN foods ON orders.food = foods.food;
""")


# In[163]:


#Daftar Karyawan
staff_df = sqlc(f"""SELECT kasir.unit_restoran_id, kasir.first_name, kasir.last_name, kasir.gaji, 'Kasir' AS posisi
FROM kasir
INNER JOIN unit_restoran ON kasir.unit_restoran_id = unit_restoran.unit_restoran_id
UNION
SELECT koki.unit_restoran_id, koki.first_name, koki.last_name, koki.gaji, 'Koki' AS posisi
FROM koki
INNER JOIN unit_restoran ON koki.unit_restoran_id = unit_restoran.unit_restoran_id
UNION
SELECT kurir.unit_restoran_id, kurir.first_name, kurir.last_name, kurir.gaji, 'Kurir' AS posisi
FROM kurir
INNER JOIN unit_restoran ON kurir.unit_restoran_id = unit_restoran.unit_restoran_id
ORDER BY unit_restoran_id ASC
""")



#Jumlah Pesanan dari Dine-In dan Delivery
dine_delivery_df = sqlc(f"""SELECT
  date,
  unit_restoran_id,
  COUNT(order_id) AS jumlah_pesanan
FROM
  orders
WHERE
  unit_restoran_id IN (1, 2)
GROUP BY
  date, unit_restoran_id
ORDER BY
  date, unit_restoran_id;
""")


def dine_delivery_chart():
  unit_1_df = dine_delivery_df[dine_delivery_df['unit_restoran_id'] == 1]
  unit_2_df = dine_delivery_df[dine_delivery_df['unit_restoran_id'] == 2]

  plt.figure(figsize=(15, 6))

  plt.plot(unit_1_df["date"], unit_1_df["jumlah_pesanan"], marker='o', linewidth=2, color="red", label='Dine-In (Unit 1)')

  plt.plot(unit_2_df["date"], unit_2_df["jumlah_pesanan"], marker='o', linewidth=2, color="blue", label='Delivery (Unit 2)')

  plt.title("Total Pesanan Per Hari (Dine-in VS Delivery)", loc="center", fontsize=20)
  plt.xlabel("Days", fontsize=14)
  plt.ylabel("Number of Orders", fontsize=14)

  plt.xticks(rotation=45, ha='right', fontsize=10)
  plt.yticks(fontsize=10)

  plt.grid(axis='y', linestyle='--', alpha=0.7)

  plt.legend()

  plt.tight_layout()
  plt.show()
  return plt


dine_delivery_income_df = sqlc(f"""SELECT
  date,
  unit_restoran_id,
  SUM(price) AS total_pendapatan
FROM
  orders
WHERE
  unit_restoran_id IN (1, 2)
GROUP BY
  date, unit_restoran_id
ORDER BY
  date, unit_restoran_id;
""")

def dine_delivery_income_chart():
    unit_1_df = dine_delivery_income_df[dine_delivery_income_df['unit_restoran_id'] == 1]
    unit_2_df = dine_delivery_income_df[dine_delivery_income_df['unit_restoran_id'] == 2]

    plt.figure(figsize=(15, 6))

    plt.plot(unit_1_df["date"], unit_1_df["total_pendapatan"], marker='o', linewidth=2, color="red", label='Dine-In (Unit 1)')

    plt.plot(unit_2_df["date"], unit_2_df["total_pendapatan"], marker='o', linewidth=2, color="blue", label='Delivery (Unit 2)')

    plt.title("Total Pendapatan Per Hari (Dine-in VS Delivery)", loc="center", fontsize=20)
    plt.xlabel("Days", fontsize=14)
    plt.ylabel("Number of Orders", fontsize=14)

    plt.xticks(rotation=45, ha='right', fontsize=10)
    plt.yticks(fontsize=10)

    plt.grid(axis='y', linestyle='--', alpha=0.7)

    plt.legend()

    plt.tight_layout()
    plt.show()
    return plt

#Pesanan terlaris berdasarkan income
best_sellers_by_income_df = sqlc(f"""SELECT
  foods.food,
  SUM(price) AS income
FROM
  orders
  JOIN foods ON orders.food = foods.food
GROUP BY
  foods.food
ORDER BY
  income DESC
""")

def best_sellers_by_income_chart():
  fig, ax = plt.subplots(figsize=(12, 6))  

  colors = ["#72BCD4", "#D3D3D3", "#D3D3D3", "#D3D3D3", "#D3D3D3"]

  sns.barplot(x="income", y="food", data=best_sellers_by_income_df.head(5), palette=colors, ax=ax, orient="h")
  ax.set_ylabel(None)
  ax.set_title("5 Best Performing Products", loc="center", fontsize=15)
  ax.tick_params(axis='x', labelsize=12)

  plt.show()
  
  return fig


def orders_vs_income_products_chart():
  fig, ax = plt.subplots(nrows=1, ncols=2, figsize=(24, 6))

  colors = ["#72BCD4", "#D3D3D3", "#D3D3D3", "#D3D3D3", "#D3D3D3", "#D3D3D3"]
  
  sns.barplot(x="income", y="food", data=best_sellers_by_income_df.head(6), palette=colors, ax=ax[0])
  ax[0].set_ylabel(None)
  ax[0].set_xlabel(None)
  ax[0].set_title("Best Products by Income", loc="center", fontsize=15)
  ax[0].tick_params(axis ='y', labelsize=12)
  
  sns.barplot(x="jumlah_pesanan", y="food", data=best_sellers_df.sort_values(by="jumlah_pesanan", ascending=False).head(6), palette=colors, ax=ax[1])
  ax[1].set_ylabel(None)
  ax[1].set_xlabel(None)
  ax[1].invert_xaxis()
  ax[1].yaxis.set_label_position("right")
  ax[1].yaxis.tick_right()
  ax[1].set_title("Best Products by Total Orders", loc="center", fontsize=15)
  ax[1].tick_params(axis='y', labelsize=12)
  
  plt.suptitle("Income VS Total Orders", fontsize=20)
  plt.show()
  return fig

contact = sqlc("SELECT no_telp from unit_restoran")

no_telp_array = contact['no_telp'].to_numpy()


column_mapping = {
    'order_id': 'Order ID',
    'cust_firstname': 'Nama Pertama Pelanggan',
    'cust_lastname': 'Nama Belakanga Pelanggan',
    'Food' : 'Makanan',
    'quantity' : 'Kuantitas',
    'price' : 'Harga'
}

order_details_df = order_details_df.rename(columns=column_mapping)
order_details_df['Harga'] = order_details_df['Harga'].astype(str).str.replace(',0000', '')
