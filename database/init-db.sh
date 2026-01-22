#!/bin/bash
set -e

echo "⏳ Waiting for SQL Server to start..."

# Wait until SQL Server is ready
for i in {1..30}; do
  /opt/mssql-tools/bin/sqlcmd \
    -S localhost \
    -U sa \
    -P "$SA_PASSWORD" \
    -Q "SELECT 1" >/dev/null 2>&1 && break

  echo "⏳ SQL Server not ready yet... retry $i"
  sleep 2
done

echo "✅ SQL Server is ready"

echo "📦 Creating database if not exists..."
/opt/mssql-tools/bin/sqlcmd \
  -S localhost \
  -U sa \
  -P "$SA_PASSWORD" \
  -Q "IF DB_ID('SmartFactory') IS NULL CREATE DATABASE SmartFactory"

echo "📄 Running schema.sql..."
/opt/mssql-tools/bin/sqlcmd \
  -S localhost \
  -U sa \
  -P "$SA_PASSWORD" \
  -d SmartFactory \
  -i /database/schema.sql

echo "🌱 Running seed.sql..."
/opt/mssql-tools/bin/sqlcmd \
  -S localhost \
  -U sa \
  -P "$SA_PASSWORD" \
  -d SmartFactory \
  -i /database/seed.sql

echo "📊 Running views.sql..."
/opt/mssql-tools/bin/sqlcmd \
  -S localhost \
  -U sa \
  -P "$SA_PASSWORD" \
  -d SmartFactory \
  -i /database/views.sql

echo "🎉 Database initialization completed"
