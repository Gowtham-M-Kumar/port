import os
import django
from django.core.management import execute_from_command_line

# Set the environment variable
os.environ['DATABASE_URL'] = 'postgresql://portfolio_u2pz_user:8HKmUljB5ESxLwDwuR9Wa6kk10DqFE8K@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz'

# Set Django settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'portfolio_project.settings')

# Setup Django
django.setup()

print("Starting Django development server with PostgreSQL database...")
print("Database URL: postgresql://portfolio_u2pz_user:***@dpg-d27fkmmuk2gs73e47g30-a.oregon-postgres.render.com/portfolio_u2pz")
print("Admin credentials: admin / admin123")
print("Access the application at: http://127.0.0.1:8000")
print("Access admin panel at: http://127.0.0.1:8000/admin")

# Run the development server
execute_from_command_line(['manage.py', 'runserver']) 