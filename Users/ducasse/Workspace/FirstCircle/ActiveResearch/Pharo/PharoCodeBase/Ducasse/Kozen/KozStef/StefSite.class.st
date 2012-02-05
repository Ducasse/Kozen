"
StefSite generate
"
Class {
	#name : #StefSite,
	#superclass : #KzMenuInfoBodySite,
	#classVars : [
		'CachedSiteSeer'
	],
	#classInstVars : [
		'site',
		'menu',
		'page',
		'main'
	],
	#category : #KozStef
}

{ #category : #help }
StefSite class >> bibEntriesWithoutKzAnnotation [
	"self bibEntriesWithoutKzAnnotation"
	
	| bibset |
	bibset := CZFileLoader  bibFromFileNamed: 'rmod.bib'.
	bibset := bibset select: (CZFieldQuery named: #author checks: [:each | ('*Ducasse*') match: each]).
	^ bibset reject: [:each | '*kz*' match: (each at: #keywords) value ].
]

{ #category : #help }
StefSite class >> help [
	"self help"
	
	| bibset |
	bibset := CZFileLoader  bibFromFileNamed: 'rmod.bib'.
	^ bibset select: [:each | '*kz*' match: (each at: #keywords) value ].
]

{ #category : #initialization }
StefSite class >> initialize [

	CachedSiteSeer := true.
]

{ #category : #elements }
StefSite >> addEditorialNavigation [

	| list |
	list := KZList new. 
	self editorialSubTopics do: [:each |
		list addElement: (KZItem new name: each second; link: each first, '.html')
		].
	^ list
]

{ #category : #elements }
StefSite >> addLanguageNavigation [

	| list |
	list := KZList new. 
	self languageSubTopics do: [:each |
		list addElement: (KZItem new name: each second; link: each first, '.html')
		].
	^ list
]

{ #category : #elements }
StefSite >> addSoftwareEvolutionNavigation [

	| list |
	list := KZList new. 
	self evolutionSubTopics do: [:each |
		list addElement: (KZItem new name: each second; link: each first, '.html')
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

{ #category : #menu }
StefSite >> booksMenuItem [
	^ KZMenuItem new
		name: 'Books';
		link: 'Books.html';
		yourself
]

{ #category : #menu }
StefSite >> buildMenuBodyOn: menu [
	menu addElement: self homeMenuItem.
	menu addElement: self pharoMenuItem.
	menu addElement: self publicationMenuItem.
	menu addElement: self booksMenuItem.
	menu addElement: self freeSmalltalkBooksMenuItem.
	menu addElement: self resourcesMenuItem.
	menu addElement: self teachingMenuItem.
	menu addElement: self coordinatesMenuItem
]

{ #category : #elements }
StefSite >> buildWelcomePageSectionsOn: welcomePage [
	welcomePage addElementInMain: self sectionCurrentJob.
	welcomePage addElementInMain: self sectionAwardsAndIndexes.
	welcomePage addElementInMain: self sectionNews.
	welcomePage addElementInMain: self sectionResearch.
	welcomePage addElementInMain: self sectionSoftwareEvolution.
	welcomePage addElementInMain: self addSoftwareEvolutionNavigation.
	welcomePage addElementInMain: self sectionLanguageDesign.
	welcomePage addElementInMain: self addLanguageNavigation.
	welcomePage addElementInMain: self sectionEditorial.
	welcomePage addElementInMain: self addEditorialNavigation.
	welcomePage addElementInMain: self sectionService
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

	self evolutionSubTopics, self languageSubTopics, self editorialSubTopics
		do: [ :each | 
			self
				createSubTopic: each first
				title: each second
				text: each third
				bibTag: each fourth.
			each first ].
		
]

{ #category : #utils }
StefSite >> createSubTopic: file title: name text: text bibTag: bibTag [
	| page |
	page := KZPage name: 'Research Topics' filename: file.
	self declarePage: page withId: (self subtopicKey: file).
	page addElement: self menu.
	page
		addElementInMain:
			(KZSection new
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

{ #category : #texts }
StefSite >> currentSectionTitle [
	^ 'Current responsibilities'
]

{ #category : #initialize }
StefSite >> defaultSiteSeer [

	^ 3194
]

{ #category : #texts }
StefSite >> editorialSubTopics [
	^ #(
		
		#('Editor' 'Proceedings Editor ' 
		'Here are some of the proceedings of workshops and other activities I got over the year.' 
		'*kzEditor*')
		
		#('Teaching' 'Teaching and Educative Support' 
		'I''m interested in how to teach computer sciences. I supervized Hilaire Fernandes on how computer sciences can support math teaching.' 
		'*kzTeaching*')
		
		#('Vulgarisation' 'Computer Science Vulgarisation' 
		'I wrote several articles around programming language topics for mass journals.' 
		'*kzVulgarisation*')
		)
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
		'As a reflective programmer, I''m also expert in meta modelling.' 
		'*kzMeta*')
		
		#('Merging' 'Supporting Merging' 
		'During development, supporting merge activities is often ignored. I work with Veronica Uquillas-Gomez on merge support.'
		 '*kzMerging*') 
		
		#('Cycle' 'Cycle and Layer Identification' 
		'We explored how to help software engineers to take decisions related to cycles in large software systems.' 
		'*kzCycle*')
		
		#('IDE' 'Integrated Software Developments' 
		'We explored difference facets of IDEs: from frameworks to build them to dynamic information to use them.' 
		'*kzIDE*')
		
		#('Metric' 'Software Metrics and Quality Models' 
		'We applied and evaluate software metrics as well as quality models. We worked with PSA and AirFrance in the context of the Squale FUI project. We collaborated with Qualixo. ' 
		'*kzMetric')
		
		#('Dynamic' 'Dynamic information and feature analysis' 
		'We used runtime information to understand or verify runtime system aspects. We also used it to characterize features.' 
		'*kzDynamicInformation*')
		
		#('Duplication' 'Identification of Duplicated Code' 
		'' 
		'*kzDuplication*')
		
		#('Tools' 'Reengineering Tools, Interexchange, and Infrastructure' 
		'' 
		'*kzTools*')
		
		#('Checking' 'Rules Checking' 
		'I''m really interested in using rules checking for building more robust software.' 
		'*kzChecking*')
		
		#('Archi' 'Architecture Extraction and Validation ' 
		'' 
		'*kzArchi*')
		
		#('Patterns' 'Evolution, Reengineering Challenges and Patterns' 
		'' 
		'*kzPattern*')
		
		#('History' 'History-based Analyses and Mining Repositories' 
		'' 
		'*kzHistory*')
		
		)
]

{ #category : #menu }
StefSite >> freeSmalltalkBooksMenuItem [
	^ KZMenuItem new
		name: 'Free Smalltalk Books';
		link: 'FreeBooks.html';
		yourself
]

{ #category : #who }
StefSite >> headerSiteTitle [
	"the title inside the page"
	
	^ 'St&eacute;phane Ducasse'
]

{ #category : #block }
StefSite >> imageName [
	^ 'StefFingerOnNose128.jpg'
]

{ #category : #texts }
StefSite >> indexesText [

	^ 'According to google scholar my h-index is 41 and my g-index is 70 - Maximum Cites: 343.'

]

{ #category : #initialize }
StefSite >> initialize [
	super initialize.
	bibBuilder := KZBibCollectionBuilder new author: '*Ducasse*'; loadBib: 'rmod.bib'.
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
		'Some languages such as Objective-C, Ruby, Python, Smalltalk can define methods in package while their classes is defined in other packages. This allows one to build powerful layers and extend classes. But this poses the questions of the semantics of such constructs. Classboxes is an experimental solution that scope them dynamically and propose a flat view of the world from the extending package perspective.' 
		'*kzClassbox*')
		
		#('Modules' 'Software Modules and Aspects' 
		'We worked on classboxes and this led us to think deeply about how names are looked up. We also work on aspects and other modular concerns. I spent a lot of time thinking about a good module system for dynamic languages and I will work on it.' 
		'*kzModule*')
		
		#('Web' 'Dynamic Web Development' 
		'I helped people to publish their results on web programming. I do not consider these publications as my work but just a way to help other works to be documented and presented scientifically.' 
		'*kzWeb*')
		
		#('Reflection' 'Reflective Programming and Code Manipulation' 
		'' 
		'*kzReflection*')
		
		#('Varia' 'Components, Encapsulation and Language Infrastructure Related Topics' 
		'This section lists the works related to several aspects of object-oriented systems: proxies, serialization, encapsulation.' 
		'*kzLanguageDesign*')
		
		#('Dependencies' 'Object Dependencies' 
		'This work (done during my PhD) was looking at how to introduce kind of connector between objects by having first dependencies.' 
		'*kzDependency*')
		
		#('Editor' 'Proceedings Editor ' 
		'Here are some of the proceedings of workshops and other activities I got over the year.' 
		'*kzEditor*')
		
		#('Teaching' 'Teaching and Educative Support' 
		'I''m interested in how to teach computer sciences. I supervized Hilaire Fernandes on how computer sciences can support math teaching.' 
		'*kzTeaching*')
		
		#('Vulgarisation' 'Computer Science Vulgarisation' 
		'I wrote several articles around programming language topics for mass journals.' 
		'*kzVulgarisation*')
		)
]

