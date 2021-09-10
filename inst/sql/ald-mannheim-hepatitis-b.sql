{DEFAULT @cdmSchema = 'public' }
{DEFAULT @studyName = 'LD' }
{DEFAULT @sourceName = 'source' }
{DEFAULT @schema = '' }


{DEFAULT @conditionlist = '201612' }
{DEFAULT @condition_exclude_list = '4291005'}
{DEFAULT @hepatitisC = '192242,197494,198964,439672,763021,35624866,35624867,35625040,35625139,35625140,35625141,35625295,35625296,40483136,43531723,44809233,44809234,44809236,44809237,44809238,44809239,45757726,45766656,45769525,45773146' }
{DEFAULT @hepatitisB = '192240,194574,197795,198683,439674,439675,4009793,4027854,4173584,4203326,4281232,4296554,4341652,37017654,40482214,40483136,40488872' }

{DEFAULT @cirrlist = '4064161, 45772057, 44805713, 43531723, 37396401, 4340948, 4232955, 4163687, 4159158, 4153294, 4143008, 4140536, 4135822, 4064161, 4059284, 4050640, 4048083, 4048057, 4046123, 4046016, 4003673, 196463, 194692, 192675' }
{DEFAULT @gibleedlist = '192671, 46273183, 46269908, 45768629, 45757783, 45757570, 36717237, 4308202, 4291649, 4246979, 4145805, 4144926, 4143871, 4139411, 4115149, 4100660, 316457, 193250, 193249, 192671, 26727, 23245' }
{DEFAULT @trlist = '44810795,44810789, 44806062' }
{DEFAULT @meldlist = '3046142' }
{DEFAULT @bblist= '1319998, 1314002, 1322081, 1338005, 19063575, 1314577, 1307046, 950370, 1327978, 1345858, 1346823, 1386957, 932815, 905531, 1313200, 1353766, 1370109, 902427' }
{DEFAULT @transplantlist= '4001373, 2003164, 4076862, 44809584, 4067458, 2003166, 4099299, 4101838, 2003165, 4067459, 4139049, 2109321' }
{DEFAULT @fibrosislist= '42537672, 45766656, 4345477, 4046017, 36686081, 4194229, 4342775, 36715922, 4267417' }
{DEFAULT @encephalopathylist= '194856, 196029, 200031, 377604, 439672, 439675, 763020, 763021, 4029488, 4308946, 4314443, 35622780, 42710029, 42710030, 46269697, 46269814, 46269818, 46269836, 46269949, 46270037, 46270142, 46270152' }
{DEFAULT @HCClist= '4001171, 4099699, 4166154' }
{DEFAULT @AlcInducedOrganicMentalDisorderlist = '4146660, 375794, 4098164, 4205002, 4088373, 375519, 439277, 372607, 376383, 377830, 374014, 374317, 378726, 4196925, 374623, 4101139, 4310679, 442582'}
{DEFAULT @Schizophrenialist = '435783, 436384, 438724, 4103253, 4085662, 432299, 436947, 4098177, 4100368, 4213979, 436944, 440373, 4105330, 4008566, 433996, 435217, 435782, 436067, 436385, 439275, 433990, 434901, 435219, 436673, 441828, 4310121, 4244059, 4102660, 433450, 434318, 435218, 440368, 441538, 4100366, 432598, 432864, 434332, 440686, 4103254, 4098176, 4101150, 444396, 4219539, 433442, 436071, 437243, 439004, 40480879, 4100365, 4194671, 4321694' }
{DEFAULT @asciteslist = '200528, 46269816, 46269817, 4342883, 46273476, 46269835' }


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


-- **************************************
-- ************codesets******************
-- ***************************************


CREATE TABLE #@studyName_codesets 
(
	codeset_id int NOT NULL,
        codeset_name varchar(40) NOT NULL,
	concept_id bigint NOT NULL
);

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 0 as codeset_id, 'conditionlist' as codeset_name, c.concept_id FROM
(
	select distinct I.concept_id
	FROM
	(
		select concept_id from @schema.CONCEPT where concept_id in (@conditionlist) and invalid_reason is null
		UNION  select c.concept_id
		from @schema.CONCEPT c
		join @schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
		and ca.ancestor_concept_id in (@conditionlist)
		and c.invalid_reason is null

	) I
) C;

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT -1 as codeset_id, 'condition_exclude_list' as codeset_name, c.concept_id FROM
(
        select distinct I.concept_id
        FROM
        (
                select concept_id from @schema.CONCEPT where concept_id in (@condition_exclude_list) and invalid_reason is null
                UNION  select c.concept_id
                from @schema.CONCEPT c
                join @schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
                and ca.ancestor_concept_id in (@condition_exclude_list)
                and c.invalid_reason is null

        ) I
) C;


INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 11 as codeset_id, 'hepatitisB' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@hepatitisB) and invalid_reason is null
    ) I
) C;


INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 12 as codeset_id, 'hepatitisC' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@hepatitisC) and invalid_reason is null
    ) I
) C;


-- ********************************************
-- *************LD_Events********************
-- *****************************************

WITH primary_events (event_id, person_id, start_date, end_date, op_start_date, op_end_date, exclude_id, has_hep_b, has_hep_c)  AS
(
        select row_number() over (PARTITION BY P.person_id order by P.start_date) as event_id, P.person_id, P.start_date, P.end_date, OP.observation_period_start_date as op_start_date, OP.observation_period_end_date as op_end_date, X.exclude_id, hb.has_hep_b, hc.has_hep_c
        FROM
        (
                select P.person_id, P.start_date, P.end_date, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY start_date ASC) ordinal
                FROM
                (
                        select C.person_id, C.condition_era_id as event_id, C.condition_era_start_date as start_date, C.condition_era_end_date as end_date, C.CONDITION_CONCEPT_ID as TARGET_CONCEPT_ID
                        from
                        (
                                select ce.*, ROW_NUMBER() over (PARTITION BY ce.person_id ORDER BY ce.condition_era_start_date, ce.condition_era_id) as ordinal
                                FROM @schema.CONDITION_ERA ce
                                where ce.condition_concept_id in (SELECT concept_id from #@studyName_codesets where codeset_id = 0) AND NOT (ce.condition_era_start_date < '2000-01-01')
                        ) C
                        WHERE C.ordinal = 1
                ) P
        ) P
        JOIN @schema.observation_period OP
                on P.person_id = OP.person_id and P.start_date >=  OP.observation_period_start_date and P.start_date <= op.observation_period_end_date
        LEFT JOIN (SELECT distinct person_id AS exclude_id FROM @schema.CONDITION_ERA WHERE condition_concept_id IN (SELECT concept_id from #@studyName_codesets where codeset_id = -1)) X 
		ON P.person_id = X.exclude_id
        LEFT JOIN (SELECT distinct person_id AS has_hep_b FROM @schema.CONDITION_ERA WHERE condition_concept_id IN (SELECT concept_id from #@studyName_codesets where codeset_id = 11)) hb 
                ON P.person_id = hb.has_hep_b
        LEFT JOIN (SELECT distinct person_id AS has_hep_c FROM @schema.CONDITION_ERA WHERE condition_concept_id IN (SELECT concept_id from #@studyName_codesets where codeset_id = 12)) hc 
                ON P.person_id = hc.has_hep_c
        WHERE DATEADD(dd, 0, OP.OBSERVATION_PERIOD_START_DATE) <= P.START_DATE AND DATEADD(dd, 0, P.START_DATE) <= OP.OBSERVATION_PERIOD_END_DATE AND P.ordinal = 1
)
SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, exclude_id, has_hep_b, has_hep_c
INTO #@studyName_events 
FROM
(
        select pe.event_id, pe.person_id, pe.start_date, pe.end_date, pe.op_start_date, pe.op_end_date, exclude_id, pe.has_hep_b, pe.has_hep_c, row_number() over (partition by pe.person_id order by pe.start_date ASC) as ordinal
        FROM primary_events pe
        JOIN
        (
                select 0 as index_id, person_id, event_id
                FROM
                (
                        select E.person_id, E.event_id
                        FROM primary_events E
                        LEFT JOIN
                        (
                                select ET.person_id, ET.event_id from primary_events ET
                        )
                        CQ on E.person_id = CQ.person_id and E.event_id = CQ.event_id
                        GROUP BY E.person_id, E.event_id
                ) G
        )
        AC on AC.person_id = pe.person_id and AC.event_id = pe.event_id
) QE
WHERE QE.ordinal = 1 AND has_hep_c is NULL AND has_hep_b is not NULL
ORDER BY person_id ASC;

-- ***************************************************
-- ************death date ****************************
-- ****************************************************

SELECT person_id, death_date
INTO #@studyName_deaths
FROM @schema.death
WHERE person_id in
(
        SELECT person_id FROM  #@studyName_events WHERE person_id = #@studyName_events.person_id
);

--- ################################################
--- ########## exclude death before 2000-01-01 #####
--- ################################################

--- DELETE FROM #@studyName_events WHERE person_id IN (SELECT person_id FROM #@studyName_deaths WHERE death_date < '2000-01-01');
--- DELETE FROM #@studyName_deaths WHERE person_id IN (SELECT person_id FROM #@studyName_deaths WHERE death_date < '2000-01-01');


DELETE FROM #@studyName_events WHERE person_id IN (
        SELECT d.person_id
        FROM #@studyName_deaths d
        LEFT JOIN #@studyName_events e
                ON d.person_id = e.person_id WHERE d.death_date < e.start_date
);

DELETE FROM #@studyName_deaths WHERE person_id NOT IN (SELECT person_id FROM #@studyName_events);


-- *************************************************
-- *************gender and year of birth*************
-- *************************************************

SELECT person_id, gender_concept_id as gender, year_of_birth as birth_year
INTO #@studyName_info
FROM @schema.person
WHERE person_id in
(
	SELECT person_id FROM  #@studyName_events WHERE person_id=#@studyName_events.person_id
);

-- ************************************
-- *************GIbleeding************
-- ************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 1 as codeset_id, 'gibleedlist' as codeset_name, c.concept_id
FROM
(
	select distinct I.concept_id FROM
	(
		SELECT concept_id FROM @schema.CONCEPT where concept_id in (@gibleedlist) and invalid_reason is null
	) I
) C;


/* EQUAL RESULTS */
WITH GIbleeding_CTE AS (
	SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, condition_concept_id, 1 as GI_bleeding, condition_era_start_date
	FROM @schema.CONDITION_ERA, #@studyName_events
	WHERE condition_concept_id in
	(
		SELECT concept_id from  #@studyName_Codesets where codeset_id = 1
	)
	AND #@studyName_events.person_id=condition_era.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
---	order by #@studyName_events.person_id
)
SELECT person_id, condition_concept_id, 1 as GI_bleeding, condition_era_start_date as GI_bleeding_diagnostic_date
INTO #@studyName_GIbleeding
FROM GIbleeding_CTE WHERE rn = 1;


	SELECT #@studyName_events.person_id, condition_concept_id, 1 as GI_bleeding, condition_era_start_date as GI_bleeding_diagnostic_date , c.concept_name
	INTO #@sourceName_@studyName_GIbleeding
	FROM #@studyName_events
	join @schema.condition_era ce on #@studyName_events.person_id=ce.person_id
	join @schema.concept c on ce.condition_concept_id = c.concept_id 
	WHERE condition_concept_id in
	(
		SELECT concept_id from  #@studyName_Codesets where codeset_id = 1
	);


-- ********************************
-- *************Cirrhosis**********
-- ********************************

INSERT INTO #@studyName_Codesets (codeset_id, codeset_name, concept_id)
    SELECT 2 AS codeset_id, 'cirrlist' as codeset_name, c.concept_id FROM
    (
        SELECT DISTINCT I.concept_id FROM
        (
            SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@cirrlist) AND invalid_reason IS NULL
        ) I
    ) C;

WITH cirrhosis_CTE AS (
    SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, condition_concept_id, 1 as cirrhosis, condition_era_start_date
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
            (SELECT concept_id
                FROM  #@studyName_Codesets
                WHERE codeset_id = 2)
            AND #@studyName_events.person_id=condition_era.person_id
            AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, condition_concept_id, 1 as cirrhosis, condition_era_start_date AS cirrhosis_diagnostic_date
INTO #@studyName_cirrhosis
FROM cirrhosis_CTE
WHERE rn = 1;


	SELECT  #@studyName_events.person_id, condition_concept_id, 1 as cirrhosis, condition_era_start_date as cirrhosis_diagnostic_date, c.concept_name
	INTO #@sourceName_@studyName_cirrhosis
	FROM #@studyName_events
	join @schema.condition_era ce on #@studyName_events.person_id=ce.person_id
	join @schema.concept c on ce.condition_concept_id=c.concept_id
	WHERE condition_concept_id in
	(
	        SELECT concept_id FROM  #@studyName_Codesets WHERE codeset_id = 2
	);

-- code below replaces original code to eliminate LOJ error in BigQuery
-- Michael Kahn (Michael.Kahn@cuanschutz.edu)


-- *************************************************************
-- *************transaminases*********************************
-- *************************************************************

SELECT m.person_id, measurement_concept_id, measurement_date, value_as_number, unit_concept_id
INTO #@sourceName_@studyName_trans
FROM @schema.measurement m join #@studyName_events e on m.person_id = e.person_id
WHERE measurement_concept_id IN (@trlist)
;

-- ********************************************
-- *************MELD score**********************
-- ********************************************

SELECT m.person_id, measurement_concept_id, measurement_date, value_as_number, unit_concept_id
INTO #@sourceName_@studyName_meld
FROM @schema.measurement m join #@studyName_events e on m.person_id = e.person_id
WHERE measurement_concept_id=@meldlist /*@meldlist*/ ---this concept is to select for MELD score
ORDER BY person_id ASC;

-- End of modified code



-- *****************************************************************
-- *************LD_bblockers************************************
-- *****************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 3 as codeset_id, 'bblist' as codeset_name, c.concept_id FROM (select distinct I.concept_id FROM
(
  SELECT concept_id FROM @schema.CONCEPT where concept_id in (@bblist) and invalid_reason is null
  UNION  SELECT c.concept_id
  FROM @schema.CONCEPT c
  JOIN @schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  AND ca.ancestor_concept_id in (@bblist)
  AND c.invalid_reason IS NULL

) I
) C;


WITH beta_blocker_CTE AS (
    SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as beta_blocker
    FROM @schema.drug_exposure, #@studyName_events
    WHERE drug_concept_id in
    (
	SELECT concept_id FROM #@studyName_codesets WHERE codeset_id = 3
    )
    AND drug_exposure.person_id=#@studyName_events.person_id
    AND drug_exposure.drug_exposure_start_date >= #@studyName_events.start_date
)
SELECT person_id, beta_blocker
INTO #@studyName_bblockers
FROM beta_blocker_CTE
WHERE rn=1;


-- ******************************************************
-- *************LD_drugs*********************************
-- ******************************************************

/*
WITH CTE_drugs AS
(
	SELECT DISTINCT person_id, drug_concept_id, concept.concept_name
	FROM drug_exposure
	LEFT JOIN concept
		ON drug_exposure.drug_concept_id=concept.concept_id
	WHERE person_id IN
	(
	        SELECT person_id FROM #@studyName_events WHERE #@studyName_events.person_id=drug_exposure.person_id
	)
	AND drug_concept_id > 0
)
*/

--- part from Thomas Falconer
WITH CTE_drugs AS
(
        SELECT DISTINCT de.person_id, de.drug_concept_id, concept.concept_name
        , de.drug_exposure_start_date as drug_dates, s.start_date as diagnosis_date --TF added lines but the distinct drug_dates is exploding the table
        ---if not all drug time stamps are needed, we might want to take just the min drug date that comes after the diagnosis date 
        FROM @schema.drug_exposure de
        LEFT JOIN @schema.concept
                ON de.drug_concept_id=concept.concept_id
        JOIN #@studyName_events s on s.person_id=de.person_id --TF added line to be able to condition on diagnosis date
        WHERE 
        /*
        de.person_id IN
        (
                SELECT person_id FROM #@studyName_events WHERE #@studyName_events.person_id=de.person_id
        )
        AND 
        */
        drug_concept_id > 0
        AND drug_exposure_start_date > s.start_date --TF added line to enforce first drug time stamp is after first condition time stamp
)
--- end of his included changes
SELECT CTE_drugs.*, concept_ancestor.ancestor_concept_id, concept.concept_name as ingredient_name, concept.concept_class_id
INTO #@sourceName_@studyName_drugs
FROM CTE_drugs
LEFT JOIN @schema.concept_ancestor
	ON CTE_drugs.drug_concept_id = concept_ancestor.descendant_concept_id 
LEFT JOIN @schema.concept
	ON concept_ancestor.ancestor_concept_id = concept.concept_id
WHERE concept.concept_class_id = 'Ingredient'
ORDER BY CTE_drugs.person_id, concept.concept_name;


SELECT DISTINCT person_id, ancestor_concept_id as ingredient_concept_id, ingredient_name
INTO #@sourceName_@studyName_ingredients
FROM #@sourceName_@studyName_drugs
ORDER BY person_id, ingredient_name;


--**************************************************************-
--********************Transplant Patients **********************
--**************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 4  as codeset_id, 'transplantlist' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@transplantlist) and invalid_reason is null
    ) I
) C;


WITH transplant_CTE AS (
	SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as transplant
	FROM @schema.procedure_occurrence, #@studyName_events
	WHERE procedure_concept_id in
	(
		SELECT concept_id from  #@studyName_codesets where codeset_id = 4
	)
	AND procedure_occurrence.person_id=#@studyName_events.person_id
        AND procedure_occurrence.procedure_date >= #@studyName_events.start_date
)
SELECT person_id, transplant
INTO #@studyName_transplant
FROM transplant_CTE
WHERE rn=1;


--**************************************************************-
--************************ Fibrosis ****************************
--**************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 5  as codeset_id, 'fibrosislist' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@fibrosislist) and invalid_reason is null
    ) I
) C;


