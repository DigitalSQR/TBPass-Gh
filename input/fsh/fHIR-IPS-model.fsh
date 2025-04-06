// IPS Logical Model - Fully Expanded with Proper FSH Indentation
Logical: IPSLogicalModelFHIR
Id: IPSLogicalModelFHIR
Title: "International Patient Summary Logical Model"
Description: "A fully detailed logical model derived from the IPS FHIR profiles, with proper FSH indentation and only contextually used data types."
* ^abstract = true



* identifier 0..* string "Identifier(s) for the IPS"
* status 1..1 code "Status of the IPS"

* patient 1..1 BackboneElement "Patient details"
  * identifier 1..* string "Identifier(s) for the patient"
  * name 1..* BackboneElement "Name of the patient"
    * text 0..* string "Name in text form"
    * family 1..1 string "Family name"
    * given 0..* string "Given names"
  * telecom 0..* string "Contact details"
  * gender 0..1 code "Gender of the patient"
  * birthDate 1..1 date "Date of birth"
  * address 0..* string "Patient address"
  * contact 0..* BackboneElement "Contact"
    * relationship 0..* CodeableConcept "Relationship to patient"
    * name 0..1 string "Name of contact"
    * telecom 0..* string "Contact details"
    * address 0..* string "Contact address"
  * generalPractitioner 0..* string "General practitioner"

* encounter 0..* Reference(Encounter) "Encounter details"
* date 1..1 dateTime "Date of the IPS"
* author 1..1 string "Author of the IPS"
* title 1..1 string "Title of the IPS"
* confidentiality 1..1 code "Confidentiality of the IPS"
* attester 0..* BackboneElement "Attester details"
  * mode 1..1 code "Attestation mode"
  * time 1..1 dateTime "Attestation time"
  * party 1..1 string "Attester party"

* custodian 1..1 string "Custodian of the IPS"




* medications 0..* BackboneElement "Medications"
  * medicationStatement 0..* BackboneElement "Medication Statement"
    * status 1..1 code "Medication statement status"
    * medication 1..1 BackboneElement "Medication details"
      * code 1..1 Reference "Medication Code"
      * reference 0..1 CodeableConcept "Medication reference"
    * effective[x] 1..1 dateTime "When medication was taken"
    * dosage 0..* BackboneElement "Dosage information"
      * text 0..1 string "Dosage free-text"
      * timing 0..1 string "Timing"
      * route 0..1 CodeableConcept "Route of administration"

  * medicationRequest 0..* BackboneElement "Medication Request"
    * status 1..1 code "Medication statement status"
    * medication 1..1 BackboneElement "Medication details"
      * code 1..1 Reference "Medication Code"
      * reference 0..1 CodeableConcept "Medication reference"
    * dosage 0..* BackboneElement "Dosage information"
      * text 0..1 string "Dosage free-text"
      * timing 0..1 string "Timing"
      * route 0..1 CodeableConcept "Route of administration"
    * dispenseRequest 0..1 BackboneElement "Dispense request"
      * validityPeriod 0..1 Period "Validity period"


//

* allergies 0..* BackboneElement "Allergies and intolerances"
  * allergyIntolerance 0..* BackboneElement "Allergies and intolerances"
    * verificationStatus 0..1 CodeableConcept "Verification status"
    * clinicalStatus 0..1 CodeableConcept "Clinical status"
    * type 0..1 code "Allergy type"
    * criticality 0..1 code "Allergy criticality"
    * code 1..1 CodeableConcept "Allergy code"
    * onsetDateTime 0..1 dateTime "Onset date"
    * abatementDateTime 0..1 dateTime "Abatement date"
    * reaction 0..* BackboneElement "Reactions"
      * manifestation 0..* CodeableConcept "Reaction manifestation"
      * severity 0..1 CodeableConcept "Severity"
  
// 

