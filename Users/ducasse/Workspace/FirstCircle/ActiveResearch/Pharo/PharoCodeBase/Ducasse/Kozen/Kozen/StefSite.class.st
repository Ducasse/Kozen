Class {
	#name : #StefSite,
	#superclass : #ARSite,
	#instVars : [
		'bibBuilder'
	],
	#classVars : [
		'CachedSiteSeer'
	],
	#classInstVars : [
		'site',
		'menu',
		'page',
		'main'
	],
	#category : #Kozen
}

{ #category : #'as yet unclassified' }
StefSite class >> initialize [

	CachedSiteSeer := true.
]

{ #category : #elements }
StefSite >> addLanguageNavigation [

	| list |
	list := ARList new. 
	self languageSubTopics do: [:each |
		list addElement: (ARItem new name: each second; link: each first, '.html')
		].
	^ list
]

{ #category : #elements }
StefSite >> addSoftwareEvolutionNavigation [

	| list |
	list := ARList new. 
	self evolutionSubTopics do: [:each |
		list addElement: (ARItem new name: each second; link: each first, '.html')
		].
	^ list
]

{ #category : #texts }
StefSite >> awardText [

	^ '	<div class="itemizedlist"> 
      <ul type="disc">
	<li>Distinguished Visiting Fellowship Award of the Royal Academy of Engineering (2011).</li>
	<li>Veronica Uquillas Gomez won the Benevol most promising young research Award (2011).</li>
	<li>Mariano Martinez-Peck and Martin Diaz won for Fuel the 2011 ESUG Technology Award. </li>
	<li> <a href="http://books.seaside.st/">Dynamic web development with Seaside</a>: Our new free open-source Seaside book won the ESUG member 2010 best book Award.</li>
	  <li> Michele Lanza (2003) and Alexandre Bergel (2006) PhD theses won the <a href="http://www.denert-stiftung.de/">Ernest Denert foundation for Software Engineering</a> Award.</li>
	  
	  <li> <a href="http://rmod.lille.inria.fr/botsinc/pier">Learning Programming with Robots</a> received the Award of PCPlus magazine of September 2005 and the Bitwise Recommended Award in February 2006.
	  </ul>'

]

{ #category : #accessing }
StefSite >> bibBuilder [

	^ bibBuilder
]

{ #category : #accessing }
StefSite >> bibBuilder: aBuilder [

	bibBuilder := aBuilder
]

{ #category : #elements }
StefSite >> block [ 

	| block |
	block := ARRightBlock new.
	block addElement: (ARImage new image: 'StefFingerOnNose128.jpg'; yourself).
	block addElement: (ARBlockItem new name: 'INRIA'; link: 'http://www.inria.fr/'; yourself).
	block addElement: (ARBlockItem new name: 'RMOD'; link: 'http://rmod.lille.inria.fr/'; yourself).
	block addElement: (ARBlockItem new name: 'Stephane-Ducasse(@)INRIA.FR'; link: 'mailto:stephane.ducasse@inria.fr'; yourself).
	self declare: block withId: #block.
	^ block
	
]

{ #category : #texts }
StefSite >> citeseerText [
	
	|cite |
	cite := CachedSiteSeer 
				ifTrue: [self defaultSiteSeer]
				ifFalse: [(Citeseer rankOf: 'S. Ducasse')].
	^ 'According to <a href="http://citeseerx.ist.psu.edu/stats/authors">CiteSeer</a>, I''m at rank ', cite asString, ' of most cited computer scientists.'.  
]

{ #category : #utils }
StefSite >> createResearchSubTopicPages [

	self evolutionSubTopics
		do: [ :each | 
			self
				createSubTopic: each first
				title: each second
				text: each third
				bibTag: each fourth.
			each first ].
		
	self languageSubTopics
		do: [ :each | 
			self
				createSubTopic: each first
				title: each second
				text: each third
				bibTag: each fourth.
			each first ]
]

{ #category : #utils }
StefSite >> createSubTopic: file title: name text: text bibTag: bibTag [
	| page |
	page := ARPage new.
	page name: 'Research Topics'.
	page filename: file.
	self declarePage: page withId: (self subtopicKey: file).
	page addElement: self menu.
	page
		addElementInMain:
			(ARSection new
				title: name;
				levelDigitString: '3';
				text: text;
				yourself).
	page addElementInMain: (bibBuilder collectionBasedOnKozenTag: bibTag).
	^ page
]

{ #category : #texts }
StefSite >> currentJobText [

	^ 'Since June 2011, I''m scientific officer of  <a HREF="http://www.inria.fr/centre-de-recherche-inria/lille-nord-europe">INRIA Lille Nord Europe research center</a>. Since September 2007, I''m research director at <a HREF="http://www.inria.fr">INRIA Lille</a> leading the <a href="http://rmod.lille.inria.fr">RMoD Team</a>. During 10 years, I co-directed with Oscar Nierstrasz the <A HREF="http://www.iam.unibe.ch/~scg"> Software Composition Group</a>. I was the leader of the <A HREF="http://www.iam.unibe.ch/~scg/Research/Recast/index.html">RECAST Project</a>.  I''m the president of <a HREF="http://www.esug.org/">ESUG</a>. Here is a short <a HREF="2011-CV.pdf">CV</a>.' 
]

{ #category : #initialize }
StefSite >> defaultSiteSeer [

	^ 3194
]

{ #category : #texts }
StefSite >> evolutionSubTopics [
	^ #(#('Modularisation' 'Software remodularisation' 
		'We explored various techniques to support software remodularisation and restructuring at different levels of granularity and with different objectives.'
		 '*kzRemodularisation*') 
	
		#('Visualization' 'Software Visualization' 
		'We explored how program visualization can support software understanding.  We work at different level: system, class, packages, but also using different information: structure, runtime, references. Quite exciting topics.' 
		'*kzVisualization*')
		
		#('MetaModeling' 'Meta Modeling' 
		'' 
		'*kzMeta*')
		
		#('Merging' 'Supporting Merging' 
		''
		 '*kzMerging*') 
		
		#('Cycle' 'Cycle and Layer Identification' 
		'' 
		'*kzCycle*')
		
		#('IDE' 'Integrated Software Developments' 
		'We explored difference facets of IDEs: from frameworks to build them to dynamic information to use them.' 
		'*kzIDE*')
		
		#('Metric' 'Software Metrics and Quality Models' 
		'We applied and evaluate software metrics as well as quality models. We worked with PSA and AirFrance in the context of the Squale FUI project. We collaborated with Qualixo. ' 
		'*kzMetric')
		
		#('Dynamic' 'Dynamic information and feature analysis' 
		'' 
		'*kzDynamicInformation*')
		
		#('Duplication' 'Identification of Duplicated Code' 
		'' 
		'*kzDuplication*')
		
		#('Tools' 'Reengineering Tools, Interexchange, and Infrastructure' 
		'' 
		'*kzTools*')
		
		#('Checking' 'Checking ' 
		'' 
		'*kzChecking*')
		
		#('Archi' 'Architecture Extraction and Validation ' 
		'' 
		'*kzArchi*')
		
		#('Patterns' 'Evolution, Reengineering Challenges and Patterns' 
		'' 
		'*kzPattern*')
		
		#('History' 'History-based Analysis and Mining Repositories' 
		'' 
		'*kzHistory*')
		
		)
]