WITH fibrosis_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as fibrosis
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 5
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, fibrosis
INTO #@studyName_fibrosis
FROM fibrosis_CTE
WHERE rn=1;

--**************************************************************-
--**************** Hepatic encephalopathy **********************
--**************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 6 as codeset_id, 'encephalopathylist' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@encephalopathylist) and invalid_reason is null
    ) I
) C;


WITH encephalopathy_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as encephalopathy
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 6
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, encephalopathy
INTO #@studyName_encephalopathy
FROM encephalopathy_CTE
WHERE rn=1;

--**************************************************************-
--************************ HCC *********************************
--**************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 7 as codeset_id, 'HCClist' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@HCClist) and invalid_reason is null
    ) I
) C;


WITH HCC_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as HCC
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 7
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, HCC
INTO #@studyName_HCC
FROM HCC_CTE
WHERE rn=1;



--**************************************************************-
--************************ HCC *********************************
--**************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 8 as codeset_id, 'AlcInducedOrganicMentalDisorderlist' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@AlcInducedOrganicMentalDisorderlist) and invalid_reason is null
    ) I
) C;


WITH AlcIDis_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as AlcInducedOrganicMentalDisorder
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 8
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, AlcInducedOrganicMentalDisorder
INTO #@studyName_AlcIDis
FROM AlcIDis_CTE
WHERE rn=1;


