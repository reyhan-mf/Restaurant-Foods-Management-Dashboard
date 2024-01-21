# Restaurant Foods and Sales Management Dashboard
## Project Description
Welcome to the Restaurant Dashboard Project, a comprehensive analysis tool designed for efficient management and analysis of food stocks and sales. This project utilizes MySQL as the database backbone, housing crucial information on food items and customer transactions. The dashboard, crafted using Python with matplotlib, numpy, and streamlit, provides an interactive and visually compelling interface. Matplotlib enables the creation of insightful charts, numpy ensures accurate numerical computations, and streamlit offers a user-friendly experience. Seamlessly integrating technology and culinary management, this dashboard empowers stakeholders with real-time insights, optimizing decision-making in food stock management and sales performance. Explore the various features, from dynamic sales trends to interactive data points, as we embark on a culinary journey driven by data analytics and technological innovation.

## ERD and Table
![erd](https://raw.githubusercontent.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/main/erd.jpg)

![fisik](https://raw.githubusercontent.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/main/fisik.jpg)

## Core Features
Below are the feature of what i've created in this project for analyzing sales and foods management.

### Foods Menu
![foods](https://github.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/blob/main/menu.png?raw=true)

### Detail Orders History
![history](https://github.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/blob/main/detail.png?raw=true)

### Orders Chart
![chart1](https://github.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/blob/main/orders_chart1.png?raw=true)
![chart2](https://github.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/blob/main/orders_chart2.png?raw=true)

### Stocks and Quantity
![stocks](https://github.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/blob/main/sorted_stocks.png?raw=true)
![qty](https://github.com/reyhan-mf/Restaurant-Foods-Management-Dashboard/blob/main/sorted_quantity.png?raw=true)


## Prerequisites
* XAMPP is already Installed
* MySQL is already Installed
* Python latest version is already Installed


## Setup environment
```
conda create --name main-ds python=3.9
conda activate main-ds
pip install numpy pandas scipy matplotlib seaborn jupyter streamlit babel mysql-connector-python

```

## Steps
```
1. Open XAMPP start Apache and MySQL
2. access url localhost/phpmyadmin/ in your browser
3. import SQL in repo to your database
4. Open home.py, in my case i'm using visual studio code (make sure your directory is right.)
5. Open terminal and run the code, it will told you to run streamlit run \your_path
```