{ #category : #mail }
StefSite >> mailText [
	^ 'StephaneDucasse(@At@)inria.fr'
]

{ #category : #mail }
StefSite >> mailtoString [
	^ 'mailto:stephane.ducasse@inria.fr'
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

{ #category : #menu }
StefSite >> publicationMenuItem [
	^ KZMenuItem new
		name: 'Publications';
		link: 'Publications.html';
		yourself
]

{ #category : #texts }
StefSite >> researchText [

	^ '
	My research statement is double: (1) How can we help companies to support the evolution and maintenance of their large applications and (2) how can we improve languages to better support evolution?
	
	'
]

{ #category : #menu }
StefSite >> resourcesMenuItem [
	^ KZMenuItem new
		name: 'Downloads/Resources';
		link: 'Resources.html';
		yourself
]

{ #category : #elements }
StefSite >> sectionAwardsAndIndexes [

	| section | 
	section := KZSection new title: 'Awards and Indexes'; text: self indexesText , ' ', self citeseerText,  (Character cr asString), self awardText.
	self declare: section withId: #secAwards.
	^ section
]

{ #category : #elements }
StefSite >> sectionEditorial [

	| section | 
	section := KZSection new title: 'Editorial, teaching and vulgarisation'; levelDigitString: '3'; text: ''. 
	self declare: section withId: #secEditorial.
	^ section
]

{ #category : #elements }
StefSite >> sectionLanguageDesign [

	| section | 
	section := KZSection new title: 'Language Design'; levelDigitString: '3'; text: 'I''m interested in revisiting foundational bricks of object-oriented languages such as encapsulation, reuse, message passing. Now I start to work on isolation and security in reflective object-oriented languages.'. 
	self declare: section withId: #secLanguageDesign.
	^ section
]

{ #category : #elements }
StefSite >> sectionResearch [

	| section | 
	section := KZSection new title: 'Research'; text: self researchText. 
	self declare: section withId: #secResearch.
	^ section
]

{ #category : #elements }
StefSite >> sectionService [

	| section | 
	section := KZSection new title: 'Program Committees'; text: self serviceText. 
	self declare: section withId: #secResearch.
	^ section
]

{ #category : #elements }
StefSite >> sectionSoftwareEvolution [

	| section | 
	section := KZSection new title: 'Maintenance and Software Evolution'; levelDigitString: '3'; text: 'I''m interested in all the aspects of software evolution and maintenance of large systems. I consulted for companies. Do not hesitate to contact me. I''m interested in your problems.' ; yourself. 
	self declare: section withId: #secMaintenance.
	^ section
]

{ #category : #texts }
StefSite >> serviceText [

	^ ' Here are some of the international conferences I was PC member. Now with my new responsibilities I decline more often committees participation. 
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

{ #category : #utils }
StefSite >> subtopicKey: file [
	^ ('research' , file) asSymbol
]

{ #category : #menu }
StefSite >> teachingMenuItem [
	^ KZMenuItem new
		name: 'Lectures and Presentations';
		link: 'Teaching.html';
		yourself
]

{ #category : #who }
StefSite >> title [ 

	^ 'Dr. St&eacute;phane Ducasse' 
]