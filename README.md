
# 🧑‍⚕️ QBeeez - Medical Students' QCM Revision Management System 🧑‍⚕️

**QBeeez** is a comprehensive revision management system designed to support medical students in preparing for QCM (multiple-choice questions) exams. It offers tools to track academic progress, manage quizzes, and access course materials, all while providing a seamless experience for both students and administrators.

---

## 🌟 Features

### 🎛️ Dashboard
- **Admin Analytics**: A dashboard contain all info how much module sous module Semesters students genders(male or female) abonnement...

### 📰 News & Events
- **Accessible to All**: A page for students and staff to stay updated with the latest school events and announcements.

### 🧑‍🏫 Student Management (Admin Only)
- **Manage Students**: Admins can add, update, and delete student records, semesters,module,sousmodule, comments,users,notes,abonnements......
- **Automated Calculation**: Total scores, average, points, and grades are calculated automatically.
- **Grade Comments**: Each student receives a performance comment (Pass, Fail, Pass with Warning).


### 📝 Assessments and Results
- **Assessment Page**: Provides a detailed result page showing grades for each student.
- **Results Page**: Displays students’ progress in each quiz and QCM test, with options to review scores and performance trends.

### 🎥 Learning Resources
- **Video & Document Uploads**: Admins can upload course-related videos and PDFs to support students.
- **PDF Generator**: Easily generate PDFs for student registration and other administrative needs.

### 🔐 Page Access Restrictions
- **Restricted Access**: Certain pages are accessible only to specific user roles (e.g., Admins only).

### 📊 Quiz and QCM Features
- **Question Randomization**: The order of questions is randomized in each quiz.
- **Quiz History**: Past quiz scores are stored and can be viewed within each category.
- **Results Storage**: All QCM results are stored under each user’s profile.
- **Real-time Progress Charts**: Daily, weekly, and monthly charts show students' performance in terms of scores, correct/incorrect answers, and progress.
- **Category Success Rate**: Track success rates across categories on a progress page.
- **Question Feedback**: Provides explanations for each answer during revision mode, and the correct answers are shown only at the end in exam mode.
- **Performance Insights**: Charts at the end of each QCM summarize correct and incorrect answers.
- - **Comment systeme **: student can create a discussion beetwen each other for every question and can use mode anonyme or normal mode so can show or hide his name...   
### 🗒️ Notes & Annotations
- **Notes Feature**: Students can add, edit, and remove personal notes for each question or module, supporting their revision process.

### 💬 Support & Communication
- **Support Chat**: A dedicated chat feature for students to receive help and support.

### 💰 Payment & Subscription System
- **Subscription Management**: A semester-based subscription model with flexible payment options.
- **Payment Methods**: Bank transfers and point-based purchases are supported.

### 🔎 Search System
- **Advanced Search**: A search system allowing students to quickly find resources, modules, quizzes, and more.

---

# 🚀 Installation

# ══════════════════════════════════════════════════════════════════════════════
# Clone the Repository
# ══════════════════════════════════════════════════════════════════════════════

echo "Cloning the repository..."
git clone https://github.com/Rochdi7/QBeeez-QCM-Revision-Management-System.git
cd QBeeez-QCM-Revision-Management-System || exit

# ══════════════════════════════════════════════════════════════════════════════
# Set Up a Virtual Environment (recommended)
# ══════════════════════════════════════════════════════════════════════════════

echo "Setting up a virtual environment..."
python3 -m venv venv
# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate  # On Windows use `venv\Scripts\activate`

# ══════════════════════════════════════════════════════════════════════════════
# Install Dependencies
# ══════════════════════════════════════════════════════════════════════════════

echo "Installing project dependencies from requirements.txt..."
pip install -r requirements.txt

# ══════════════════════════════════════════════════════════════════════════════
# Set Up the Database
# ══════════════════════════════════════════════════════════════════════════════


cat <<EOT >> settings.py
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'your_database_name',
        'USER': 'your_database_user',
        'PASSWORD': 'your_database_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
EOT


# ══════════════════════════════════════════════════════════════════════════════
# Run Database Migrations
# ══════════════════════════════════════════════════════════════════════════════

python manage.py migrate

# ══════════════════════════════════════════════════════════════════════════════
# Create a Superuser
# ══════════════════════════════════════════════════════════════════════════════

python manage.py createsuperuser

# ══════════════════════════════════════════════════════════════════════════════
# Start the Development Server
# ══════════════════════════════════════════════════════════════════════════════
python manage.py runserver

# ══════════════════════════════════════════════════════════════════════════════
# Access Information
# ══════════════════════════════════════════════════════════════════════════════

# Open your web browser and navigate to http://127.0.0.1:8000/ to access the application.


---

## 🛠️ Usage

1. **Launch the Application**: Log in using your credentials.
2. **Admin Functions**:
   - Manage students, upload resources, and generate analytics.
   - View detailed insights into students' quiz performance and set up new quizzes and exams.
3. **Student Functions**:
   - Access quizzes, view performance trends, and review course materials.
   - Use the dashboard to monitor your revision progress across daily, weekly, and monthly metrics.
4. **Exam Mode & Revision Mode**:
   - **Exam Mode**: Answers are only shown after completing the quiz.
   - **Revision Mode**: Students can view correct answers after each question and make notes on individual questions or modules.

---

## 💻 Technologies Used

- **Python Django**: For a rich and interactive user interface.
- **MySQL**: Database backend for managing users, quiz data, and analytics.
- **HTML CSS JAVASCRIPT BOOTSTRAP** 
---

## 👥 Contributors

- **Rochdi Karouali** ✨
---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---
