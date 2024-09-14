**🚀 Checklist Correction Sheet: Inception Edition 🚀**
***🛡️ Security:***

    API Keys, Sensitive Info, Passwords:
    👉 Must be saved in a .env file.
    ❌ NEVER commit these to the repository!

***📁 Project Structure:***

    All files must reside in the srcs directory located in the project’s root.
    Makefiles should also be located in the root directory.

***🧼 Clean Up Before Testing:***

Run this command to clean up the Docker environment:
``` 
bash
docker stop $(docker ps -qa); \
docker rm $(docker ps -qa); \
docker rmi -f $(docker images -qa); \
docker volume rm $(docker volume ls -q); \
docker network rm $(docker network ls -q) 2>/dev/null
``` 
***🛠️ Docker Compose File:***

    network: host and links: must NOT be present.
    Make sure networks are properly configured.
    No --link in any scripts or makefiles (cue the Meduza remix: "Tell me whyyyy..." 🎶).

***🚫 Avoid This in Dockerfiles:***

    If you see tail -f or commands run in the background in ENTRYPOINT, the evaluation ends!
    Same goes for bash or sh (unless they run a script, but NO nginx & bash or bash).

***🚫 Also Avoid:***

    Infinity loops like sleep infinity, tail -f /dev/null, or tail -f /dev/random.

***📜 Running the Makefile:***

    Run it... and PRAY there are no errors!

***🔍 Explain These Concepts to Me:***

    What is Docker, and how does Docker Compose work?
    (Actually... STUDY this 👀) Difference between a Docker image used with and without Docker Compose.
    Benefits of Docker compared to VMs.
    The relevance of the required directory structure (hint: refer to the example in the subject’s PDF).

***🌐 NGINX Must Be:***

    Accessible only via port 443 (HTTPS).
    (Check with: nmap -p 0-1024 ntamiano.42.fr)
    Using an SSL certificate (verify in the browser's certificate info).
    Accessible via https://ntamiano.42.fr and NOT http://ntamiano.42.fr.
    (Check with: curl -k https://ntamiano.42.fr or http://ntamiano.42.fr).

***📋 Dockerfile and Services:***

    Ensure there’s one Dockerfile per service, and that it’s not empty.
    Dockerfiles must begin with FROM:DEBIAN.
    Verify the Docker image corresponds to the service by running:
    ``` 
    bash

    make status_all
    ``` 
***⚙️ Using Docker Compose:***

    The Makefile should build containers only with Docker Compose.

    Check the docker-compose.yml file for docker-network usage and confirm it with:
    ``` 
    bash

    docker network ls
    ``` 
    Can you explain what a docker-network is? (MUST study this, fam! 💡)

***🔍 NGINX Container Check:***

    Run docker compose ps to ensure the nginx container is created.
    Verify HTTPS connections and SSL/TLS version with:
    ``` 
    bash

    openssl s_client -connect ntamiano.42.fr:443 -tls1_3
    ``` 
    A self-signed certificate warning in the browser should appear.

***✏️ WordPress:***

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

***💾 MariaDB:***

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

**✅ THAT'S ALL ✅**