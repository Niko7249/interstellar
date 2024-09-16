#!/bin/bash

# Check if the .env file already exists
if [ -f ./srcs/.env ]; then
    echo ".env file already exists. Exiting script."
    exit 0
fi

# Function to generate random strings
generate_random_string() {
    local length=$1
    tr -dc 'a-zA-Z0-9_!' < /dev/urandom | head -c "$length"
}

# Array of names for random selection
NAMES=(
    "Hal9000" "Cristopher_Nolan" "Stanley_Kubrick" "Steven_Spielberg" "Martin_Scorsese"
    "Quentin_Tarantino" "Alfred_Hitchcock" "James_Cameron" "Ridley_Scott" "Peter_Jackson"
    "Christopher_Lee" "Meryl_Streep" "Leonardo_DiCaprio" "Natalie_Portman" "Tom_Hanks"
    "Denzel_Washington" "Emma_Stone" "Hugh_Jackman" "Scarlett_Johansson" "Robert_Downey_Jr"
    "Johnny_Dep" "Joaquin_Phoenix" "Kate_Winslet" "Daniel_Craig" "Ben_Affleck"
    "Matthew_McConaughey" "Nicole_Kidman" "Anne_Hathaway" "George_Clooney" "Will_Smith"
    "Julia_Roberts" "Brad_Pitt" "Angelina_Jolie" "Ryan_Gosling" "Emma_Watson"
    "Chris_Pratt" "Jason_Momoa" "Henry_Cavill" "Gal_Gadot" "Robert_Pattinson"
)

# Function to pick a random name from the array
pick_random_name() {
    echo "${NAMES[RANDOM % ${#NAMES[@]}]}"
}

# Create .env file and write variables
cat <<EOL > ./srcs/.env
# ALL THESE ENV VARIABLES ARE FOR TESTING PURPOSES ONLY

# MYSQL SETUP
MYSQL_DB=odissey # database name
MYSQL_USER=murphy_user # database user
MYSQL_PASSWORD=$(generate_random_string 30) # database user password
MYSQL_ROOT_PASSWORD=$(generate_random_string 30) # root password

# WP SETUP
DOMAIN_NAME=ntamiano.42.fr # domain name of the website
WP_ADMIN_N=$(pick_random_name) # admin name
WP_ADMIN_P=$(generate_random_string 15) # admin password
WP_TITLE=Interstellar # website title
WP_ADMIN_E=$(pick_random_name)@interstellar.com # admin email

# WP NEW USER SETUP
WP_U_NAME=$(pick_random_name) # user name of the new user
WP_U_PASS=$(generate_random_string 20) # user password
WP_U_ROLE=editor # author, editor, Administrator ...
WP_U_EMAIL=$(pick_random_name)@interstellar.com # user email
EOL

echo ".env file generated successfully!"
