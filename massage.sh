#!/bin/bash
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-DrugTierVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-DrugTierCS.json
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-CoinsuranceOptionVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-CoinsuranceOptionCS.json
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-CopayOptionVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-CopayOptionCS.json
ruby massage.rb ~/cimpl/devr4_4_out/fhir/guide/resources/valueset-usdf-PharmacyTypeVS.json ~/cimpl/devr4_4_out/fhir/guide/resources/codesystem-usdf-PharmacyTypeCS.json
rm ~/cimpl/devr4_4_out/fhir/logical/*.bak ~/cimpl/devr4_4_out/fhir/profiles/*.bak ~/cimpl/devr4_4_out/fhir/guide/resources/*.bak ~/cimpl/devr4_4_out/fhir/guide/*.json.bak
