"
StefSite new 
	bibSetFromFile: 'rmod.bib';
	generate.
	
RegexBasePatcher new
	inDirectory: FileSystem workingDirectory;  
	expandAllExpandableFiles.
	

One of the design problem is that the fields and configuration of generation are not passed from the multiple layers.
From the site to the doc builder to the generator so it sucks. 

	
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
	font: 11pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
	PADDING-LEFT: 0px;
	PADDING-RIGHT: 0px;
	PADDING-TOP: 0px;
	PADDING-BOTTOM: 0px;
}

/* HEADER */
#header {
}

#headerSiteTitle {
	font-size: 20pt;
	font-weight: 500;
	letter-spacing: 1px;
	border-bottom: 1px solid #CCCCCC;
	width: 320px;
}

#headerPageTitle {
	font-size: 16pt;
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
	margin-right: 16px;
	margin-bottom: 16px;
	width: 180px;
}

#toc {
	font-size: 10pt;
	padding-top: 16px;
	border-left: 1px solid #CCCCCC;
	width: 180px;
}

#tocItem {
	font-size: 10pt;
	padding: 8px;
	border-bottom: 1px #CCCCCC solid;
}

#copyright {
	font: 8pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
	color: #777777;
	margin-top: 8px;
	margin-bottom: 8px;
}

/*MENU - end*/

/*MAIN*/
td{
	font: 11pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
}


#mainContent {
	position: absolute;
	left: 200px;
	margin: 8px;
	margin-top: 0px;
	padding-top: 16px;
	font: 12pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;
	
}

#personalDetails {
	font: 8pt Verdana, Tahoma, Arial, Helvetica, sans-serif, Times New Roman;

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
	font-size: 8pt;
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
	font-size: 8pt;
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
	padding-bottom: 10px;
}

.paperAbstract, .paperBibEntry, .thesisSupervisor, .thesisAbstract {
	font-size: 10pt;
	margin-left: 16px;
	margin-top: 4px;
}

.paperRef, .thesisRef {
	margin-left: 16px;
	margin-top: 4px;
}

