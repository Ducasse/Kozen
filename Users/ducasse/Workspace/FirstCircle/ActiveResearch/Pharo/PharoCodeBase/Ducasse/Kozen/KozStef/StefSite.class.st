"
StefSite new 
	bibSetFromFile: 'rmod.bib';
	generate
	
RegexBasePatcher new
	inDirectory: FileSystem workingDirectory;  
	expandAllExpandableFiles.
	
	
	
Right now the bibfile is not automatically generated (probably because it is in a footer of the xhtml page and as such not a visitable element that would be special and kick in the bib generation)


cpAllSHTML -> copy tokozenFolder
cpAllHTML 
cd public_html
	freeweb pour faire un sync

"
Class {
	#name : #StefSite,
	#superclass : #SmartPublicationSite,
	#instVars : [
		'subtopicFilePrefix'
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
	#category : #KozStef
}

{ #category : #help }
StefSite class >> bibEntriesWithoutKzAnnotation [
	"self bibEntriesWithoutKzAnnotation"

	"Berg13b"
	
	| bibset |
	bibset := CZFileLoader  bibFromFileNamed: 'rmod.bib'.
	bibset := bibset select: (CZFieldQuery named: #author checks: [:each | ('*Ducasse*') match: each]).
	^ (bibset reject: [:each | '*kz*' match: (each at: #keywords) value ])
	

	
]

{ #category : #initialize }
StefSite class >> defaultCSS [

 	^ 'body{
	COLOR: #000000; 
	BACKGROUND: #FFFFFF;                                    
	
	font: 10pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;

	PADDING-LEFT: 0px;
	PADDING-RIGHT: 0px;
	PADDING-TOP: 0px;
	PADDING-BOTTOM: 0px;
}


/* HEADER */

#header {
}

#headerSiteTitle {
	font-size: 12pt;
	font-weight: 500;
	letter-spacing: 1px;
	border-bottom: 1px solid #CCCCCC;
	width: 128px;
}


#headerSiteTitle {
	font-size: 12pt;
	font-weight: 500;
	letter-spacing: 1px;
	border-bottom: 1px solid #CCCCCC;
	width: 250px;
}

#headerPageTitle {
	font-size: 10pt;
	font-weight: 500;
	color: #777777;
	letter-spacing: 7px;
	margin-left: 8px;
	padding-left: 48px;
	border-left: 1px solid #CCCCCC
}

/* HEADER - end*/

/* MENU */


#menu {
	float: left;

	margin-left: 8px;
	margin-right: 32px;
	margin-bottom: 16px;
	width: 142px;
}


#toc {
	font-size: 8pt;
	padding-top: 16px;
	border-left: 1px solid #CCCCCC;
}


#tocItem {
	padding: 8px;
	border-bottom: 1px #CCCCCC solid;
}

#copyright {
	font: 7pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
	color: #777777;
	margin-top: 8px;
	margin-bottom: 8px;
}

/*MENU - end*/

/*MAIN*/

td{
	font: 8pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
}


#mainContent {
	position: absolute;
	left: 160px;
	margin: 8px;
	margin-top: 0px;
	padding-top: 16px;
	
	font: 9pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
	
}

#personalDetails {
	font: 7pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
	float: right;
	width: 128px;
	margin-left: 16px;
	margin-bottom: 16px;
}

#personalDetailsItem{
	margin-left: 8px;
	border-left: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
	padding: 8px;
}

/*MAIN - end*/

/*COMMON*/

#commonList {
}

#commonItem {
	padding-top: 8px;
	padding-bottom: 8px;
}

#commonItemDate {
	font-size: 7pt;
}

#commonItemDate:before {
	content: " ("
}

#commonItemDate:after {
	content: ") "
}

#commonItemTitle {
}

#commonItemDescription {
}

#commonItemDescription:before {
	content: "-"
}

#commonItemDetail {
	font-size: 7pt;
	margin-left: 16px;
}

/*COMMON - end*/


/*PUBLICATIONS*/

.paperList, .projectList, .contactData {
	padding-bottom:32px;
}

.paperListTitle, .projectListTitle, .contactTitle {
	letter-spacing: 2px;
	border-bottom: 1px solid #CCCCCC;
	margin-bottom: 16px;
}

.paper, .project, .supervisedThesis, .presentation {
	padding-bottom: 16px;
}

.paperAbstract, .paperBibEntry, .thesisSupervisor, .thesisAbstract {
	font-size: 7pt;
	margin-left: 16px;
	margin-top: 4px;
}

.paperRef, .thesisRef {
	margin-left: 16px;
	margin-top: 4px;
}

.paperDate, .thesisDate, .projectDate, .presentationDate {
	font-size: 7pt;
}

.paperDate:before, .thesisDate:before, .projectDate:before, .presentationDate:before {
	content: " ("
}

.paperDate:after, .thesisDate:after, .projectDate:after, .presentationDate:after {
	content: ") "
}


.paperDescription:before, .thesisDescription:before, .projectDescription:before, .presentationLocation:before {
	content: "- "
}

