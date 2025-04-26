from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import mysql.connector

# Initialize FastAPI app
app = FastAPI()

# Database connection
def get_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="password",
        database="task_manager"
    )

# Define Pydantic models for task data
class Task(BaseModel):
    title: str
    description: str
    status: str

@app.post("/tasks")
async def create_task(task: Task):
    db = get_db()
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO Tasks (title, description, status) VALUES (%s, %s, %s)",
        (task.title, task.description, task.status)
    )
    db.commit()
    cursor.close()
    db.close()
    return {"message": "Task created successfully"}

@app.get("/tasks")
async def get_tasks():
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Tasks")
    tasks = cursor.fetchall()
    cursor.close()
    db.close()
    return tasks

@app.get("/tasks/{task_id}")
async def get_task(task_id: int):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Tasks WHERE task_id = %s", (task_id,))
    task = cursor.fetchone()
    cursor.close()
    db.close()
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")
    return task

@app.put("/tasks/{task_id}")
async def update_task(task_id: int, task: Task):
    db = get_db()
    cursor = db.cursor()
    cursor.execute(
        "UPDATE Tasks SET title = %s, description = %s, status = %s WHERE task_id = %s",
        (task.title, task.description, task.status, task_id)
    )
    db.commit()
    cursor.close()
    db.close()
    return {"message": "Task updated successfully"}

@app.delete("/tasks/{task_id}")
async def delete_task(task_id: int):
    db = get_db()
    cursor = db.cursor()
    cursor.execute("DELETE FROM Tasks WHERE task_id = %s", (task_id,))
    db.commit()
    cursor.close()
    db.close()
    return {"message": "Task deleted successfully"}