.paperDate, .thesisDate, .projectDate, .presentationDate {
	font-size: 8pt;
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

.author, .paperAuthor:after, .thesisAuthor:after {
	content: " - "
}

.title, .paperTitle, .thesisTitle {	
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
	font-size: 14pt;
	font-weight: 500;
	letter-spacing: 2px;
}

h3 {
	font-size: 9pt;
	font-weight: 500;
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

{ #category : #texts }
StefSite >> aboutUsersText [

	^ 'Pharo 9.0 has 790 packages for 10658 classes and 143420 methods. It has around 250 forks on github <a href="https://github.com/pharo-project/pharo/">https://github.com/pharo-project/pharo/</a> and Pharo is composed out of several github projects such as pharo-vcs, pharo-graphics, or pharo-spec. Pharo has around 18 regular contributors and up to 100 occasional ones.
	
	In addition Pharo has many users (we roughly estimate around 10 000) and Pharo is taught is around 30-40 universities worldwide and used by aroudn 30 research teams. It has also an industrial <a href="https://consortium.pharo.org">consortium</a>.
	Pharo runs on 11 different platforms and multiple architectures 32/64 bits, / Intel/ARM.
	
	This raises the important question of how many citations is worth one real user (not one of our students). I do not have definitive answer on that point but it is important to understand that there is a Huge difference between a research prototype and a real system and Pharo is a real system with real customers. This requires a large development effort. We are lucky because Inria researcher evaluation takes this into account. Now this is an important question for funding agencies and any evaluation of my team.'
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
<li>In 2018 I got laureate of ERC-Generator of I-Site financed by Programmes d''Investissements d''Avenir (I was the only CS researcher awarded).</li>
      <li>Since December 2012, I was promoted first class Directeur de Recherche. </li>
	<li>I received a "Prime d''excellence scientifique" from INRIA (2016).</li>
	<li>I got distinguished Visiting Fellowship Award of the Royal Academy of Engineering (2011).</li>
	<li>Veronica Uquillas Gomez won the Benevol most promising young research Award (2011).</li>
	<li>Mariano Martinez-Peck and Martin Diaz won for Fuel the 2011 ESUG Technology Award. </li>
	<li><a href="http://books.seaside.st/">Dynamic web development with Seaside</a>: Our new free open-source Seaside book won the ESUG member 2010 best book Award.</li>
	  <li>Michele Lanza (2003) and Alexandre Bergel (2006) PhD theses won the <a href="http://www.denert-stiftung.de/">Ernest Denert foundation for Software Engineering</a> Award.</li>
	  <li>"Learning Programming with Robots" received the Award of PCPlus magazine of September 2005 and the Bitwise Recommended Award in February 2006.
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

	^ 'Since September 2007, I''m research director at <a HREF="http://www.inria.fr">INRIA Lille</a> leading the <a href="http://rmod.lille.inria.fr">RMoD Team</a>. During 10 years, I co-directed with O. Nierstrasz the <A HREF="http://www.iam.unibe.ch/~scg"> Software Composition Group</a>.  I''m the president of <a HREF="http://www.esug.org/">ESUG</a>. I co-founded Synectique a company that offered specific tools for Software analysis.  I''m one of the leader of <a HREF="http://www.pharo.org">Pharo</a>: a new exciting dynamic language. Check the <a href="http://consortium.pharo.org">Pharo consortium</a>. 
Here is a short <a HREF="CV.pdf">CV</a>. My ORCID Number is 0000-0001-6070-6599.' 
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
	^ #(
	#('Blockchain' 'Software engineering for the blockchain' 
		'We are working on tools and analyses for blockchain.'
		 '*kzBlockchain*') 

	#('Software Evolution and Migration'  'Software Evolution and Migration' 'Software evolution is a major concern about our industry. We work on many approaches to support software evolution starting from understanding to actually performing the changes.' 
		 '*kzEvolution*') 
	
	#('Modularisation' 'Software remodularisation' 
		'We explored various techniques to support software remodularisation and restructuring at different levels of granularity and with different objectives.'
		 '*kzRemodularisation*') 
	
		#('Visualization' 'Software Visualization' 
		'We explored how program visualization can support software understanding.  We work at different level: system, class, packages, but also using different information: structure, runtime, references. Quite exciting topics.' 
		'*kzVisualization*')
		
		#('MetaModeling' 'Meta Modeling' 
		'As a reflective programmer, I''m also expert in meta modelling.' 
		'*kzMeta*')
		
		#('Merging' 'Supporting Merging' 
		'During development, supporting merge activities is often ignored.'
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
		
		#('Tools' 'Reengineering Tools, Interexchange, and Infrastructure (Parsing...)' 
		'' 
		'*kzTools*')
		
		#('CheckingTesting' 'Rules Checking and Testing' 
		'I''m really interested in using rules checking for building more robust software.' 
		'*kzChecking*')
		
		#('Archi' 'Architecture Extraction and Validation ' 
		'' 
		'*kzArchi*')
		
		#('Patterns' 'Evolution, Reengineering Challenges and Patterns' 
		'' 
		'*kzPattern*')
		
		
		#('History' 'History-based Analyses and Mining Repositories' 
		'Lot of information is available in repositories. I started back in 1999 to collect and analyse data.' 
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
	^ 'StandingLug.jpg'
]

