import pandas as pd
import sqlalchemy as sqla
from sqlalchemy import create_engine
import streamlit as st
import mysql.connector 
import numpy as np
import matplotlib.pyplot as plt
from sql_data import *
from PIL import Image


st.set_page_config(
    page_title="Manajemen Restoran",
    page_icon="🍔",
)

st.title("Restaurant Management Dashboard")
st.sidebar.success("Select a page above.")

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

