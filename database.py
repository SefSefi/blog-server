import mysql.connector as mysql
from settings import dbpwd


class Database:
    def __init__(self, host, user, password, database):
        self.host = host
        self.user = user
        self.password = password
        self.database = database
        self.connection = None

    def connect(self):
        try:
            self.connection = mysql.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database
            )
            if self.connection.is_connected():
                print("Connected to the MySQL database")
        except mysql.Error as error:
            print("Error while connecting to MySQL:", error)

    def disconnect(self):
        if self.connection.is_connected():
            self.connection.close()
            print("Disconnected from the MySQL database")


db = Database(host="localhost", user="root", password=dbpwd, database="blog")
