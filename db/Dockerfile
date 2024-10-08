# Offizielles PostgreSQL-Image verwenden
FROM postgres:13

# Umgebungsvariablen festlegen, damit sie mit deiner database.yml übereinstimmen
ENV POSTGRES_USER=otor_erp
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=otor_erp_development

# PostgreSQL-Ports öffnen
EXPOSE 5432

# Optional: Initialisierungs-Skripte kopieren, falls benötigt
# COPY ./init.sql /docker-entrypoint-initdb.d/
