import mysql.connector
from mysql.connector import Error
import os

def create_connection():
    # 创建数据库连接
    connection = None
    try:
        connection = mysql.connector.connect(
            host='127.0.0.1',
            port='3306',  # 数据库主机名或IP地址
            database='elm',    # 数据库名称
            user='root',  # 数据库用户名
            password='123456'  # 数据库密码
        )
        if connection.is_connected():
            print("成功连接到数据库")
    except Error as e:
        print(f"错误: '{e}'")
        return None
    return connection

def insert_card_data(connection, image_path, title, subtitle):
    # 读取图片文件
    try:
        with open(image_path, 'rb') as image_file:
            binary_data = image_file.read()
    except FileNotFoundError:
        print(f"文件未找到: {image_path}")
        return

    # 插入数据到card表
    try:
        cursor = connection.cursor()
        sql_insert_query = """INSERT INTO card (image, title, subtitle) VALUES (%s, %s, %s)"""
        record = (binary_data, title, subtitle)
        cursor.execute(sql_insert_query, record)
        connection.commit()
        print("记录插入成功")
    except Error as e:
        print(f"错误: '{e}'")
    finally:
        if connection.is_connected():
            cursor.close()

def main():
    # 替换为你的图片路径、标题和副标题
    image_path = "D:/vx\Have you eaten\imags\鲷鱼饼.png"
    title = '天天特价'
    subtitle = '美食一折起'

    # 创建数据库连接
    connection = create_connection()

    # 插入数据
    if connection is not None:
        insert_card_data(connection, image_path, title, subtitle)
        # 关闭数据库连接
        connection.close()
        print("数据库连接已关闭")

if __name__ == "__main__":
    main()