* problems 0..* BackboneElement "Problems"
  * condition 0..* BackboneElement "Condition details"
    * clinicalStatus 0..1 CodeableConcept "Clinical status"
    * verificationStatus 0..1 CodeableConcept "Verification status"
    * category 0..* CodeableConcept "Category"
    * severity 0..1 CodeableConcept "Severity"
    * code 1..1 CodeableConcept "Condition code"
    * bodySite 0..* CodeableConcept "Body site"

    * onsetDateTime 0..1 dateTime "Onset date"
    * abatementDateTime 0..1 dateTime "Abatement date"

  
* problemsHx 0..* BackboneElement "Problems"
  * condition 0..* BackboneElement "Condition details"
    * clinicalStatus 0..1 CodeableConcept "Clinical status"
    * verificationStatus 0..1 CodeableConcept "Verification status"
    * category 0..* CodeableConcept "Category"
    * severity 0..1 CodeableConcept "Severity"
    * code 1..1 CodeableConcept "Condition code"
    * bodySite 0..* CodeableConcept "Body site"

    * onsetDateTime 0..1 dateTime "Onset date"
    * abatementDateTime 0..1 dateTime "Abatement date"


* immunizations 0..* BackboneElement "Immunizations"
  * immunization 1..* BackboneElement "Immunization record"
    * status 1..1 code "Immunization status"
    * occurrence 1..1 dateTime "Date or time of immunization"
    * performer 0..* BackboneElement "Who performed the immunization"
      * actor 1..1 BackboneElement "Individual who performed the immunization"
        * name 1..1 string "Name"
        * telecom 0..* string "Contact info"
        * address 0..* string "Address"
    * vaccine 1..1 BackboneElement "Vaccine details"
      * vaccineCode 1..1 CodeableConcept "Vaccine or agent administered"
      * manufacturer 0..1 string "Vaccine manufacturer"
      * lotNumber 0..1 string "Lot number"
      * expirationDate 0..1 date "Vaccine expiration date"
      * site 0..1 CodeableConcept "Anatomical site of administration"
      * route 0..1 CodeableConcept "How vaccine was administered"

* medicalDevice 0..* BackboneElement "Medical devices"
  * deviceUseStatement 0..* BackboneElement "Usage statement"
    * timing 0..1 string "Timing of use"
    * source 0..1 string "Who reports the use of the device"
    * status 1..1 code "Use status"
    * bodySite 0..1 CodeableConcept "Where used on the body"
    * device 1..1 BackboneElement "Device details"
      * type 1..1 CodeableConcept "Type of device"
//      * manufacturer 0..1 string "Manufacturer"
//      * modelNumber 0..1 string "Model number"
//      * udiCarrier 0..1 string "UDI barcode or carrier"


* results 0..1 BackboneElement "Results"
  * observation 0..* BackboneElement "Observation result"
    * status 1..1 code "Status of the observation (e.g., final)"
    * category 0..* CodeableConcept "Classification (e.g., lab, imaging)"
    * code 1..1 CodeableConcept "Type of observation performed"
    * effective[x] 1..1 dateTime or Period "Clinically relevant time or time-period"
    * performer 0..* string "Who performed the observation"
    * value[x] 0..1 string "Actual observation result"
    * hasMember 0..* contentReference #IPSLogicalModelFHIR.results.observation "Linked or grouped observations"
    * component 0..* BackboneElement "Component result (e.g. systolic)"
      * code 1..1 CodeableConcept "Component code"
      * value[x] 0..1 string "Component result value"

//    * specimen 0..1 specimen "Specimen on which this observation is based"

//    * interpretation 0..1 CodeableConcept "Clinical interpretation"
//    * referenceRange 0..* BackboneElement "Reference range for result"
//      * low 0..1 quantity "Lower limit"
//      * high 0..1 quantity "Upper limit"

  * diagnosticReport 0..* BackboneElement "Diagnostic reports"
    * status 1..1 code "Status of the report"
    * category 0..* CodeableConcept "Service category (e.g., lab, imaging)"
    * code 1..1 CodeableConcept "Name of the diagnostic service"
    * effective[x] 0..1 dateTime or Period "When the observations were made"
