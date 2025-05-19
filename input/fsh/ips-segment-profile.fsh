Profile: TBPassComposition
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Composition-uv-ips
Id: tb-pass-composition
Title: "TB Pass IPS Composition"
Description: "The IPS Composition customized for TB Pass reporting."

* status 1..1 MS
* type 1..1 MS
* subject 1..1 MS
* date 1..1 MS
* author 1..1 MS
* title 1..1 MS
* section 1..* MS

* subject only Reference(TBPassPatient)

//* section contains sectionAllergies 0..* and 
    //sectionProblems 0..* and
    //sectionMedications 0..* and
    //sectionResults 0..* and 
    //sectionVitalSigns 0..* and
    //sectionImmunizations 0..*


// Add Data Absent Reason for mandatory IPS sections that are not mapped

* section[sectionAllergies]
  * ^short = "Reason data is absent"
  * entry
    * extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named absent-reason 1..1
    * extension[absent-reason].valueCode = #unknown

  * title = "No allergies"
  * text.div = "<div>No known allergies</div>"
  * text.status = #generated


* section[sectionImmunizations]
  * ^short = "Reason data is absent"
  * extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named absent-reason 1..1
  * extension[absent-reason].valueCode = #unknown
  * text.div = "<div>Immunizations are not recorded</div>"
  * text.status = #generated




//// can't slice on reference...

// * section[sectionMedications].entry[medicationStatement] 
//   * ^slicing.discriminator.type = #pattern
//   * ^slicing.rules = #open
//   * ^slicing.discriminator[0].path = code
//   * ^slicing.ordered = false   // can be omitted, since false is the default

// * section[sectionMedications].entry[medicationStatement] contains tpt 0..* and regimen 0..*

// * section[sectionMedications].entry[medicationStatement][tpt].code = #10160-0 "History of Medication use Narrative"
// * section[sectionMedications].entry[medicationStatement][regimen].code = #101630-0 "History of Medication use Narrative"

* section[sectionMedications].entry[medicationStatement] only Reference(TBPassRegimenMedicationStatement)





//* section[sectionVitalSigns].code = $loinc#8716-3 "Vital signs"
* section[sectionVitalSigns].entry[vitalSign] only Reference(TBPassVitalSigns)
* section[sectionVitalSigns].entry[vitalSign] MS


* section[sectionProblems].entry
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[0].path = resolve()
  * ^slicing.rules = #open
* section[sectionProblems].entry[problem] contains tb 1..1
* section[sectionProblems].entry[problem][tb] only Reference(TBPassTBProblem)





* section[sectionResults]
  * ^slicing.discriminator[0].type = #profile
  * ^slicing.discriminator[0].path = resolve()
  * ^slicing.rules = #open

  * entry contains treatmentOutcome 0..* and labResults 0..* // and xray 0..* and tbScreening 0..*
  * entry[treatmentOutcome] only Reference(TBPassTreatmentOutcome)
  * entry[labResults] only Reference(TBPassLabResults)





//* section[sectionResults].entry only Reference(XRayDiagnosticReport or TBScreening or LabResults)

Profile: TBPassPatient
Parent: Patient-uv-ips
Id: tb-pass-patient
Title: "TB Pass Patient"
Description: "Patient for TB Pass."

* identifier
  * ^slicing.discriminator[0].path = system
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.rules = #open
  * ^slicing.ordered = false

* identifier contains
  clientRegistrationNumber 0..1 and 
  nationalIDNumber 0..1 and
  nhisNumber 0..1

* identifier[clientRegistrationNumber]
  * ^short = "Client Registration Number"
  * ^definition = "The unique identifier assigned to the patient by the health facility."
  * system = "http://fhir.nhis.gov.gh/Identifier/ClientRegistrationNumber"

* identifier[nationalIDNumber]
  * ^short = "National ID Number"
  * ^definition = "The unique identifier assigned to the patient by the national health insurance scheme."
  * system = "http://fhir.nhis.gov.gh/Identifier/NationalIDNumber"

* identifier[nhisNumber]
  * ^short = "NHIS Number"
  * ^definition = "The unique identifier assigned to the patient by the national health insurance scheme."
  * system = "http://fhir.nhis.gov.gh/Identifier/NHISNumber"

* identifier[clientRegistrationNumber].value 1..1 MS
* identifier[nationalIDNumber].value 1..1 MS
* identifier[nhisNumber].value 1..1 MS

* gender MS

* name
  * family 1..1 MS
  * given 0..* MS

