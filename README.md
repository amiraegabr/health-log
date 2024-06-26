# Healthlog

## About
Health log mobile application is  a Flutter-based mobile application designed to help users monitor and manage their health. The app aims to provide an easy-to-use interface for users to set reminders, gather their medical files in one place, and get help to early diagnose their symptoms using a ML model.

## Features
* Set up a profile with users' health data.
* Set reminders for medication, appointments, and health check-ups.
* Save health records and statistics.
* Symptom diagnosis using a machine learning model.

## Team Members
* [Amira E Gabr]   - Team Lead, Designer, Developer
  (https://github.com/amiraegabr) , (https://www.linkedin.com/in/amiraegabr)
* [Fatma Mostafa]  - Developer
  (https://github.com/fatmasalem277) , (https://linkedin.com/in/fatma-mostafa-744135218)
* [Yousef Mohamed] - Developer
  (https://github.com/joe655) , (https://eg.linkedin.com/in/yousef-mohamed0) 
* [Rawan Ahmed] -Developer
  (https://github.com/rawannahmedd) , (http://www.linkedin.com/in/rawann-ahmeed)
* [Assem Kandil] -Developer
  (https://github.com/assemkandil) , (https://www.linkedin.com/in/asem-kandil-842a27242)

## Technologies Used
* Flutter & Dart
* Firebase (backend and authentication)
* Python (for ML model)

## Symptom Diagnosis Model
The symptom diagnosis feature uses a Python machine learning model trained on a dataset of symptoms, description for each and corresponding diagnoses. 

## Model Details
* Model type: Random Forest
* Training datasets:
  1. Each disease and its symptoms 
  2. Symptom_Description: Diseases description 
  3. Symptom_precaution: suggestions to be done in case of each diagnosis
  4. Symptom-Severity: Every symptom and its weight
* Accuracy: 99.187%

## Getting Started
First run ML model:
1. Open preffered python IDE (eg.pycharm)
2. Open ml model file
3. Run "uvicorn main:app —reload" in the terminal

Then to run the app:
1. Clone the repository: `git clone https://github.com/amiraegabr/healthlog.git`
2. Open the project in your preferred IDE (e.g., Android Studio, Visual Studio Code)
3. Run the app on an emulator or physical device

## Version
Current version: 1.0
