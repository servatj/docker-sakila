# Sakila MySQL 8.0 Docker Image

A ready-to-use Docker image with MySQL 8.0 and the Sakila sample database pre-installed.

## Quick Start

### Using Docker Run
```bash
# Pull and run the container
docker run -d \
  --name sakila-mysql \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=root \
  your-dockerhub-username/sakila-mysql:latest

# Wait ~30 seconds for initialization, then connect
mysql -h localhost -u sakila -psakila sakila
```

### Using Docker Compose
```bash
# Clone this repository
git clone <your-repo-url>
cd docker-images

# Start with docker-compose
docker-compose up -d

# Connect to the database
mysql -h localhost -u sakila -psakila sakila
```

## Build Locally

```bash
# Build the image
docker build -t sakila-mysql:latest .

# Run the container
docker run -d --name sakila-mysql -p 3306:3306 sakila-mysql:latest
```

## Database Details

- **MySQL Version**: 8.0
- **Database Name**: `sakila`
- **Root Password**: `root`
- **User**: `sakila` / Password: `sakila`
- **Port**: 3306

## Sample Queries

```sql
-- Show all tables
USE sakila;
SHOW TABLES;

-- Get actor count
SELECT COUNT(*) FROM actor;

-- Sample join query
SELECT f.title, c.name as category
FROM film f 
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
LIMIT 10;
```

## Publishing to Docker Hub

1. Tag the image:
```bash
docker tag sakila-mysql:latest your-dockerhub-username/sakila-mysql:latest
```

2. Push to Docker Hub:
```bash
docker push your-dockerhub-username/sakila-mysql:latest
```

## Health Check

The container includes a health check that verifies MySQL is running:
```bash
docker ps  # Shows health status
```

## Persistent Data

Using docker-compose automatically creates a named volume `sakila_data` for data persistence.

## Compatibility

- ✅ macOS (Intel & Apple Silicon)
- ✅ Linux x86_64
- ✅ Windows with WSL2