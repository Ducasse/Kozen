"
A simple pillar component to add list of publication into pillar.


./pillar export --to=pillar Example.pillar

	
"
Class {
	#name : #GutPillarPublications,
	#superclass : #PRAbstractAnnotation,
	#category : #Guten
}

{ #category : #protected }
GutPillarPublications class >> accept: aVisitor [
	
	| builder document |
	builder := CZPillarNewDocBuilder new
		"perform: language asSymbol;" 
		fileNamed: (self outputDirectory / (self parameters at: #bibFile)) fullName;
		authorMatchingString: '*', (self parameters at: #author) ,'*';
		setFilteringOn;
		yourself.
	document := builder build document.
	builder generateFor: document on: aVisitor stream.
	
	
]

{ #category : #protected }
GutPillarPublications class >> acceptold: aVisitor [
	
	| string |
	string := String streamContents: [ :stream |
		ETPublicationsPlugin new
			bibFile: (self parameters at: #bibFile);
			author: (self parameters at: #author);
			language: (self parameters at: #language);
			site: (aVisitor configuration propertyAt: 'site');
			exportInto: stream.
	].
	aVisitor replace: (PRPillarParserMain parse: string) children.
]

{ #category : #protected }
GutPillarPublications class >> acceptoldFromEctastic: aVisitor [
	| string |
	string := String
		streamContents: [ :stream | 
			ETPublicationsPlugin new
				bibFile: (self parameters at: #bibFile);
				author: (self parameters at: #author);
				language: (self parameters at: #language);
				site: (aVisitor configuration propertyAt: 'site');
				exportInto: stream ].
	aVisitor replace: (PRPillarParserMain parse: string) children
]

{ #category : #protected }
GutPillarPublications class >> tag [
	^ #publications
]

{ #category : #protected }
GutPillarPublications >> accept: aVisitor [
	aVisitor visitPublications: self
]

{ #category : #descriptions }
GutPillarPublications >> descriptionAuthor [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #author;
		priority: 100;
		label: 'Matching author for publication selection';
		required: true;
		yourself
]

{ #category : #descriptions }
GutPillarPublications >> descriptionBibFile [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #bibFile;
		priority: 100;
		label: 'File containing the bib entries';
		required: true;
		yourself
]

{ #category : #descriptions }
GutPillarPublications >> descriptionFoo [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #foo;
		priority: 100;
		label: 'Matching author for publication selection';
		required: true;
		yourself
]
