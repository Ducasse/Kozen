Extension { #name : #PRPillarWriter }

{ #category : #'*Guten' }
PRPillarWriter >> visitCitationAnnotation: aCitation [
	"We invoke visitAnnotation: to make sure that the rest of the document is visited."

	self halt.
	super visitCitationAnnotation: aCitation
]

{ #category : #'*Guten' }
PRPillarWriter >> visitPublications: aPublication [
	| builder |
	self halt: 'visitPublication'. 
	"builder := CZPillarNewDocBuilder new
		fileNamed: (self configuration baseDirectory / (aPublication parameters at: #bibFile)) fullName;
		authorMatchingString: '*' , (aPublication parameters at: #author) , '*';
		fieldOrder:
			#(#author #title #journal #booktitle #volume #pages #publisher #year #school #impactfactor #misc #url #doi);
		setFilteringOn.
	builder generateFor: builder build document on: self defaultStream."
	super visitPublications: aPublication

]