.paperAuthor:after, .thesisAuthor:after {
	content: " - "
}

.paperTitle, .thesisTitle {	
	color: #992222;
}

.paperTitle:after, .paperTitle:before, .thesisTitle:after, .thesisTitle:before {
	content: "''"
}

.emphasize {
	font-weight: bold;
}

.lineHeader {
	font-weight: bold;
}

/*PUBLICATIONS - end*/




/*DOCBOOK*/

#docbook {
/*	font: 9pt Times New Roman, Verdana, Tahoma, Arial, Helvetica, sans-serif;*/
}

.revhistory {
	display: none;
}

h2 {
	font-size: 12pt;
	font-weight: 200;
	letter-spacing: 2px;
}

h3 {
	font-size: 10pt;
	font-weight: 200;
	letter-spacing: 2px;
}

hr {
	display: none;
}

/*DOCBOOK - end*/


/* LINKS */

A:link {
	COLOR: #000099;
	TEXT-DECORATION: none;
}

A:visited {
	COLOR: #000099;
	TEXT-DECORATION: none;
}

A:hover {
	COLOR: #883333;
	TEXT-DECORATION: none;
}

A:active {
	COLOR: blue;
	TEXT-DECORATION: none;
}
'
]

{ #category : #help }
StefSite class >> help [
	"self help"
	
	| bibset |
	bibset := CZFileLoader  bibFromFileNamed: 'rmod.bib'.
	^ bibset select: [:each | '*kz*' match: (each at: #keywords) value ].
]

{ #category : #initialize }
StefSite class >> initialize [

	CachedSiteSeer := true.
]

{ #category : #elements }
StefSite >> addEditorialNavigation [
	| list |
	list := KZList new.
	self editorialSubTopics do: [ :each | list addElement: (self subTopicItemNamed: each) ].
	^ list
]

{ #category : #elements }
StefSite >> addLanguageNavigation [

	| list |
	list := KZList new. 
	self languageSubTopics do: [:each |
		list addElement: (self subTopicItemNamed: each)
		].
	^ list
]

{ #category : #elements }
StefSite >> addSoftwareEvolutionNavigation [

	| list |
	list := KZList new. 
	self evolutionSubTopics do: [:each |
		list addElement: (self subTopicItemNamed: each)
		].
	^ list
]

{ #category : #texts }
StefSite >> awardText [

	^ '	<div class="itemizedlist"> 
      <ul type="disc">
      <li>Since December 2012, I was promoted first class Directeur de Recherche. </li>
	<li>I received a "Prime d''excellence scientifique" from INRIA (2012).</li>
	<li>I got distinguished Visiting Fellowship Award of the Royal Academy of Engineering (2011).</li>
	<li>Veronica Uquillas Gomez won the Benevol most promising young research Award (2011).</li>
	</ul>'

]

{ #category : #elements }
StefSite >> bibSetFromFile: aFileName [

	super bibSetFromFile: aFileName.
	bibBuilder originalBibSet: bibSet.
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
	^ 'According to <a href="http://citeseerx.ist.psu.edu/stats/authors">CiteSeer</a>, I''m at rank ', cite asString, ' of most cited computer scientists. I do not think that this is of important but people like numbers. All these numbers are just numbers, I try to publish the best results and ideas I have with my co-workers.'.  
]

{ #category : #utils }
StefSite >> createSubTopic: file title: name text: text bibTag: bibTag [
	| page |
	page := KZPage name: 'Research Topics' filename: (subtopicFilePrefix, file).
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

	^ 'Since September 2007, I''m research director at <a HREF="http://www.inria.fr">INRIA Lille</a> leading the <a href="http://rmod.lille.inria.fr">RMoD Team</a>. During 10 years, I co-directed with Oscar Nierstrasz the <A HREF="http://www.iam.unibe.ch/~scg"> Software Composition Group</a>.  I''m the president of <a HREF="http://www.esug.org/">ESUG</a>. I co-founded <a HREF="http://www.synectique.eu/">Synectique</a>, a company that offers specific tools for Software analysis.  I''m one of the leader of <a HREF=''http://www.pharo.org''>Pharo</a>: a new exciting dynamic language. Here is a short <a HREF="2013-CV.pdf">CV</a>.' 
]

{ #category : #texts }
StefSite >> currentSectionTitle [
	^ 'Current responsibilities'
]

{ #category : #initialize }
StefSite >> defaultSiteSeer [

	^ 3194
]

{ #category : #topics }
StefSite >> editorialSubTopics [
	^ #(
		
		#('Editor' 'Workshop Proceedings ' 
		'Here are some of the proceedings of workshops and other activities I got over the year.' 
		'*kzEditor*') 
		
		#('Education' 'Teaching and Educative Support' 
		'I''m interested in how to teach computer sciences. I supervized Hilaire Fernandes on how computer sciences can support math teaching.' 
		'*kzTeaching*')
		
		#('Vulgarisation' 'Computer Science Vulgarisation' 
		'I wrote several articles around programming language topics for mass journals.' 
		'*kzVulgarisation*')
		)
]

{ #category : #topics }
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

	^ 'According to google scholar my h-index is 49 ', '(<a href="http://scholar.google.be/citations?user=7fHNqtoAAAAJ&hl=en"> schoolar.g</a>). I try to publish the best results I have with my co-workers and thank them for their energy.'

]

{ #category : #initialize }
StefSite >> initialize [
	super initialize.
	self subtopicPrefix: 'Topics'.
	self cssDirectoryName: 'CSS'.
	self cssFilename: 'Stef.css'.
	bibBuilder := KZBibCollectionBuilder new author: '*Ducasse*'
]

{ #category : #texts }
StefSite >> keywordsText [

	^ 'Software Engineering, Object-Oriented Programming, Language Design, Reengineering, Reverse Engineering, Program Understanding, Reflective Programming, Dynamically typed languages, Meta-Programming, MOP, Aspect-Oriented Programming, Modules, Frameworks, Design Patterns, Teaching OO, Traits, Classboxes, Scheme, Smalltalk, Java, C#.'

]

{ #category : #topics }
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
		)
]

{ #category : #mail }
StefSite >> mailText [
	^ 'stephane.ducasse(@At@)inria.fr'
]

{ #category : #mail }
StefSite >> mailtoString [
	^ 'mailto:stephane.ducasse(@At@)inria.fr'
]

{ #category : #texts }
StefSite >> newsText [

	^ '<div class="itemizedlist"> 
      <ul type="disc"> 
 <li>We  set up an INRIA consortium with industrial partners around <a href="http://consortium.pharo.org">Pharo</a>. There is an academic partnership, so if you teach Pharo or use it in your research - join.</li>
<li><a href="http://mooc.pharo.org/">Pharo Mooc got 3000 registered followers!</li>
<li><a href="http://books.pharo.org/">Entreprise Pharo: a Web Perspective</a> is out!</li>
<li><a href="http://books.pharo.org/">Deep into Pharo</a> is free and available after four years of work!</li>
<li>I''m general chair of <a href="http://www.esug.org/wiki/pier/Conferences/2016"> ESUG 2016</a>. We got too many talks :) 
<li>Guillermo Polito is now CNRS engineer! And this is hyper cool.</li>
<li>Anne Etien got her HDR!</li>
<li><a href="http://2015.splashcon.org/event/sle2015-papers-stephane-ducasse-keynote">Was keynote at SLE 2015</a></li>
</li>
</ul>
</div>'
]

{ #category : #publications }
StefSite >> publicationBuilderClass [ 

	^ StefPublicationsDocBuilder 
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
	section := KZSection new title: 'Awards and Indexes'; 
		text: self indexesText , ' ',  
			(Character cr asString), self awardText.
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

	^ 'Here are some of the international conferences I was PC member. We are starting a company and I decline more often committee participation. I declined for ICSE 2013, ECOOP 2013, ECOOP 2014, ECOOP 2015, ECOOP 2016 (but I will be the workshop chair),  PLDI 2007 and OOPSLA 2006. 
	<div class="itemizedlist"> 
      <ul type="disc">
       <li>APSEC 14</li>
	 <li>European Conference on Object-Oriented Programming (ECOOP 05, 07, 10) -- Core A *.</li>
	 <li>International Conference on Software Maintenance (ICSM 05, 06, 07, 08, 10, 11) -- Core A.</li>
	 <li>European Conference on Software Maintenance and Reengineering (CSMR 06, 07, 08).</li>
	 <li>International Conference on Program Comprehension (ICPC 06, 07, 08).</li>
	 <li>International Conference on the Unified Modeling Language (UML 03, 04, Models/UML 05, Models 06, 07, 09, 10) -- Core A.</li>
	 <li>International Dynamic Languages Symposium (DLS 05, 06).</li>
	 <li>International Symposium on Software Variability: a Programmers Perspective (SVPP 08).</li>
	 <li>International Conference on Extreme Programming (XP 00, 01).</li>
	<li> International Conference on Objects, Models, Components, Patterns (TOOLS 2009, 2010, 2011).</li>
	 <li>Working Conference on Reverse Engineering (WCRE 02, 05, 06, 10).</li>
	<li>International  Conference on Software Composition (SC 09).</li>
	<li>Onward! (ECOOP 15) -- I like the idea to push new ideas.</li>
	</ul>
	</div>
'
]

{ #category : #subtopics }
StefSite >> subTopicFile: file [
	^  subtopicFilePrefix, file

	
]

{ #category : #elements }
StefSite >> subTopicItemNamed: each [
	^ KZItem new
		name: each second;
		link: subtopicFilePrefix , each first , '.html'
]

{ #category : #initialize }
StefSite >> subtopicPrefix: aString [

	subtopicFilePrefix := aString
]

{ #category : #subtopics }
StefSite >> subtopics [

	^ self evolutionSubTopics, self languageSubTopics, self editorialSubTopics
		
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
