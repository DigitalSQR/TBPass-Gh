Instance: TBPassExample
InstanceOf: Bundle-uv-ips
Title: "TB Pass Example Bundle"
Description: "Example TB Pass Bundle for Bernard Wadie"
* type = #document
* identifier.value = "TBPass-001"
* timestamp = "2025-05-11T10:00:00Z"
* entry[composition].fullUrl = "http://example.org/fhir/TBPassComposition/tbpass-composition-001"
* entry[composition].resource = tbpass-composition-001
* entry[patient].fullUrl = "http://example.org/fhir/Patient/tbpass-patient-bernard"
* entry[patient].resource = tbpass-patient-bernard

* entry[condition][+].fullUrl = "http://example.org/fhir/TBPassTBProblem/tbpass-problem-tb"
* entry[condition][=].resource = tbpass-problem-tb
* entry[+].fullUrl = "http://example.org/fhir/TBPassRegimenMedicationStatement/tbpass-treatment-regimen"
* entry[=].resource = tbpass-treatment-regimen
* entry[+].fullUrl = "http://example.org/fhir/TBPassVitalSigns/tbpass-vitals"
* entry[=].resource = tbpass-vitals
* entry[+].fullUrl = "http://example.org/fhir/TBPassTreatmentOutcome/tbpass-treatment-outcome"
* entry[=].resource = tbpass-treatment-outcome
* entry[+].fullUrl = "http://example.org/fhir/TBPassSpecimen/tbpass-specimen-ak001"
* entry[=].resource = tbpass-specimen-ak001
* entry[+].fullUrl = "http://example.org/fhir/TBPassLabResults/tbpass-labresult-001"
* entry[=].resource = tbpass-labresult-001



Instance: tbpass-patient-bernard
InstanceOf: TBPassPatient
Title: "TB Pass Patient Bernard Wadie"
Description: "Patient record for Bernard Wadie"
* identifier[clientRegistrationNumber].system = "http://fhir.nhis.gov.gh/Identifier/ClientRegistrationNumber"
* identifier[clientRegistrationNumber].value = "250508-0001-AF00010101"
* identifier[nationalIDNumber].system = "http://fhir.nhis.gov.gh/Identifier/NationalIDNumber"
* identifier[nationalIDNumber].value = "GHA-123456789-0"
* identifier[nhisNumber].system = "http://fhir.nhis.gov.gh/Identifier/NHISNumber"
* identifier[nhisNumber].value = "123456789"
* name.family = "Wadie"
* name.given[0] = "Bernard" 
* name.given[1] = "Kwasi"
* gender = #male
* telecom[phone].system = #phone
* telecom[phone].value = "247775121"

* birthDate = "2018"



Instance: tbpass-problem-tb
InstanceOf: TBPassTBProblem
Title: "TB Diagnosis"
Description: "Confirmed TB case for Bernard Wadie"
* code.text = "Tuberculosis"
* bodySite.text = "Lungs"
* recordedDate = "2025-05-05"
* clinicalStatus = #active
* subject.reference = "Patient/tbpass-patient-bernard"


Instance: tbpass-treatment-regimen
InstanceOf: TBPassRegimenMedicationStatement
Title: "TB Treatment Regimen"
Description: "First-line TB treatment for Bernard Wadie"
* subject.reference = "Patient/tbpass-patient-bernard"
* status = #ended
* effectivePeriod.start = "2025-05-08"
* effectivePeriod.end = "2025-05-10"
* category.coding.system = "http://fhir.nhis.gov.gh/CodeSystem/RegimenType"
* category.coding.code = #first-line
* medicationCodeableConcept.text = "RHZ 75/50/150 - E 100mg-Child-4 - 7 Kg"
* category.coding.display = "First-line treatment"
* note.text = "Patient has been adherent to treatment regimen. Side effects include mild nausea and insomnia, which are being managed. Next scheduled follow-up at Korle-Bu TB Clinic on April 15, 2025."



