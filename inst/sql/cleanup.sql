{DEFAULT @cdmSchema = 'public'}  
{DEFAULT @resultsSchema = 'results'}  
{DEFAULT @studyName = 'LD'} 
{DEFAULT @sourceName = 'source'} 


IF OBJECT_ID('#@sourceName_@studyName_cirrhosis', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_cirrhosis;

IF OBJECT_ID('#@sourceName_@studyName_codesets', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_codesets;

IF OBJECT_ID('#@sourceName_@studyName_drugs', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_drugs;

IF OBJECT_ID('#@sourceName_@studyName_events', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_events;

IF OBJECT_ID('#@sourceName_@studyName_GIbleeding', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_GIbleeding;

IF OBJECT_ID('#@sourceName_@studyName_ingredients', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_ingredients;

IF OBJECT_ID('#@sourceName_@studyName_meld', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_meld;

IF OBJECT_ID('#@sourceName_@studyName_summary', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_summary;

IF OBJECT_ID('#@sourceName_@studyName_trans', 'U') IS NOT NULL
  DROP TABLE #@sourceName_@studyName_trans;



IF OBJECT_ID('#@studyName_AlcIDis', 'U') IS NOT NULL
  DROP TABLE #@studyName_AlcIDis;

IF OBJECT_ID('#@studyName_ascites', 'U') IS NOT NULL
  DROP TABLE #@studyName_ascites;

IF OBJECT_ID('#@studyName_bblockers', 'U') IS NOT NULL
  DROP TABLE #@studyName_bblockers;

IF OBJECT_ID('#@studyName_cirrhosis', 'U') IS NOT NULL
  DROP TABLE #@studyName_cirrhosis;

IF OBJECT_ID('#@studyName_codesets', 'U') IS NOT NULL
  DROP TABLE #@studyName_codesets;

IF OBJECT_ID('#@studyName_Codesets', 'U') IS NOT NULL
  DROP TABLE #@studyName_Codesets;

IF OBJECT_ID('#@studyName_deaths', 'U') IS NOT NULL
  DROP TABLE #@studyName_deaths;

IF OBJECT_ID('#@studyName_encephalopathy', 'U') IS NOT NULL
  DROP TABLE #@studyName_encephalopathy;

IF OBJECT_ID('#@studyName_events', 'U') IS NOT NULL
  DROP TABLE #@studyName_events;

IF OBJECT_ID('#@studyName_fibrosis', 'U') IS NOT NULL
  DROP TABLE #@studyName_fibrosis;

IF OBJECT_ID('#@studyName_GIbleeding', 'U') IS NOT NULL
  DROP TABLE #@studyName_GIbleeding;

IF OBJECT_ID('#@studyName_HCC', 'U') IS NOT NULL
  DROP TABLE #@studyName_HCC;

IF OBJECT_ID('#@studyName_hepatitisB', 'U') IS NOT NULL
  DROP TABLE #@studyName_hepatitisB;

IF OBJECT_ID('#@studyName_hepatitisC', 'U') IS NOT NULL
  DROP TABLE #@studyName_hepatitisC;

IF OBJECT_ID('#@studyName_info', 'U') IS NOT NULL
  DROP TABLE #@studyName_info;

IF OBJECT_ID('#@studyName_Schizo', 'U') IS NOT NULL
  DROP TABLE #@studyName_Schizo;

 IF OBJECT_ID('#@studyName_transplant', 'U') IS NOT NULL
  DROP TABLE #@studyName_transplant;

