FROM r-base:3.4.0
    RUN apt-get update && apt-get install -y libcurl4-gnutls-dev libxml2-dev libssl-dev libmariadb-client-lgpl-dev \
        ibglib2.0-dev libcairo2-dev ghostscript && apt-get clean && \
        rm -rf /var/lib/apt/lists/*
    RUN apt-get update && apt-get install libxt-dev && \
         rm -rf /var/lib/apt/lists/*
    RUN Rscript -e 'install.packages("devtools", dependencies = TRUE)'
    RUN Rscript -e 'library(devtools)'   
    RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("GO.db","impute")'
    RUN Rscript -e 'library(GO.db, impute)'   
    RUN Rscript -e 'install.packages(c("WGCNA","sqldf"))'
    RUN Rscript -e 'library(WGCNA, sqldf)'   
