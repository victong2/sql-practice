# SQL at Alayacare

## Tables

### patients table

| column  | type |
| :------ | :--: |
| id      | int  |
| name    | text |
| surname | text |

### care_providers table

| column  | type |
| :------ | :--: |
| id      | int  |
| name    | text |
| surname | text |

### appointments table

| column           | type |
| :--------------- | :--: |
| id               | int  |
| patient_id       | int  |
| care_provider_id | int  |
| start_datetime   | date |
| end_datetime     | date |

## The Problem

Please write an SQL query that returns the available caregivers for a desired appointment next Tuesday at 10:00am for a 45 minute duration.

## Setup

Start the (Postgres) database, apply the [initial migrations](migrations/init.sql) and [seed](migrations/seed.sql) the database.
The SQL files in [migrations](migrations) are executed in alphabetical order when the DB container starts.

```sh
docker-compose up -d
```

Notes: `docker-compose down` is enough to cleanup everything since there is data volume.

## Tests

Connect to adminer to run the query, or use the CLI, or pick any method you prefer.
The query:

```sql
SELECT DISTINCT cp.id, cp.name, cp.surname
FROM care_providers cp
WHERE cp.id NOT IN (
    SELECT care_provider_id
    FROM appointments
    WHERE start_datetime < next_tuesday() + INTERVAL '10 hours 45 minutes' -- Next Tuesday + 45 minutes
    AND end_datetime > next_tuesday() + INTERVAL '10 hours' -- Next Tuesday at 10:00 AM
)
ORDER BY cp.surname, cp.name;
```

It should return : Alice Bob and Victor Hugo!

## Lessions

Using LLMs is a very good way to learn and improve. They are useful for SQL queries.
