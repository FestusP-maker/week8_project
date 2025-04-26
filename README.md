# week8_project

Description
This project consists of two components:

Question 1:
A fully designed relational database using MySQL for a Task Manager application.
It includes tables with primary keys, foreign keys, constraints, and sample data.

Question 2:
A simple but complete CRUD API built with FastAPI (Python) connected to the MySQL database.
The API allows users to create, read, update, and delete tasks and users.

🛠️ How to Run/Setup the Project
1. Database Setup
Import the provided SQL script (task_manager.sql) into your MySQL server.

You can import the SQL using tools like phpMyAdmin, MySQL Workbench, or the terminal.

Using MySQL CLI:

bash

mysql -u root -p < task_manager.sql
Or manually in Workbench:

Open MySQL Workbench.

Connect to your server.

Open the SQL script and run it.

2. API Setup
Ensure Python 3.8+ is installed.

Install required Python packages:

bash

pip install fastapi uvicorn mysql-connector-python
Run the API server:

bash

python -m uvicorn main:app --reload
Access the API documentation at:
👉 http://127.0.0.1:8000/docs

🖼️ Screenshot / ERD Diagram
[Insert your ERD here]

If you have an image saved locally, you can include it like this in Markdown:

markdown

![ERD Diagram](path_to_your_image/erd.png)
If you have a link to an online ERD (e.g., dbdiagram.io, draw.io), just paste the link:

👉 View ERD Diagram

📦 Deliverables
For Question 1 (Database Design)
task_manager.sql file
(includes CREATE DATABASE, CREATE TABLE, constraints, sample INSERT statements).

SQL file is well-commented to explain tables, relationships, and design decisions.

For Question 2 (CRUD API Development)
Source Code Folder Structure:

css

week8_project/
│
├── main.py
├── requirements.txt
├── README.md
├── task_manager.sql
└── (Optional) erd.png
main.py contains all API routes.

requirements.txt includes:

nginx

fastapi
uvicorn
mysql-connector-python
✅ Final Note
This project showcases fundamental backend development skills — combining SQL database design with modern API development using FastAPI.

🏆 Professional Tip for Final Touch
Comment your .sql file clearly. Example:

sql

-- Creating the users table
CREATE TABLE users (...);
Comment your main.py clearly too. Example:

python

# Create a new task
@app.post("/tasks")
def create_task(task: Task):
    ...