//    * issued 0..1 dateTime "When the report was released"
    * performer 0..* string "Who was responsible for the report"
    * specimen 0..* contentReference #IPSLogicalModel.specimen "Referenced observation results"
//    * conclusion 0..1 string "Clinical conclusion"
//    * presentedForm 0..* string "Report as narrative or document"
  



* vitalSigns 0..1 BackboneElement "Vital signs"
  * observation 0..* BackboneElement "Observation result"
    * status 1..1 code "Status of the observation (e.g., final)"
    * category 0..* CodeableConcept "Classification (e.g., lab, imaging)"
    * code 1..1 CodeableConcept "Type of observation performed"
    * effective[x] 1..1 dateTime or Period "Clinically relevant time or time-period"
    * value[x] 0..1 string "Actual observation result"
    * dataAbentReason 0..1 CodeableConcept "Why the data is missing"
    * component 0..* BackboneElement "Component result (e.g. systolic)"
      * code 1..1 CodeableConcept "Component code"
      * value[x] 0..1 string "Component result value"
      * dataAbentReason 0..1 CodeableConcept "Why the data is missing"


* pastIllnessHx 0..* BackboneElement "Past illnesses"
  * condition 0..* BackboneElement "Condition details"
    * clinicalStatus 0..1 CodeableConcept "Clinical status"
    * verificationStatus 0..1 CodeableConcept "Verification status"
    * category 0..* CodeableConcept "Category"
    * severity 0..1 CodeableConcept "Severity"
    * code 1..1 CodeableConcept "Condition code"
    * bodySite 0..* CodeableConcept "Body site"

    * onsetDateTime 0..1 dateTime "Onset date"
    * abatementDateTime 0..1 dateTime "Abatement date"


* carePlan 0..* BackboneElement "Care plans"



* socialHistory 0..1 BackboneElement "Social history"
  * observationTobaccouse 0..1 BackboneElement "History of tobacco use"
    * code 1..1 CodeableConcept "Type of observation performed"
    * effective[x] 1..1 dateTime "Clinically relevant time or time-period"
    * valueCodeableConcept 0..1 CodeableConcept "Actual observation result"

  * observationAlcoholUse 0..1 BackboneElement "History of alcohol use"
    * code 1..1 CodeableConcept "Type of observation performed"
    * effective[x] 1..1 dateTime "Clinically relevant time or time-period"
    * valueQuantity 0..1 Quantity "Actual observation result"
  
  * observation 0..* BackboneElement "Observation result"
    * status 1..1 code "Status of the observation (e.g., final)"
    * category 0..* CodeableConcept "Classification (e.g., lab, imaging)"
    * code 1..1 CodeableConcept "Type of observation performed"
    * effective[x] 1..1 dateTime or Period "Clinically relevant time or time-period"
    * value[x] 0..1 CodeableConcept "Actual observation result"
    * dataAbentReason 0..1 CodeableConcept "Why the data is missing"
    * component 0..* BackboneElement "Component result (e.g. systolic)"
      * code 1..1 CodeableConcept "Component code"
      * value[x] 0..1 string "Component result value"
      * dataAbentReason 0..1 CodeableConcept "Why the data is missing"
    

