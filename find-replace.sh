#!/bin/bash

#enter the text you want to find and raplace in the URI
find="uri1.com"
replace="uri2.com"

#Optionally set a pause between SPARQL queries
pause=1

# set the endpoint
sparqlEndpoint="http://localhost:10080/blazegraph/sparql"


echo "--------------------------------------- NAMED GRAPHS ---------------------------------------"

echo "Number of NAMED GRAPHS with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?g) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?g), "'$find'", "i")   )   }  }'

sleep $pause

echo "************ STARTING UPDATE OF NAMED GRAPHS ************"
echo "Mutation Count on UPDATE:"
curl -s $sparqlEndpoint --data-urlencode 'update=delete{ GRAPH ?g  { ?s ?p ?o}}insert{ GRAPH ?g2  { ?s ?p ?o}  } where {  GRAPH ?g  {  ?s ?p ?o    FILTER(regex(str(?g), "'$find'", "i")   ) BIND( URI(replace(str(?g), "'$find'", "'$replace'", "i")) AS ?g2 )    }}' | grep -oPm2 "(?<=mutationCount=)[^<]+"
echo "************ END UPDATE OF NAMED GRAPHS ************"


sleep $pause

echo "NEW Number of NAMED GRAPHS with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?g) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?g), "'$find'", "i")   )   }  }'

sleep $pause

echo "NEW Number of NAMED GRAPHS with replaced term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?g) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?g), "'$replace'", "i")   )   }  }'

sleep $pause

echo "--------------------------------------- SUBJECTS ---------------------------------------"

echo "Number of SUBJECTS with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?s) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?s), "'$find'", "i")   )   }  }'

sleep $pause

echo "************ STARTING UPDATE OF SUBJECTS ************"
echo "Mutation Count on UPDATE:"
curl -s $sparqlEndpoint --data-urlencode 'update=delete{ GRAPH ?g  { ?s ?p ?o}}insert{ GRAPH ?g  { ?s2 ?p ?o}  } where {  GRAPH ?g  {  ?s ?p ?o    FILTER(regex(str(?s), "'$find'", "i")   ) BIND( URI(replace(str(?s), "'$find'", "'$replace'", "i")) AS ?s2 )    }}' | grep -oPm2 "(?<=mutationCount=)[^<]+"
echo "************ END UPDATE OF SUBJECTS ************"
sleep $pause

echo "NEW Number of SUBJECTS with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?s) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?s), "'$find'", "i")   )   }  }'

sleep $pause

echo "NEW Number of SUBJECTS with replaced term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?s) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?s), "'$replace'", "i")   )   }  }'

sleep $pause

echo "--------------------------------------- PREDICATES ---------------------------------------"

echo "Number of PREDICATES with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?p) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?p), "'$find'", "i")   )   }  }'

sleep $pause

echo "************ STARTING UPDATE OF PREDICATES ************"
echo "Mutation Count on UPDATE:"
curl -s $sparqlEndpoint --data-urlencode 'update=delete{ GRAPH ?g  { ?s ?p ?o}}insert{ GRAPH ?g  { ?s ?p2 ?o}  } where {  GRAPH ?g  {  ?s ?p ?o    FILTER(regex(str(?p), "'$find'", "i")   ) BIND( URI(replace(str(?p), "'$find'", "'$replace'", "i")) AS ?p2 )    }}' | grep -oPm2 "(?<=mutationCount=)[^<]+"
echo "************ END UPDATE OF PREDICATES ************"
sleep $pause

echo "NEW Number of PREDICATES with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?p) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?p), "'$find'", "i")   )   }  }'

sleep $pause

echo "NEW Number of PREDICATES with replaced term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?p) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?p), "'$replace'", "i")   )   }  }'

sleep $pause

echo "--------------------------------------- OBJECTS ---------------------------------------"

echo "Number of OBJECTS with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?o) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?o), "'$find'", "i")   )   }  }'

sleep $pause

echo "************ STARTING UPDATE OF OBJECTS ************"
echo "Mutation Count on UPDATE:"
curl -s $sparqlEndpoint --data-urlencode 'update=delete{ GRAPH ?g  { ?s ?p ?o}}insert{ GRAPH ?g  { ?s ?p ?o2}  } where {  GRAPH ?g  {  ?s ?p ?o    FILTER(regex(str(?o), "'$find'", "i")   ) BIND( URI(replace(str(?o), "'$find'", "'$replace'", "i")) AS ?o2 )    }}' | grep -oPm2 "(?<=mutationCount=)[^<]+"
echo "************ END UPDATE OF OBJECTS ************"
sleep $pause

echo "NEW Number of OBJECTS with find term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?o) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?o), "'$find'", "i")   )   }  }'

sleep $pause

echo "NEW Number of OBJECTS with replaced term:"
curl $sparqlEndpoint -H 'Accept:text/csv' --data-urlencode 'query=Select (COUNT(?o) as ?count)where {     graph ?g   {?s ?p ?o   FILTER( regex(str(?o), "'$replace'", "i")   )   }  }'