{ #category : #texts }
StefSite >> indexesText [

	^ 'According to google scholar my h-index is 41 and my g-index is 70 - Maximum Cites: 343.'

]

{ #category : #initialize }
StefSite >> initialize [
	super initialize.
	bibBuilder := ARBibCollectionBuilder new author: '*Ducasse*'; loadBib: 'rmod.bib'.
]

{ #category : #texts }
StefSite >> keywordsText [

	^ 'Software Engineering, Object-Oriented Programming, Language Design, Reengineering, Reverse Engineering, Program Understanding, Reflective Programming, Dynamically typed languages, Meta-Programming, MOP, Aspect-Oriented Programming, Modules, Frameworks, Design Patterns, Teaching OO, Traits, Classboxes, Scheme, Smalltalk, Java, C#.'

]

{ #category : #texts }
StefSite >> languageSubTopics [
	^ #(
	
		#('Clutter' 'Clutter collector'
			'Often objects are referenced but not used anymore. We are working on a clutter mechanism that acts as a memory manager to reduce the memory footprint of application and use secondary memory as a paging mechanism.'
			'*kzClutter*')
			
			
		#('Trait' 'Traits: Intraclass reuse' 
		'Traits are groups of methods that can be reused orthogonally to inheritance. 
		We defined Traits which allows one to structure classes orthogonally to inheritance and offer a better composition mechanism than mixins. We formalized traits  and identify the problems with their introduction in strongly-typed languages. We proposed analysis to support the identification of traits in existing applications.  We extended traits with the notion of state and visibility. 
		
		 PHP 5.4, PERL-6, Dr-Scheme OO layer, Squeak3.9 and Pharo include traits. Traits influenced Scala (http://scala.epfl.ch/) developed at EPFL. Fortress (a new language for scientific computation developed by G. Steele) is entirely based on a variant of traits (http://labs.oracle.com/projects/plrg/). Several libraries have been developed for Ruby and Javascript. 
Several research teams proposed formal type systems for traits, showing the interest of the scientific community:  S. Drossopoulos, V. Bono/F. Damiano, L. Liquori and J. Reppy/K. Fisher.'
		 '*kzTrait*') 
	
		
		#('Classbox' 'Scoping class extensions: Classboxes' 
		'' 
		'*kzClassbox*')
		
		#('Modules' 'Software Modules and Aspects' 
		'' 
		'*kzModule*')
		
		#('Web' 'Dynamic Web Development' 
		'' 
		'*kzWeb*')
		
		#('Reflection' 'Reflective Programming' 
		'' 
		'*kzReflection*')
		
		#('Varia' 'Components, Encapsulation and Others' 
		'' 
		'*kzLanguageDesign*')
		
		)
]