Instance: tbpass-vitals
InstanceOf: TBPassVitalSigns
Title: "Vital Signs for TB Pass"
Description: "Vital signs at start of treatment"
* subject.reference = "Patient/tbpass-patient-bernard"
* code.text = "Height and Weight"
* status = #final
* component[0].code.text = "Height"
* component[0].valueQuantity.value = 160
* component[0].valueQuantity.unit = "cm"
* component[1].code.text = "Weight"
* component[1].valueQuantity.value = 80
* component[1].valueQuantity.unit = "kg"
* effectiveDateTime = "2025-05-08"


Instance: tbpass-treatment-outcome
InstanceOf: TBPassTreatmentOutcome
Title: "Treatment Outcome for TB"
Description: "Cured outcome"
* subject.reference = "Patient/tbpass-patient-bernard"
* status = #final
* code.coding.system = "http://fhir.nhis.gov.gh/CodeSystem/TreatmentOutcome"
* code.coding.code = #cured
* effectivePeriod.end = "2025-05-08"


Instance: tbpass-specimen-ak001
InstanceOf: TBPassSpecimen
Title: "TB Specimen AK-TB-001"
Description: "Sputum specimen for lab result"
* identifier[tbpassSpecimenId].system = "http://fhir.nhis.gov.gh/Identifier/TBPassSpecimenID"
* identifier[tbpassSpecimenId].value = "AK-TB-001"
* type.coding.system = "http://fhir.nhis.gov.gh/CodeSystem/SpecimenType"
* type.coding.code = #sputum


Instance: tbpass-labresult-001
InstanceOf: TBPassLabResults
Title: "Lab Result: Smear Microscopy"
Description: "Lab result showing positive smear microscopy"
* subject.reference = "Patient/tbpass-patient-bernard"
* status = #final
* code.coding.system = "http://fhir.nhis.gov.gh/CodeSystem/TestType"
* code.coding.code = #sputum-smear
* effectiveDateTime = "2025-05-11"
* valueCodeableConcept.coding.system = "http://fhir.nhis.gov.gh/CodeSystem/TestResult"
* valueCodeableConcept.coding.code = #positive-1
* specimen.reference = "Specimen/tbpass-specimen-ak001"
* note.text = "Smear microscopy result returned positive (+)"


Instance: tbpass-composition-001
InstanceOf: TBPassComposition
Title: "TB Pass IPS Composition"
Description: "Full TB Pass composition for Bernard Wadie"
* status = #final
* type.coding.system = "http://loinc.org"
* type.coding.code = #60591-5
* type.coding.display = "Tuberculosis Progress Note"
* subject.reference = "Patient/tbpass-patient-bernard"
* date = "2025-05-11"
* author[0].reference = "Practitioner/example"
* title = "TB Case Summary for Bernard Wadie"


* section[sectionProblems]
  * title = "Problems"
  * entry[problem][tb] = Reference(tbpass-problem-tb)
  * text.div = "<div>Confirmed TB case for Bernard Wadie</div>"
  * text.status = #generated

* section[sectionMedications]
  * title = "Medications"
  * entry[medicationStatement] = Reference(tbpass-treatment-regimen)
  * text.div = "<div>First-line TB treatment regimen for Bernard Wadie</div>"
  * text.status = #generated

* section[sectionVitalSigns]
  * title = "Vital Signs"
  * entry[vitalSign] = Reference(Observation/tbpass-vitals)
  * text.div = "<div>Vital signs at start of treatment</div>"
  * text.status = #generated

* section[sectionResults]
  * title = "Lab Results"
  * entry[treatmentOutcome] = Reference(tbpass-treatment-outcome)
  * text.div = "<div>Treatment outcome for TB</div>"
  * text.status = #generated

* section[sectionResults]
  * title = "Lab Results"
  * entry[labResults] = Reference(tbpass-labresult-001)
  * text.div = "<div>Lab result showing positive smear microscopy</div>"
  * text.status = #generated



* section[sectionAllergies]
  * entry[0].extension[absent-reason].valueCode = #unknown
  * title = "No allergies"
  * text.div = "<div>No known allergies</div>"
  * text.status = #generated


