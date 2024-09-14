🚀 Checklist Correction Sheet: Inception Edition 🚀
🛡️ Security:

    API Keys, Sensitive Info, Passwords:
    👉 Must be saved in a .env file.
    ❌ NEVER commit these to the repository!

📁 Project Structure:

    All files must reside in the srcs directory located in the project’s root.
    Makefiles should also be located in the root directory.

🧼 Clean Up Before Testing:

Run this command to clean up the Docker environment:
``` 
bash
docker stop $(docker ps -qa); \
docker rm $(docker ps -qa); \
docker rmi -f $(docker images -qa); \
docker volume rm $(docker volume ls -q); \
docker network rm $(docker network ls -q) 2>/dev/null
``` 
🛠️ Docker Compose File:

    network: host and links: must NOT be present.
    Make sure networks are properly configured.
    No --link in any scripts or makefiles (cue the Meduza remix: "Tell me whyyyy..." 🎶).

🚫 Avoid This in Dockerfiles:

    If you see tail -f or commands run in the background in ENTRYPOINT, the evaluation ends!
    Same goes for bash or sh (unless they run a script, but NO nginx & bash or bash).

🚫 Also Avoid:

    Infinity loops like sleep infinity, tail -f /dev/null, or tail -f /dev/random.

📜 Running the Makefile:

    Run it... and PRAY there are no errors!

🔍 Explain These Concepts to Me:

    What is Docker, and how does Docker Compose work?
    (Actually... STUDY this 👀) Difference between a Docker image used with and without Docker Compose.
    Benefits of Docker compared to VMs.
    The relevance of the required directory structure (hint: refer to the example in the subject’s PDF).