--**************************************************************-
--************************ Schizophrenia *********************************
--**************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 9 as codeset_id, 'Schizophrenialist' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@Schizophrenialist) and invalid_reason is null
    ) I
) C;


WITH Schizophrenia_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as Schizophrenia
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 9
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, Schizophrenia
INTO #@studyName_Schizo
FROM Schizophrenia_CTE
WHERE rn=1;


--**************************************************************-
--************************ ascites *********************************
--**************************************************************

INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
SELECT 10 as codeset_id, 'asciteslist' as codeset_name, c.concept_id FROM
(
    SELECT DISTINCT I.concept_id FROM
    (
        SELECT concept_id FROM @schema.CONCEPT WHERE concept_id IN (@asciteslist) and invalid_reason is null
    ) I
) C;


WITH ascites_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as ascites
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 10
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, ascites
INTO #@studyName_ascites
FROM ascites_CTE
WHERE rn=1;


--**************************************************************-
--************************ hepatitis B *************************
--**************************************************************

-- INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
-- SELECT 11 as codeset_id, 'hepatitisB' as codeset_name, c.concept_id FROM
-- (
--     SELECT DISTINCT I.concept_id FROM
--     (
--         SELECT concept_id FROM CONCEPT WHERE concept_id IN (@hepatitisB) and invalid_reason is null
--     ) I
-- ) C;


