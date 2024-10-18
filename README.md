
# My First Rails & Tailwind Project

Welcome to my first project built using **Ruby on Rails** and **Tailwind CSS**. This project serves as a learning journey into these frameworks, so please be aware that there may be **inconsistencies** and **minor bugs** as I refine my skills. Your understanding and feedback are much appreciated!

## Features Overview

After you **register** or **log in**, you will have access to the dashboard, which includes several menu items. However, **only the "Overview" and "Memo" sections** are fully developed with full **CRUD functionality**. Since the design for the remaining sections is repetitive, I’ve limited them to **show pages** only.

## How to Run the Application Using Docker Compose

This project is designed to be easily set up with **Docker Compose**. Here's how to get everything running:

### Step 1: Clone the Repository

First, clone this repository to your local machine:

```bash
git clone <repository-url>
cd <repository-name>
```

### Step 2: Set Up Environment Variables

Before starting the app, you’ll need to configure some environment variables in a `.env` file in the root of the project. Create this file and add the following keys with their respective values:

```bash
# Rails-App Variables
RAILS_ENV=development
RAILS_MASTER_KEY=55646d885a94ba0f0335862cf0a7aeb5

# PostgreSQL Database Variables
POSTGRES_USER=otor_erp
POSTGRES_PASSWORD=postgres
POSTGRES_DB=otor_erp_development
DATABASE_URL=postgres://otor_erp:postgres@db:5432/otor_erp_development
```

Make sure to replace `<Your_Rails_Master_Key>` with the value found in your `config/master.key`.

### Step 3: Start the Application with Docker Compose

Once you have the environment variables in place, you can start the application using Docker Compose:

```bash
docker-compose up --build
```

This command will build and run the **Rails app** and **PostgreSQL database** inside Docker containers. You can access the app via `http://localhost:3000` in your browser.

### Step 4: Access the Application Container

To run database-related commands such as seeding, you’ll need to get inside the Rails application container. Use the following command to access the container's shell:

```bash
docker-compose exec web /bin/bash
```

Once inside the container, you can seed the database by running:

```bash
rails db:seed
```

This will populate the database with initial data so that you have something to work with.

---

I hope you enjoy exploring this project. While it’s still a work in progress, I look forward to refining it and improving based on your feedback!