* telecom
  * ^slicing.discriminator[0].path = system
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.rules = #open
  * ^slicing.ordered = false

* telecom contains
    phone 0..1

* telecom[phone]
  * ^short = "Phone"
  * ^definition = "The phone number of the patient."
  * system = #phone
* telecom[phone].value 1..1 MS








// Profile: XRayDiagnosticReport
// Parent: DiagnosticReport
// Id: xray-diagnosticreport
// Title: "TB Pass X-Ray DiagnosticReport"
// Description: "A DiagnosticReport profile summarizing X-Ray findings."

// Profile: TBScreening
// Parent: Observation
// Id: tb-screening
// Title: "TB Pass Screening"
// Description: "An Observation profile for TB screening results."


// Profile: LabResults
// Parent: DiagnosticReport
// Id: lab-results
// Title: "TB Pass Lab Results"
// Description: "An Observation profile for lab results."


// Profile: TPTMedicationStatement
// Parent: MedicationStatement
// Id: tpt-medicationstatement
// Title: "Ghana TPT TBMedicationStatement"
// Description: "The IPS Medication Statement customized for TB Pass reporting."


Profile: TBPassRegimenMedicationStatement
Parent: MedicationStatement-uv-ips
Id: regimen-medicationstatement
Title: "TB Pass TBMedicationStatement"
Description: "The IPS Medication Statement customized for TB reporting."


* effectivePeriod 1..1 MS
// * category
//   * ^slicing.discriminator[0].path = coding.system
//   * ^slicing.discriminator[0].type = #pattern
//   * ^slicing.rules = #open
//   * ^slicing.ordered = false

* category 
  * ^short = "Regimen Type"
  * ^definition = "The type of regimen."
  * coding
    * system = "http://fhir.nhis.gov.gh/CodeSystem/RegimenType"


* category from RegimenTypesVS
* note MS





Profile: TBPassLabResults
Parent: Observation-results-uv-ips
Id: lab-results-observation
Title: "TB Pass Treatment Outcome"
Description: "An Observation profile for TB treatment outcomes."
* code 1..1 MS
* code from TestTypesVS
* effectiveDateTime 1..1 MS
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from TestResultsVS

* specimen MS
* specimen only Reference(TBPassSpecimen)

* note MS


ValueSet: TestTypesVS
Id: test-types-vs
Title: "Test Types ValueSet"
Description: "A ValueSet for Test Types."
* include codes from system TestTypes

CodeSystem: TestTypes
Id: test-types
Title: "Test Types CodeSystem"
Description: "A CodeSystem for Test Types."
* ^url = "http://fhir.nhis.gov.gh/CodeSystem/TestType"

* #sputum-smear "Sputum Smear"
* #lpa "LPA"
* #culture "Culture"


ValueSet: TestResultsVS
Id: test-results-vs
Title: "Test Results ValueSet"
Description: "A ValueSet for Test Results."
* include codes from system TestResults

CodeSystem: TestResults
Id: test-results
Title: "Test Results CodeSystem"
Description: "A CodeSystem for Test Results."
* ^url = "http://fhir.nhis.gov.gh/CodeSystem/TestResult"

* #negative "Negative"
* #positive-scanty "Positive (scanty)"
* #positive-1 "Positive (+)"
* #positive-2 "Positive (++)"
* #positive-3 "Positive (+++)"



Profile: TBPassSpecimen
Parent: Specimen-uv-ips
Id: tb-pass-specimen
Title: "TB Pass Specimen"

* identifier 
  * ^slicing.discriminator[0].path = system
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.rules = #open
  * ^slicing.ordered = false

* identifier contains tbpassSpecimenId 1..1
* identifier[tbpassSpecimenId]
  * ^short = "TB Pass Specimen ID"
  * ^definition = "The unique identifier assigned to the specimen by the TB Pass system."
  * system = "http://fhir.nhis.gov.gh/Identifier/TBPassSpecimenID"

* identifier[tbpassSpecimenId].value 1..1 MS

* type 1..1 MS
* type from SpecimenTypesVS


ValueSet: SpecimenTypesVS
Id: specimen-types-vs
Title: "Specimen Types ValueSet"
Description: "A ValueSet for Specimen Types."
* include codes from system SpecimenTypes

CodeSystem: SpecimenTypes
Id: specimen-types
Title: "Specimen Types CodeSystem"
Description: "A CodeSystem for Specimen Types."
* ^url = "http://fhir.nhis.gov.gh/CodeSystem/SpecimenType"

* #sputum "Sputum"
* #stool "Stool"
* #gastric-lavage "Gastric Lavage"



