--CREATE DATABASE

CREATE DATABASE task_manger;

----use
USE task_manger;

-- Create 'Tasks' table
CREATE TABLE Tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status ENUM('pending', 'in-progress', 'completed') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data for tasks
INSERT INTO Tasks (title, description, status)
VALUES
('Task 1', 'Complete the project documentation', 'pending'),
('Task 2', 'Review the pull requests', 'in-progress'),
('Task 3', 'Deploy the application', 'completed');
