# PostgreSQL Database Setup

This Django portfolio application is now configured to use PostgreSQL database hosted on Render.

## Database Configuration

- **Database URL**: `postgresql://portfolio_u2pz_user:8HKmUljB5ESxLwDwuR9Wa6kk10DqFE8K@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz`
- **Host**: dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com
- **Database**: portfolio_u2pz
- **User**: portfolio_u2pz_user

## How to Run the Application

### Option 1: Using the Python Script (Recommended)
```bash
cd portfolio_project
python run_server.py
```

### Option 2: Using the Batch File (Windows)
```bash
cd portfolio_project
run_with_postgresql.bat
```

### Option 3: Manual Environment Variable
```bash
cd portfolio_project
set DATABASE_URL=postgresql://portfolio_u2pz_user:8HKmUljB5ESxLwDwuR9Wa6kk10DqFE8K@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz
python manage.py runserver
```

## Access Information

- **Application URL**: http://127.0.0.1:8000
- **Admin Panel**: http://127.0.0.1:8000/admin
- **Admin Username**: admin
- **Admin Password**: admin123

## Database Management

### Run Migrations
```bash
python run_server.py  # This will automatically run migrations
```

### Create Superuser (if needed)
```bash
set DATABASE_URL=postgresql://portfolio_u2pz_user:8HKmUljB5ESxLwDwuR9Wa6kk10DqFE8K@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz
python manage.py createsuperuser
```

### Connect via Render CLI
```bash
render psql dpg-d27fkmmuk2gs73e47g30-a
```

## Dependencies

The following packages are required and already installed:
- `psycopg2-binary==2.9.9` - PostgreSQL adapter for Python
- `dj-database-url==2.1.0` - Database URL parser for Django
- `python-decouple==3.8` - Environment variable management

## Notes

- The application automatically switches to PostgreSQL when the `DATABASE_URL` environment variable is set
- All migrations have been applied to the PostgreSQL database
- The database is hosted on Render's PostgreSQL service
- Static files are served using WhiteNoise for production compatibility 