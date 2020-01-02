#!/bin/bash
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-DrugTierVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-DrugTierCS.json
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-CoinsuranceOptionVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-CoinsuranceOptionCS.json
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-CopayOptionVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-CopayOptionCS.json
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-PharmacyTypeVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-PharmacyTypeCS.json
for i in ~/cimpl/devr4_4_out/fhir/guide/resources/*.json; do sed -i .bak -f ~/git/pdex-formulary-cimpl/fixfhirversion.sed $i; done
for i in ~/cimpl/devr4_4_out/fhir/profiles/*.json; do sed -i .bak -f ~/git/pdex-formulary-cimpl/fixfhirversion.sed $i; done
for i in ~/cimpl/devr4_4_out/fhir/logical/*.json; do sed -i .bak -f ~/git/pdex-formulary-cimpl/fixfhirversion.sed $i; done
