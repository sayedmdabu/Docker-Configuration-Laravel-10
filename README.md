# Docker Configuration for PHP, MySQL, PHPMyAdmin, Nginx, Bridge Network, Alpine OS, Redis, and Laravel
This repository provides a Docker configuration for setting up a development environment with PHP, MySQL, PHPMyAdmin, Nginx, Redis, and the Laravel PHP framework. The setup is orchestrated using Docker Compose and is designed to be easily accessible and usable by anyone.

## Features
- **PHP:** Utilizes PHP for server-side scripting, with support for Laravel framework.
- **MySQL:** Provides a MySQL database server for storing application data.
- **PHPMyAdmin:** Includes PHPMyAdmin for easy database management via a web interface.
- **Nginx:** Configured with Nginx as the web server for serving PHP files and handling HTTP requests.
- **Bridge Network:** Containers communicate over a bridge network for seamless interaction.
- **Alpine OS:** Utilizes Alpine Linux as the base OS for minimal image size and increased efficiency.
- **Redis:** Includes Redis for caching and session storage, enhancing application performance.

## Usage
1. Clone the repository:

```bash
git clone https://github.com/sayedmdabu/Docker-Configuration-Laravel.git
```
2. Navigate to the project directory:

```bash
cd docker-laravel-setup
```


3. Create a `.env` file on base folder with the following configurations:

```bash
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laraapp
DB_USERNAME=laraapp
DB_PASSWORD=12345678

CACHE_DRIVER=redis
REDIS_CLIENT=predis
REDIS_HOST=redis
REDIS_PORT=8002
```

4. Start the Docker containers:

```bash
docker-compose build
```

```bash
docker-compose up -d
```

5. Update dependencies:

```bash
docker-compose exec -T app composer update
```

6. Run database migrations:

```bash
docker-compose exec -T app php artisan migrate
```
7. Access your Laravel application via `http://localhost:8103`, PHPMyAdmin via `http://localhost:8102`, and other services as configured.

8. Stop the Docker containers:

```bash
docker-compose down
```

## Contributing
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