Profile: TBPassTreatmentOutcome
Parent: Observation-results-uv-ips
Id: treatment-outcome-observation
Title: "TB Pass Treatment Outcome"
Description: "An Observation profile for TB treatment outcomes."
* status 1..1 MS
* code 1..1 MS
* code from TreatmentOutcomeVS
* effectivePeriod.end 1..1 MS


//* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationStatement.category named category 0..* MS


ValueSet: RegimenTypesVS
Id: regimen-types-vs
Title: "Regimen Types ValueSet"
Description: "A ValueSet for Regimen Types."

* include codes from system RegimenTypes

CodeSystem: RegimenTypes
Id: regimen-types
Title: "Regimen Types CodeSystem"
Description: "A CodeSystem for Regimen Types."

* ^url = "http://fhir.nhis.gov.gh/CodeSystem/RegimenType"

* #first-line "First-line treatment"
* #second-line "Second-line treatment"





ValueSet: TreatmentOutcomeVS
Id: treatment-outcome-vs
Title: "Treatment Outcome ValueSet"
Description: "A ValueSet for Treatment Outcomes."
* include codes from system TreatmentOutcome


CodeSystem: TreatmentOutcome
Id: treatment-outcome
Title: "Treatment Outcome CodeSystem"
Description: "A CodeSystem for Treatment Outcomes."
* ^url = "http://fhir.nhis.gov.gh/CodeSystem/TreatmentOutcome"
* #cured "Cured"
* #treatment-failure "Treatment Failure"
* #treatment-completed "Treatment Completed"
* #not-evaluable "Not Evaluated"
* #died "Died"
* #transferred-out "Transferred Out"
* #lost-to-follow-up "Lost to Follow Up"
* #not-done "Not Done"
* #unknown "Unknown"
* #treatment-delayed "Treatment Delayed"
* #treatment-ongoing "Treatment Ongoing"
* #treatment-terminated "Treatment Terminated"




Profile: TBPassTBProblem
Parent: Condition-uv-ips
Id: tb-problem
Title: "TB Pass Problem"
Description: "A Condition profile to represent TB suspicion or confirmed case."
//* clinicalStatus 1..1 MS
* bodySite 1..1 MS
* recordedDate 1..1 MS
* code 1..1 MS


// Profile: OtherProblems
// Parent: Condition
// Id: other-problems
// Title: "Other Problems"
// Description: "A Condition representing other problems."



// Profile: GhanaTBCondition
// Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Condition-uv-ips
// Id: ghana-tb-condition
// Title: "TB Pass IPS Condition"
// Description: "A Condition profile to represent TB suspicion, HIV infection, and other mapped problems."



// * clinicalStatus 1..1 MS
// * verificationStatus MS
// * category 1..* MS
// * code 1..1 MS
// * subject 1..1 MS
// * onsetDateTime MS
// * recordedDate MS


Profile: TBPassVitalSigns
Parent: http://hl7.org/fhir/StructureDefinition/vitalsigns
Id: ghana-tb-vital-signs
Title: "TB Pass IPS Vital Signs"
Description: "An Observation profile for vital signs."




Profile: TBPassObservation
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-results-uv-ips
Id: ghana-tb-observation
Title: "TB Pass IPS Observation"
Description: "An Observation profile for lab results, vital signs, treatment delays and outcomes."

// * status 1..1 MS
// * code 1..1 MS
// * subject 1..1 MS
// * effective[x] MS
// * value[x] MS

// Profile: GhanaTBProcedure
// Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Procedure-uv-ips
// Id: ghana-tb-procedure
// Title: "TB Pass IPS Procedure"
// Description: "A Procedure profile for TB screening and case notification."

// * status 1..1 MS
// * code 1..1 MS
// * subject 1..1 MS
// * performed[x] MS
// * reasonCode MS

// Profile: GhanaTBDiagnosticReport
// Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/DiagnosticReport-uv-ips
// Id: ghana-tb-diagnosticreport
// Title: "TB Pass IPS DiagnosticReport"
// Description: "A DiagnosticReport profile summarizing TB diagnostic findings."

// * status 1..1 MS
// * category MS
// * code 1..1 MS
// * subject 1..1 MS
// * effective[x] MS
// * result MS

// Profile: GhanaTBRelatedPerson
// Parent: RelatedPerson
// Id: ghana-tb-relatedperson
// Title: "TB Pass RelatedPerson"
// Description: "A RelatedPerson profile for contact tracing."

// * patient 1..1 MS
// * relationship MS
// * name MS
// * telecom MS