* pregnancyHistory 0..* BackboneElement "Pregnancy history"
  * pregnancyStatus 0..* CodeableConcept "Pregnancy status"
    * status 1..1 code "Status of the observation (e.g., final)"
    * category 0..* CodeableConcept "Classification (e.g., lab, imaging)"
    * code 1..1 CodeableConcept "Type of observation performed"
    * effectiveDateTime 1..1 dateTime "Clinically relevant time or time-period"
    * valueCodeableConcept 0..1 CodeableConcept "Actual observation result"
    * dataAbentReason 0..1 CodeableConcept "Why the data is missing"
    * edd 0..1 dateTime "Estimated delivery date"
      * code 1..1 CodeableConcept "Component code"
      * valueDateTime 0..1 string "Component result value"
      * effectiveDateTime 1..1 dateTime "Clinically relevant time or time-period"


  * pregnancyOutcome 0..* CodeableConcept "Pregnancy outcome"
    * code 1..1 CodeableConcept "Type of observation performed"
    * effectiveDateTime 1..1 dateTime "Clinically relevant time or time-period"
    * valueQuantity 0..1 Quantity "Actual observation result"




* advanceDirectives 0..* BackboneElement "Advance directives"
  * type 1..1 CodeableConcept "Directive type"
  * description 0..1 string "Directive text"
  * status 0..1 code "Current status"



/*

* vitalSigns 0..* BackboneElement "Vital signs"
  * code 1..1 CodeableConcept "Vital sign name"
  * value[x] 1..1 quantity "Measured value"
  * effective[x] 0..1 dateTime "Measurement time"

  * code 1..1 CodeableConcept "Illness code"
  * onsetDateTime 0..1 dateTime "When it started"
  * abatementDateTime 0..1 dateTime "When it resolved"

* functionalStatus 0..* BackboneElement "Functional status"
  * code 1..1 CodeableConcept "Function assessed"
  * valueCodeableConcept 0..1 CodeableConcept "Level of function"
  * effectiveDateTime 0..1 dateTime "Assessment date"

* planOfCare 0..* BackboneElement "Planned care and interventions"
  * activity 0..* BackboneElement "Planned activity"
    * detail 0..1 CodeableConcept "Activity description"
    * status 0..1 code "Planned or completed"

* socialHistory 0..* BackboneElement "Social history"
  * code 1..1 CodeableConcept "Aspect of social history"
  * valueCodeableConcept 0..1 CodeableConcept "Social factor"

* pregnancyHistory 0..* BackboneElement "Pregnancy history"
  * status 0..1 CodeableConcept "Pregnancy status"
  * outcome 0..1 CodeableConcept "Outcome"
  * numberOfFetuses 0..1 integer "Number of fetuses"
  * deliveryDate 0..1 date "Delivery date"

* advanceDirectives 0..* BackboneElement "Advance directives"
  * type 1..1 CodeableConcept "Directive type"
  * description 0..1 string "Directive text"
  * status 0..1 code "Current status"




* procedure 0..* BackboneElement "Procedure history"
  * code 1..1 CodeableConcept "Procedure code"
  * performed[x] 1..1 dateTime "Date or period of procedure"
  * bodySite 0..* CodeableConcept "Body site"
  * performer 0..* BackboneElement "Performer details"
    * actor 0..1 string "Who performed the procedure"


* organization 0..* BackboneElement "Organization info"
  * name 1..1 string "Organization name"
  * telecom 0..* string "Contact"
  * address 0..* string "Address"


* flag 0..* BackboneElement "Patient alerts"
  * status 1..1 code "Flag status"
  * category 0..1 CodeableConcept "Alert category"
  * code 1..1 CodeableConcept "Alert code"
  * extension:flag-priority 0..1 string "Priority of the alert"

*/



* HCPractitioner 0..* BackboneElement "Practitioner info"
  * name 1..1 string "Name"
  * telecom 0..* string "Contact info"
  * address 0..* string "Address"


* specimen 0..* BackboneElement "Specimen used for lab results"
  * type 1..1 CodeableConcept "Specimen type"
  * subject 1..1 string "Subject of specimen"
  * collection 0..1 BackboneElement "Collection details"
    * method 0..1 CodeableConcept "Collection method"
    * bodySite 0..1 CodeableConcept "Collection site"
    * fastingStatus[x] 0..1 CodeableConcept "Fasting status"