{ #category : #texts }
StefSite >> indexesText [

	^ 'Some people consider that h-index is not a good criteria for researcher evaluation. To me this is just a possible one. Trying to understand it, it looks like it shows a bit the width of your research (i.e., that several topics got reasonance within a community). Personally I do not work with this metrics in mind, I just try to publish the best results I have with my co-workers and thank them for their energy. According to google scholar my h-index is 58 ', '(<a href="http://scholar.google.be/citations?user=7fHNqtoAAAAJ&hl=en">schoolar.g</a>). '

]

{ #category : #initialize }
StefSite >> initialize [
	super initialize.
	self subtopicPrefix: 'Topics'.
	self cssDirectoryName: 'CSS'.
	self cssFilename: 'newstef.css'.
	bibBuilder := KZBibCollectionBuilder new author: '*Ducasse*'
]

{ #category : #texts }
StefSite >> keywordsText [

	^ 'Software Engineering, Object-Oriented Programming, Language Design, Reengineering, Reverse Engineering, Program Understanding, Reflective Programming, Dynamically typed languages, Meta-Programming, MOP, Aspect-Oriented Programming, Modules, Frameworks, Design Patterns, Teaching OO, Traits, Classboxes, Scheme, Smalltalk, Java, C#.'

]

{ #category : #topics }
StefSite >> languageSubTopics [
	^ #(
	
	#('LanguageDesign' 'Components, Encapsulation and Language Features and Infrastructure Related Topics' 
		'This section lists the works related to several aspects of object-oriented systems: proxies, serialization, encapsulation and more.' 
		'*kzLanguageDesign*')
	

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
		
		#('Reflection' 'Reflective Programming,Code Manipulation and Bootstrap' 
		'In recent years, I work on bootstrap and minimal kernels.' 
		'*kzReflection*')
		
		#('Virtual Machines' 'Virtual machines and other low-level concerns' 
		'We started to lean how to implement virtual machines.' 
		'*kzVM*')
		
		#('Clutter' 'Clutter collector'
			'Often objects are referenced but not used anymore. We are working on a clutter mechanism that acts as a memory manager to reduce the memory footprint of application and use secondary memory as a paging mechanism.'
			'*kzClutter*')
		
	
		
		#('Dependencies' 'Object Dependencies' 
		'This work (done during my PhD) was looking at how to introduce kind of connector between objects by having first dependencies.' 
		'*kzDependency*')
		
		#('Pharo' 'Pharo benefits from our research and the inverse' 
		'Pharo is evolveing over the years and we spent time building experiments to understand and assess how we should improve it' 
		'*kzPharo*')
		
		#('Other' 'Some other work' 
		'' 
		'*kzOther*')
		)
]

