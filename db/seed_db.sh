#/bin/bash
echo "Dropping DB"
rake db:drop

echo "Creating DB"
rake db:create

echo "Creating Tables"
rake db:migrate

echo "Seeding Data"
rake db:seed

echo "Complete"
