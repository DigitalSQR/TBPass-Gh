
Profile: GhanaTBComposition
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Composition-uv-ips
Id: ghana-tb-composition
Title: "Ghana TB IPS Composition"
Description: "The IPS Composition customized for Ghana TB reporting."

* status 1..1 MS
* type 1..1 MS
* subject 1..1 MS
* date 1..1 MS
* author 1..1 MS
* title 1..1 MS
* section 1..* MS

//* section contains sectionAllergies 0..* and 
    //sectionProblems 0..* and
    //sectionMedications 0..* and
    //sectionResults 0..* and 
    //sectionVitalSigns 0..* and
    //sectionImmunizations 0..*


// Add Data Absent Reason for mandatory IPS sections that are not mapped

* section[sectionAllergies]
  * entry contains data-absent 0..1
  * entry[data-absent]
    * ^short = "Reason data is absent"
    * extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named reason 1..1
    * extension[reason].valueCode = #unknown




* section[sectionImmunizations]
  * entry contains data-absent 0..1
  * entry[data-absent]
    * ^short = "Reason data is absent"
    * extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named reason 1..1
    * extension[reason].valueCode = #unknown



//// can't slice on reference...

// * section[sectionMedications].entry[medicationStatement] 
//   * ^slicing.discriminator.type = #pattern
//   * ^slicing.rules = #open
//   * ^slicing.discriminator[0].path = code
//   * ^slicing.ordered = false   // can be omitted, since false is the default


// * section[sectionMedications].entry[medicationStatement] contains tpt 0..* and regimen 0..*


// * section[sectionMedications].entry[medicationStatement][tpt].code = #10160-0 "History of Medication use Narrative"
// * section[sectionMedications].entry[medicationStatement][regimen].code = #101630-0 "History of Medication use Narrative"

* section[sectionMedications].entry only Reference(TPTMedicationStatement or RegimenMedicationStatement)

* section[sectionProblems].entry only Reference(TBProblem or OtherProblems)








//* section[sectionVitalSigns].code = $loinc#8716-3 "Vital signs"
* section[sectionVitalSigns].entry only Reference(GhanaTBObservation)
* section[sectionVitalSigns].entry MS









* section[sectionResults].entry only Reference(XRayDiagnosticReport or TBScreening or LabResults)




Profile: XRayDiagnosticReport
Parent: DiagnosticReport
Id: xray-diagnosticreport
Title: "Ghana TB X-Ray DiagnosticReport"
Description: "A DiagnosticReport profile summarizing X-Ray findings."

Profile: TBScreening
Parent: Observation
Id: tb-screening
Title: "Ghana TB Screening"
Description: "An Observation profile for TB screening results."


Profile: LabResults
Parent: DiagnosticReport
Id: lab-results
Title: "Ghana TB Lab Results"
Description: "An Observation profile for lab results."


Profile: TPTMedicationStatement
Parent: MedicationStatement
Id: tpt-medicationstatement
Title: "Ghana TPT TBMedicationStatement"
Description: "The IPS Medication Statement customized for Ghana TB reporting."

Profile: RegimenMedicationStatement
Parent: MedicationStatement
Id: regimen-medicationstatement
Title: "Ghana Regimen TBMedicationStatement"
Description: "The IPS Medication Statement customized for Ghana TB reporting."


Profile: TBProblem
Parent: Condition
Id: tb-problem
Title: "Ghana TB Problem"
Description: "A Condition profile to represent TB suspicion or confirmed case."
* clinicalStatus 1..1 MS

Profile: OtherProblems
Parent: Condition
Id: other-problems
Title: "Other Problems"
Description: "A Condition representing other problems."









Profile: GhanaTBCondition
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Condition-uv-ips
Id: ghana-tb-condition
Title: "Ghana TB IPS Condition"
Description: "A Condition profile to represent TB suspicion, HIV infection, and other mapped problems."

* clinicalStatus 1..1 MS
* verificationStatus MS
* category 1..* MS
* code 1..1 MS
* subject 1..1 MS
* onsetDateTime MS
* recordedDate MS


Profile: GhanaTBObservation
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-results-uv-ips
Id: ghana-tb-observation
Title: "Ghana TB IPS Observation"
Description: "An Observation profile for lab results, vital signs, treatment delays and outcomes."

* status 1..1 MS
* code 1..1 MS
* subject 1..1 MS
* effective[x] MS
* value[x] MS

Profile: GhanaTBProcedure
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Procedure-uv-ips
Id: ghana-tb-procedure
Title: "Ghana TB IPS Procedure"
Description: "A Procedure profile for TB screening and case notification."

* status 1..1 MS
* code 1..1 MS
* subject 1..1 MS
* performed[x] MS
* reasonCode MS

Profile: GhanaTBDiagnosticReport
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/DiagnosticReport-uv-ips
Id: ghana-tb-diagnosticreport
Title: "Ghana TB IPS DiagnosticReport"
Description: "A DiagnosticReport profile summarizing TB diagnostic findings."

* status 1..1 MS
* category MS
* code 1..1 MS
* subject 1..1 MS
* effective[x] MS
* result MS

Profile: GhanaTBRelatedPerson
Parent: RelatedPerson
Id: ghana-tb-relatedperson
Title: "Ghana TB RelatedPerson"
Description: "A RelatedPerson profile for contact tracing."

* patient 1..1 MS
* relationship MS
* name MS
* telecom MS
