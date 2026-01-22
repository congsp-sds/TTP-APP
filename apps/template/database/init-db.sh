#!/bin/bash
set -e

SQLCMD="/opt/mssql-tools18/bin/sqlcmd -C"

echo "⏳ Waiting for SQL Server to start..."

for i in {1..30}; do
  $SQLCMD -S localhost -U sa -P "$SA_PASSWORD" -Q "SELECT 1" >/dev/null 2>&1 && break
  echo "⏳ SQL Server not ready yet... retry $i"
  sleep 2
done

echo "✅ SQL Server is ready"

echo "📦 Creating database if not exists..."
$SQLCMD -S localhost -U sa -P "$SA_PASSWORD" \
  -Q "IF DB_ID('SmartFactory') IS NULL CREATE DATABASE SmartFactory"

echo "📄 Running schema.sql..."
$SQLCMD -S localhost -U sa -P "$SA_PASSWORD" -d SmartFactory \
  -i /database/schema.sql

echo "🌱 Running seed.sql..."
$SQLCMD -S localhost -U sa -P "$SA_PASSWORD" -d SmartFactory \
  -i /database/seed.sql

echo "📊 Running views.sql..."
$SQLCMD -S localhost -U sa -P "$SA_PASSWORD" -d SmartFactory \
  -i /database/views.sql

echo "🎉 Database initialization completed"
