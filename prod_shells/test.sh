docker-compose -f ../docker-compose-prod.yml exec users python manage.py recreate-db
docker-compose -f ../docker-compose-prod.yml exec users python manage.py test
docker-compose -f ../docker-compose-prod.yml exec users python manage.py seed-db