🌐 NGINX Must Be:

    Accessible only via port 443 (HTTPS).
    (Check with: nmap -p 0-1024 ntamiano.42.fr)
    Using an SSL certificate (verify in the browser's certificate info).
    Accessible via https://ntamiano.42.fr and NOT http://ntamiano.42.fr.
    (Check with: curl -k https://ntamiano.42.fr or http://ntamiano.42.fr).

📋 Dockerfile and Services:

    Ensure there’s one Dockerfile per service, and that it’s not empty.
    Dockerfiles must begin with FROM:DEBIAN.
    Verify the Docker image corresponds to the service by running:
    ``` 
    bash

    make status_all
    ``` 
⚙️ Using Docker Compose:

    The Makefile should build containers only with Docker Compose.

    Check the docker-compose.yml file for docker-network usage and confirm it with:
    ``` 
    bash

    docker network ls
    ``` 
    Can you explain what a docker-network is? (MUST study this, fam! 💡)

🔍 NGINX Container Check:

    Run docker compose ps to ensure the nginx container is created.
    Verify HTTPS connections and SSL/TLS version with:
    ``` 
    bash

    openssl s_client -connect ntamiano.42.fr:443 -tls1_3
    ``` 
    A self-signed certificate warning in the browser should appear.

✏️ WordPress:

    Ensure no NGINX in the Dockerfile.
    Verify a Volume exists. Run:
    ``` 
    bash

    docker volume ls
    docker volume inspect <volume_name>
    ``` 
    The result should include the path /home/login/data/ (replace login with the student’s login).
    Check that you can add a comment as a normal user and edit a page as an admin.
    Changes must persist after make down and make up.

💾 MariaDB:

    Ensure the Dockerfile exists and contains no NGINX.
    Use docker compose ps to verify the container creation.
    Confirm a Volume is present (see WordPress section for commands).
    The evaluated student should explain how to log into the database and prove it’s not empty.
``` 
bash

make exec_db
mysql -u murphy_user -p
# password: PPPPPPPPP yoloADASDASDAS
SHOW DATABASES;
USE odissey;
SHOW TABLES;
SELECT * FROM <table_name>;
```

✅ THAT'S ALL ✅

CHECKLIST CORRECTION SHEET INCEPTION



- ALL API KEYS, SENSITIVE INFORMATIONS, PASSWORD must be saved in .env file and must NOT BE LOCATED IN THE GIT COMMITTED REPOSITORY.
- all files must be in "srcs" repository located in the root directory of the project.
- makefiles must be located in the root directory of the project.
- before testing run this command:

 docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

- in the docker-compose.yml or yaml file must not be present 'network: host' in it or 'links:'.
- in the docker-compose.yml file. There must be 'network(s)' in it.
- in the makefile and all the scripts in which Docker is used. There musn't be '--link' in any of them. (tell me whyyyyyy meduza remix)
- in the Dockerfiles. If you see 'tail -f' or any command run in background in any of them in the ENTRYPOINT section, the evaluation ends now. Same thing if 'bash' or 'sh' are used but not for running a script (e.g, 'nginx & bash' or 'bash'). (no & and no bash or sh and no  tail -f)
-  same thing above for entrypoint.sh scripts
- no infinity loop programs ex. 'sleep infinity', 'tail -f /dev/null', 'tail -f /dev/random'

- now run the makefile and pray there wouldnt be any error.



- EXPLAIN TO ME 
* what is docker and how does docker compose works
* **ACTUALLY NEED TO STUDY THIS The difference between a Docker image used with docker compose and without docker compose
* The benefit of Docker compared to VMs
* The pertinence of the directory structure required for this project (an example is provided in the subject's PDF file).


- nginx must be accessible using only 443 port (https). 
(you can run the following command  nmap -p 0-1024 ntamiano.42.fr ) 
- ensure that the ssl certificate is been using (you can check that directly on the browser) on the info of the certificate
- ensure that you can connect to https://ntamiano.42.fr and NOT TO http://ntamiano.42.fr you can do it by using this command:  curl -k https://ntamiano.42.fr or http://ntamiano.42.fr


- check if there is 1 dockerfile per service and that is not empty.
- ensure that the dockerfiles has been written by the students and that every dockerfiles starts: FROM:DEBIAN

- the docker images must be the same as the service (you can check this thing by running the command make status_all)

- ensure that the makefile builds the containers only using the docker compose.

- Ensure that docker-network is used by checking the docker-compose.yml file. Then run the 'docker network ls' command to verify that a network is visible.

- explain what is a docker-network (MUST STUDY THIS SHIT YO MAN)

* NGINX

- using the command docker compose ps (where the docker-compose.yaml file is located) ensure that nginx container has been created.

- check againif you can only connect using https, check the ssl/tsl version that has been use, you can use the following comand: openssl s_client -connect ntamiano.42.fr:443 -tls1_3

- the browser warning about a self-signed certificate must appear, you cant really do it anything about that, explain your self


* WORDPRESS
- check the dockerfile and be sure there is no NGINX.
- bla bla bla verify the same old shit my man.
- Ensure that there is a Volume. To do so: Run the command 'docker volume ls' then 'docker volume inspect <volume name>'. Verify that the result in the standard output contains the path '/home/login/data/', where login is the login of the evaluated student.

- ensure that you can add a comment as a normal user and that you can edit a page as an admin
- also check that the changes remain consisten even after a make down and make up.


* MARIADB


    Ensure that there is a Dockerfile.
    Ensure that there is no NGINX in the Dockerfile.
    Using the 'docker compose ps' command, ensure that the container was created (using the flag '-p' is authorized if necessary).
    Ensure that there is a Volume. To do so: Run the command 'docker volume ls' then 'docker volume inspect <volume name>'. Verify that the result in the standard output contains the path '/home/login/data/', where login is the login of the evaluated student.
    The evaluated student must be able to explain you how to login into the database. Verify that the database is not empty. If any of the above points is not correct, the evaluation process ends now.


make exec_db 

mysql -u murphy_user -p
insert murphy_user password :PPPPPPPP yoloADASDASDAS

SHOW DATABASES;
USE odissey;
SHOW TABLES;
SELECT * FROM <table_name>;


