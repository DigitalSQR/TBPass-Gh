Logical: TBPatientIPS
Id: tb-patient-ips
Title: "TB Patient IPS Logical Model"
Description: "Logical model representing a mapped subset of the TB Pass dataset to FHIR IPS"

// ToDo: Date of registration...

* patient 1..1 BackboneElement "Patient Info"
  * clientRegistrationNumber 0..* Identifier "Patient Identifiers"
  * nationalIDNumber 0..* Identifier "Patient Identifiers"
  * nhisNumber 0..* Identifier "Patient Identifiers"

  * name 1..* BackboneElement "Patient Name"
    * given 1..* string "Given name"
      * ^comment = "Maps to First Name (GHTB-006), Middle Name (GHTB-007)"
    * family 1..1 string "Family name"
      * ^comment = "Maps to Last Name (GHTB-008)"

// ToDo: Middle Name ???

  * gender 1..1 code "Administrative Gender"
  * gender from http://hl7.org/fhir/ValueSet/administrative-gender

//  * maritalStatus 0..1 CodeableConcept "Marital Status"

  * mobilePhone 0..1 ContactPoint "Mobile Phone"

// ToDo: Occupation


* tbCondition 1..1 CodeableConcept "TB Condition"
  * dateOfDiagnosis 0..1 date "Date of Diagnosis"
  * diagnosis 0..1 CodeableConcept "Diagnosis"
// Confirmation method/ case definition



// ToDo: History of previous treatment - not in diagnosis?

  * diseaseSite 0..1 CodeableConcept "Disease Site"

// ToDo: drugResistance 



* currentTBTreatment 0..1 BackboneElement "Current TB Treatment"
  * treatmentStartDate 0..1 date "Treatment Start Date"
  * facility 0..1 Reference "Facility"
  * regimenType 0..1 CodeableConcept "Treatment Regimen"   // regimenType???

/////////// height.......
  * height 0..1 Quantity "Height"
  * weight 0..1 Quantity "Weight"

  * treatmentEndDate 0..1 date "Treatment End Date"

  * outcomeDueDate 0..1 date "Outcome Due Date" // outcome? Due date?
  * treatmentNotes 0..1 string "Treatment Notes"
  
/// treatment oucome due date above, but outcomes below?

* treatmentOutcome 0..1 BackboneElement "Treatment Outcome"
  * outcome 0..1 CodeableConcept "Treatment outcome"
  * outcome from TreatmentOutcomeVS
  * treatmentEndDate 0..1 date "Outcome status"

* labResults 0..* BackboneElement "Lab Results"
  * testType 0..1 CodeableConcept "Lab Test"
  * testDate 0..1 date "Test Date"
  * result 0..1 CodeableConcept "Result"
  * notes 0..1 string "Notes"
  * sampleType 0..1 CodeableConcept "Sample Type"
  * sampleId 0..1 Identifier "Sample ID"