WITH hepatitisB_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as hepatitisB
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 11
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, hepatitisB
INTO #@studyName_hepatitisB
FROM hepatitisB_CTE
WHERE rn=1;


--**************************************************************-
--************************ hepatitis B *************************        
--**************************************************************

-- INSERT INTO #@studyName_codesets (codeset_id, codeset_name, concept_id)
-- SELECT 12 as codeset_id, 'hepatitisC' as codeset_name, c.concept_id FROM
-- (
--     SELECT DISTINCT I.concept_id FROM
--     (
--         SELECT concept_id FROM CONCEPT WHERE concept_id IN (@hepatitisC) and invalid_reason is null
--     ) I
-- ) C;


WITH hepatitisC_CTE AS (
        SELECT ROW_NUMBER() OVER (PARTITION BY #@studyName_events.person_id ORDER BY #@studyName_events.person_id) as rn, #@studyName_events.person_id, 1 as hepatitisC
        FROM @schema.condition_era, #@studyName_events
        WHERE condition_concept_id in
        (
                SELECT concept_id from  #@studyName_codesets where codeset_id = 12
        )
        AND condition_era.person_id=#@studyName_events.person_id
        AND #@studyName_events.start_date <= condition_era.condition_era_start_date
)
SELECT person_id, hepatitisC
INTO #@studyName_hepatitisC
FROM hepatitisC_CTE
WHERE rn=1;


--*******************************************************
--***** this is a summary of most of the above data*******
--******************************************************

SELECT #@studyName_events.person_id, #@studyName_info.gender, #@studyName_info.birth_year, #@studyName_events.start_date as condition_start, #@studyName_events.end_date as condition_stop, #@studyName_events.op_start_date as observation_start, #@studyName_events.op_end_date as observation_stop, #@studyName_deaths.death_date,
#@studyName_gibleeding.gi_bleeding, #@studyName_gibleeding.gi_bleeding_diagnostic_date, #@studyName_cirrhosis.cirrhosis, #@studyName_cirrhosis.cirrhosis_diagnostic_date,  #@studyName_bblockers.beta_blocker as beta_blockers, #@studyName_transplant.transplant,
#@studyName_fibrosis.fibrosis, #@studyName_encephalopathy.encephalopathy, #@studyName_HCC.HCC, #@studyName_AlcIDis.AlcInducedOrganicMentalDisorder, #@studyName_Schizo.Schizophrenia, #@studyName_ascites.ascites, #@studyName_hepatitisB.hepatitisB, 
#@studyName_hepatitisC.hepatitisC
INTO #@sourceName_@studyName_summary
FROM #@studyName_events
LEFT JOIN #@studyName_info
ON #@studyName_events.person_id=#@studyName_info.person_id
left join #@studyName_Deaths
on #@studyName_events.person_id=#@studyName_deaths.person_id
left join #@studyName_gibleeding
on #@studyName_events.person_id=#@studyName_gibleeding.person_id
left join #@studyName_cirrhosis
on #@studyName_events.person_id=#@studyName_cirrhosis.person_id
left join #@studyName_bblockers
on #@studyName_events.person_id=#@studyName_bblockers.person_id
left join #@studyName_transplant
on #@studyName_events.person_id=#@studyName_transplant.person_id
left join #@studyName_fibrosis
on #@studyName_events.person_id=#@studyName_fibrosis.person_id
left join #@studyName_encephalopathy
on #@studyName_events.person_id=#@studyName_encephalopathy.person_id
left join #@studyName_HCC
on #@studyName_events.person_id=#@studyName_HCC.person_id
left join #@studyName_AlcIDis
on #@studyName_events.person_id=#@studyName_AlcIDis.person_id
left join #@studyName_Schizo
on #@studyName_events.person_id=#@studyName_Schizo.person_id
left join #@studyName_ascites
on #@studyName_events.person_id=#@studyName_ascites.person_id
left join #@studyName_hepatitisB
on #@studyName_events.person_id=#@studyName_hepatitisB.person_id
left join #@studyName_hepatitisC
on #@studyName_events.person_id=#@studyName_hepatitisC.person_id
ORDER BY cast(#@studyName_events.person_id as int) ASC;

---order by #@studyName_events.person_id;



SELECT #@studyName_codesets.codeset_id, #@studyName_codesets.codeset_name, concept.*
INTO #@sourceName_@studyName_codesets
FROM #@studyName_codesets 
LEFT JOIN @schema.concept
on #@studyName_codesets.concept_id = concept.concept_id;

SELECT * 
INTO #@sourceName_@studyName_events
FROM #@studyName_events;