{ #category : #elements }
StefSite >> menu [

	| menu |
	menu := ARMenu new.
	menu addElement: (ARMenuItem new name: 'Home'; link: 'index.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Pharo'; link: 'http://www.pharo-project.org'; yourself).
	menu addElement: (ARMenuItem new name: 'Publications'; link: 'Publications.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Books'; link: 'Books.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Free Smalltalk Books'; link: 'FreeBooks.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Downloads/Resources'; link: 'Resources.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Lectures and Presentations'; link: 'Teaching.html'; yourself).
	menu addElement: (ARMenuItem new name: 'Coordinates'; link: 'Coordinates.html'; yourself).
	self declare: menu withId: #menu.
	^ menu 
	
]

{ #category : #texts }
StefSite >> newsText [

	^ '<div class="itemizedlist"> 
      <ul type="disc"> 
		<li>I was general chair of <a href="http://www.esug.org/wiki/pier/Conferences/2011"> ESUG 2011</a>. </li>
		<li>We got a new associated team named Plomo with Pleiad of University of Chile at Santiago.</li>
	  <li>We are setting up an INRIA consortium with industrial partners around <a href="http://www.pharo-project.org">Pharo</a>. Pharo 1.3 is out and 1.4 is in alpha.</li>
	  <li><a href="http://www.pharo-project.org/pharobyexample/">Pharo By Example</a> is free and out (in spanish, french, english and  japanese)!</li>
	 <li> <a href="http://www.moosetechnology.org">Moose</a>. Moose is a software analysis meta-described platform that allows one to understand and analyze object-oriented applications developed in Smalltalk, Java or C++. Moose 4.3 is out.</li>
	  </ul>
    </div>'
]

{ #category : #texts }
StefSite >> researchText [

	^ '
	My research statement is double: (1) How can we help companies to support the evolution and maintenance of their large applications and (2) how can we improve languages to better support evolution?
	
	'
]

{ #category : #elements }
StefSite >> sectionAwardsAndIndexes [

	| section | 
	section := ARSection new title: 'Awards and Indexes'; text: self indexesText , ' ', self citeseerText,  (Character cr asString), self awardText.
	self declare: section withId: #secAwards.
	^ section
]

{ #category : #elements }
StefSite >> sectionCurrentJob [

	| section | 
	section := ARSection new title: 'Current responsibilities'; text: self currentJobText.
	self declare: section withId: #secCurrentJob.
	^ section
]

{ #category : #elements }
StefSite >> sectionLanguageDesign [

	| section | 
	section := ARSection new title: 'Language Design'; levelDigitString: '3'; text: 'I''m interested in revisiting foundational bricks of object-oriented languages. Now I start to work on isolation and security in reflective object-oriented languages'. 
	self declare: section withId: #secLanguageDesign.
	^ section
]

{ #category : #elements }
StefSite >> sectionNews [

	| section | 
	section := ARSection new title: 'News'; text: self newsText. 
	self declare: section withId: #secNews.
	^ section
]

{ #category : #elements }
StefSite >> sectionResearch [

	| section | 
	section := ARSection new title: 'Research'; text: self researchText. 
	self declare: section withId: #secResearch.
	^ section
]

{ #category : #elements }
StefSite >> sectionService [

	| section | 
	section := ARSection new title: 'Program Committees'; text: self serviceText. 
	self declare: section withId: #secResearch.
	^ section
]

{ #category : #elements }
StefSite >> sectionSoftwareEvolution [

	| section | 
	section := ARSection new title: 'Maintenance and Software Evolution'; levelDigitString: '3'; text: 'I''m interested in all the aspects of software evolution and maintenance of large systems. I consulted for companies. Do not hesitate to contact me. I''m interested in your problems.' ; yourself. 
	self declare: section withId: #secMaintenance.
	^ section
]

{ #category : #texts }
StefSite >> serviceText [

	^ ' Here are some of the international conferences I have was PC member. Now we my new responsibilities I refuse more often. 
	<div class="itemizedlist"> 
      <ul type="disc">
	 <li> European Conference on Object-Oriented Programming (ECOOP 05, 07, 10) -- Core A *.</li>
	 <li>International Conference on Software Maintenance (ICSM 05, 06, 07, 08, 10, 11) -- Core A.</li>
	 <li>European Conference on Software Maintenance and Reengineering (CSMR 06, 07, 08).</li>
	 <li>International Conference on Program Comprehension (ICPC 06, 07, 08).</li>
	 <li>International Conference on the Unified Modeling Language (UML 03, 04, Models/UML 05, Models 06, 07, 09, 10) -- Core A.</li>
	 <li>International Dynamic Languages Symposium (DLS 05, 06).</li>
	 <li>International Symposium on Software Variability: a Programmers Perspective (SVPP 08).</li>
	 <li>International Conference on Extreme Programming (XP 00, 01).</li>
	<li> International Conference on Objects, Models, Components, Patterns (TOOLS 2009, 2010, 2011).</li>
	 <li>Working Conference on Reverse Engineering (WCRE 02, 05, 06, 10).</li>
	<li> International  Conference on Software Composition (SC 09).</li>
	</ul>
	</div>
'
]

{ #category : #elements }
StefSite >> site [
	"self site"
	
	self createResearchSubTopicPages.
	self welcomePage.
	
	
	^ self.
	
]

{ #category : #utils }
StefSite >> subtopicKey: file [
	^ ('research' , file) asSymbol
]

{ #category : #elements }
StefSite >> welcomePage [
	"self site"
	"in the future the complete web site here"
	
	| welcomePage |
	welcomePage := ARPage new.
	welcomePage name: 'Home'.
	welcomePage filename: 'index'.
	self declarePage: welcomePage withId: #welcomePage.

	welcomePage addElement: self menu.
	welcomePage addElementInMain: self block.
	welcomePage addElementInMain: self sectionCurrentJob.
	welcomePage addElementInMain: self sectionAwardsAndIndexes.
	welcomePage addElementInMain: self sectionNews.
	welcomePage addElementInMain: self sectionResearch.
	welcomePage addElementInMain: self sectionSoftwareEvolution.
	welcomePage addElementInMain: self addSoftwareEvolutionNavigation.
	welcomePage addElementInMain: self sectionLanguageDesign.
	welcomePage addElementInMain: self addLanguageNavigation.
	welcomePage addElementInMain: self sectionService.
	^ welcomePage
	
]
