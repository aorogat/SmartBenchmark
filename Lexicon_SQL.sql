 SELECT "Confident_VP_S_O"."PredicateURI",
    "Confident_VP_S_O"."Context_Subject",
    "Confident_VP_S_O"."Context_Object",
    "Confident_VP_S_O"."VP" AS "VP_S_O",
    "Confident_NP_S_O"."NP" AS "NP_S_O",
    "Confident_VP_O_S"."VP" AS "VP_O_S",
    "Confident_NP_O_S"."NP" AS "NP_O_S"
   FROM ( SELECT "Confident_VP_S_O_1"."Context_Subject",
            "Confident_VP_S_O_1"."Context_Object",
            "Confident_VP_S_O_1"."PredicateURI",
            "Confident_VP_S_O_1"."VP",
            "Confident_VP_S_O_1".conf,
            "Confident_VP_S_O_1".rank
           FROM "Confident_VP_S_O" "Confident_VP_S_O_1"
          WHERE "Confident_VP_S_O_1".conf >= 1::double precision OR "Confident_VP_S_O_1".conf IS NULL) "Confident_VP_S_O"
     FULL JOIN ( SELECT "Confident_NP_S_O_1"."PredicateURI",
            "Confident_NP_S_O_1"."Context_Subject",
            "Confident_NP_S_O_1"."Context_Object",
            "Confident_NP_S_O_1"."NP",
            "Confident_NP_S_O_1".conf,
            "Confident_NP_S_O_1".weight
           FROM "Confident_NP_S_O" "Confident_NP_S_O_1"
          WHERE "Confident_NP_S_O_1".conf >= 1::double precision OR "Confident_NP_S_O_1".conf IS NULL) "Confident_NP_S_O" USING ("PredicateURI", "Context_Subject", "Context_Object")
     FULL JOIN ( SELECT "Confident_VP_O_S_1"."Context_Subject",
            "Confident_VP_O_S_1"."Context_Object",
            "Confident_VP_O_S_1"."PredicateURI",
            "Confident_VP_O_S_1"."VP",
            "Confident_VP_O_S_1".conf,
            "Confident_VP_O_S_1".rank
           FROM "Confident_VP_O_S" "Confident_VP_O_S_1"
          WHERE "Confident_VP_O_S_1".conf >= 1::double precision OR "Confident_VP_O_S_1".conf IS NULL) "Confident_VP_O_S" USING ("PredicateURI", "Context_Subject", "Context_Object")
     FULL JOIN ( SELECT "Confident_NP_O_S_1"."PredicateURI",
            "Confident_NP_O_S_1"."Context_Subject",
            "Confident_NP_O_S_1"."Context_Object",
            "Confident_NP_O_S_1"."NP",
            "Confident_NP_O_S_1".conf,
            "Confident_NP_O_S_1".weight
           FROM "Confident_NP_O_S" "Confident_NP_O_S_1"
          WHERE "Confident_NP_O_S_1".conf >= 1::double precision OR "Confident_NP_O_S_1".conf IS NULL) "Confident_NP_O_S" USING ("PredicateURI", "Context_Subject", "Context_Object")
  WHERE "Confident_VP_S_O"."PredicateURI" IS NOT NULL;
