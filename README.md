Alcoholic Liver Disease (ALD): Medication and clinical parameters associated with course of disease
=============

<img src="https://img.shields.io/badge/Study%20Status-Repo%20Created-lightgray.svg" alt="Study Status: Repo Created">

- Analytics use case(s): **Characterization, Population-Level Estimation**
- Study type: **Clinical Application**
- Tags: **Liver, Alcoholic liver disease, Drug, Gender**
- Study lead: **Prof. Dr. Andreas Teufel, Medical Faculty Mannheim, Heidelberg University, Germany**
- Study lead forums tag: **[[Lead tag]](https://forums.ohdsi.org/u/[Lead tag])**
- Study start date: **-**
- Study end date: **-**
- Protocol: **[Here](https://github.com/titzel/AlcoholicLiverDisease/blob/master/documents/Protocol.docx)**
- Publications: **-**
- Results explorer: **-**

Within this study we are interested in investigating new treatment options for patients with alcoholic liver disease respectively inside different sub groups as well as gender specific in respect of the overall survival of the patients.

==How to run==

1. Requirements for executing this package:
   - DatabaseConnector ( >= 2.1.4 )
   - SqlRender ( >= 1.5.2 )
   - survival ( >= 2.42-4 )
 

2. The package needs to be installed into the R environment.

   - with the devtools package inside a R session it could be done with
      ```r
         devtools::install_github("ohdsi-studies/AlcoholicLiverDesease")
      ```
   - from the command line on linux machines it could be done with
      ```bash
          R CMD build AlcoholicLiverDisease
          R CMD INSTALL AlcoholicLiverDisease_0.0.1.tar.gz
      ```

3. Then, within an interactive R session, execute the adapted commands below.

   ```r
      library(AlcoholicLiverDisease)

      connectionDetails <- DatabaseConnector::createConnectionDetails(
          dbms = "sql server",          # DB Server type
          server = "localhost",         # URL / IP
          user = "<user>",              # user for connection
          password = "<password>",      # password for connection
          schema="<schema>",            # DB schema
          port = "1433"                 # port
      )

      execute(
          connectionDetails,
          sourceName="abbreviation"     # Abbreviation for the origin of DB
      )
   ```
   The parameter sourceName is only used to connect the results with the origin. Therefore, please provide your institution or DB abbreviation as the sourceName parameter. 

4. Once the execution is finished, the results will be placed as ZIP files inside the temporary directory of the R session. Please send them back to the study coordinator.

