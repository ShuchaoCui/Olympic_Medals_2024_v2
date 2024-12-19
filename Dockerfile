# Base image with R and Shiny pre-installed
FROM rocker/shiny:4.4.2

# Install system dependencies required by some R packages
RUN apt-get update && apt-get install -y \
    libglpk-dev

# Install required R packages
RUN R -e "install.packages('renv')"

# Copy the project files into the container
COPY _targets.R /srv/shiny-server/
COPY server.R /srv/shiny-server/
COPY ui.R /srv/shiny-server/
COPY renv.lock /srv/shiny-server/
COPY medals_2024.csv /srv/shiny-server/

# Set the working directory
WORKDIR /srv/shiny-server/


# Run tar_make() to generate targets data
RUN R -e "renv::restore()"
RUN R -e "library(targets); tar_make()"

# Expose Shiny's default port
EXPOSE 3838

# Start the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server', host = '0.0.0.0', port = 3838)"]
