# =========================
# Build stage
# =========================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy everything
COPY . .

# Restore ONLY Web API project
RUN dotnet restore SmartFactory.Api/SmartFactory.Api.csproj

# Publish
RUN dotnet publish SmartFactory.Api/SmartFactory.Api.csproj \
    -c Release \
    -o /app/publish \
    --no-restore


# =========================
# Runtime stage
# =========================
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
EXPOSE 80

COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "SmartFactory.Api.dll"]