{ #category : #mail }
StefSite >> mailText [
	^ 'email'
]

{ #category : #mail }
StefSite >> mailtoString [
	^ 'mailto:stephane.ducasse@inria.fr'
]

{ #category : #texts }
StefSite >> newsText [

	^ '<div class="itemizedlist"> 
      <ul type="disc"> 
<li>I was PC Chair of <a href="http://www.icsr2020.org">International conference on Software Reuse.</a></li>
<li>New version of the Pharo Mooc is out <a href="https://www.fun-mooc.fr/courses/course-v1:inria+41024+session01/about">Immersive and Agile Programming with Pharo.</a></li>
<li>I gave a keynote at SCAM 2020 <a href="http://rmod-files.lille.inria.fr/Videos/2020-09-26-powerfull-Tools-SCAM.mp4">Powerful Tools for Live Development in Pharo.</a></li>
<li>I gave a Master Class on Pharo for Inria Academy and Inria Chile.</a></li>
<li>ICSE 2019:  Our "rotten green tests" paper has been accepted <a href="https://hal.inria.fr/hal-02002346/document"><Rotten green tests -- here>.</a></li>
<li>HCERES evaluation: "Le GT GL produit une recherche qui couvre de nombreux aspects du Genie Logiciel. Sa recherche est d''excellente qualite et est connue et reconnue nationalement et internationalement. La production scientifique, le rayonnement et l''attractivite [...] sont exceptionnels pour les equipes RMoD et Spirals."</li>
 
<li>I''m editor of a booklet collection. Check <a href="http://books.pharo.org">http://books.pharo.org</a></li>
<li>My new book: Learning OOP, design and TDD in Pharo is out <a href="http://books.pharo.org">http://books.pharo.org</a></li>
<li>New lectures on Object-Oriented Programming and Design is out. Check <a href="http://lectures.pharo.org">http://lectures.pharo.org</a>
<li>Pharo Mooc got super appreciated. Check testimonies and all the files are freely accessible at <a href="http://mooc.pharo.org">http://mooc.pharo.org</a></li>
<li>Join Pharo consortium <a href="http://consortium.pharo.org">http://consortium.pharo.org</a>! There is also an academic partnership.</li>
	  <li><a href="http://books.pharo.org/">Pharo By Example (Updated)</a> is free and out (in spanish, french, english and  japanese)! Check the Updated version for Pharo 50 (Working on the version for Pharo 90)</li>
	<li><a href="http://books.pharo.org/">Entreprise Pharo: a Web perspective</a> is available and contains many really good chapters.</li>
	<li> <a href="http://www.moosetechnology.org">Moose</a>. Moose is a data and software analysis meta-described platform. Check the newest version!</li>
	  </ul>
    </div>'
]

{ #category : #publications }
StefSite >> publicationBuilderClass [ 

	^ CZXHTMLDocBuilder 
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
		levelDigitString: '2';
		text: self indexesText , ' ',  
			(Character cr asString), self awardText.
	self declare: section withId: #secAwards.		
	section := KZSection new title: 'Reflection about Users'; 
		levelDigitString: '2';
		text: self aboutUsersText.
		

	^ section
]

{ #category : #elements }
StefSite >> sectionEditorial [

	| section | 
	section := KZSection new title: 'Editorial, teaching and vulgarisation'; levelDigitString: '2'; text: ''. 
	self declare: section withId: #secEditorial.
	^ section
]

{ #category : #elements }
StefSite >> sectionLanguageDesign [

	| section | 
	section := KZSection new title: 'Language Design'; levelDigitString: '2'; text: 'I''m interested in revisiting foundational bricks of object-oriented languages such as encapsulation, reuse, message passing. Now I start to work on isolation and security in reflective object-oriented languages.'. 
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
	section := KZSection new title: 'Program Committees'; levelDigitString: '2'; text: self serviceText. 
	self declare: section withId: #secResearch.
	^ section
]

{ #category : #elements }
StefSite >> sectionSoftwareEvolution [

	| section | 
	section := KZSection new title: 'Maintenance and Software Evolution'; levelDigitString: '2'; text: 'I''m interested in all the aspects of software evolution and maintenance of large systems. I consulted for companies. Do not hesitate to contact me. I''m interested in your problems.' ; yourself. 
	self declare: section withId: #secMaintenance.
	^ section
]

{ #category : #texts }
StefSite >> serviceText [

	^ 'Here are some of the international conferences I was PC member. I declined more often committee participation for health reason. I declined for ICSE 2013, ECOOP 2013, ECOOP 2014, ECOOP 2015 (but I was be the workshop chair),  PLDI 2007, and OOPSLA 2006.  I declined to be associate editor of SCP Journal because of the Elsevier policy regarding articles access. I also think that people should have less power and that there is a too large concentration in PCs. Some recent experiences showed that a PC would reject 60% of the papers than another would accept. Therefore we should really pay attention to our process in general and the conclusions we draw about them. 
	
	<div class="itemizedlist"> 
      <ul type="disc">
			<li>ECOOP 2022.</li>
       <li>PC chair of International conference on Software Reuse.</li>
		<li>Onward 18, Program commity of APSEC 14.</li>
		<li>European Conference on Object-Oriented Programming (ECOOP 05, 07, 10) -- Core A *.</li>
		<li>International Conference on Software Maintenance (ICSM 05, 06, 07, 08, 10, 11) -- Core A.</li>
		<li>European Conference on Software Maintenance and Reengineering (CSMR 06, 07, 08).</li>
	 <li>International Conference on Program Comprehension (ICPC 06, 07, 08).</li>
	 <li>International Conference on the Unified Modeling Language (UML 03, 04, Models/UML 05, Models 06, 07, 09, 10) -- Core A.</li>
	 <li>International Dynamic Languages Symposium (DLS 05, 06, 2020).</li>
	 <li>International Symposium on Software Variability: a Programmers Perspective (SVPP 08).</li>
	 <li>International Conference on Extreme Programming (XP 00, 01).</li>
	<li> International Conference on Objects, Models, Components, Patterns (TOOLS 2009, 2010, 2011).</li>
	 <li>Working Conference on Reverse Engineering (WCRE 02, 05, 06, 10).</li>
	<li> International Conference on Software Composition (SC 09).</li>
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
