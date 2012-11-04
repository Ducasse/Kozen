"
I'm responsible for building a web site like http://stephane.ducasse.free.fr

I will generate a set of web page (to be customized by the users) as well as a CSS. 
"
Class {
	#name : #KzMenuInfoBodySite,
	#superclass : #KZSite,
	#instVars : [
		'bibBuilder',
		'cssDirectoryName',
		'cssFilename',
		'bibSet'
	],
	#category : #Kozen
}

{ #category : #initialization }
KzMenuInfoBodySite class >> defaultCSS [

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

{ #category : #initialization }
KzMenuInfoBodySite class >> generate [
	"self generate"
	self new generate
]

{ #category : #'as yet unclassified' }
KzMenuInfoBodySite >> bibBuilder [

	^ bibBuilder
]

{ #category : #'as yet unclassified' }
KzMenuInfoBodySite >> bibBuilder: aBuilder [

	bibBuilder := aBuilder
]

{ #category : #initialize }
KzMenuInfoBodySite >> bibSetFromFile: inputFile [
	"self new createBibSetFromPath: 'rmod.bib'"
	
	bibSet  := CZFileLoader bibFromFileNamed: inputFile.
]

{ #category : #accessing }
KzMenuInfoBodySite >> block [
	| block |
	block := KZRightBlock new.
	self buildBlockBodyOn: block.
	self declare: block withId: #block.
	^ block
]

{ #category : #block }
KzMenuInfoBodySite >> buildBlockBodyOn: block [
	block addElement: self imageItem.
	block addElement: self inriaBlockItem.
	block addElement: self rmodBlockItem.
	block addElement: self mailToBlockItem
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> buildMenuBodyOn: menu [
	"Subclasses can change the menu items simply by changing this method"

	menu addElement: self homeMenuItem.
	menu addElement: self pharoMenuItem.
	menu addElement: self coordinatesMenuItem
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> buildOtherPages [

	
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> buildWelcomePageSectionsOn: welcomePage [
	welcomePage addElementInMain: self sectionCurrentJob.
	welcomePage addElementInMain: self sectionNews.	
	
]

{ #category : #elements }
KzMenuInfoBodySite >> coordinatesBody [

	| section | 
	section := KZSection new title: 'Snail Mail' ; text: self coordinatesText.
	self declare: section withId: #secCoordinates.
	^ section
]

{ #category : #elements }
KzMenuInfoBodySite >> coordinatesFileName. [
	^ 'Coordinates'
]

{ #category : #menu }
KzMenuInfoBodySite >> coordinatesMenuItem [
	^ KZMenuItem new
		name: 'Coordinates';
		link: self coordinatesFileName, '.html';
		yourself
]

{ #category : #elements }
KzMenuInfoBodySite >> coordinatesName [
	"Returns the title of the coordinates page"
	
	^ 'Coordinates'
]

{ #category : #elements }
KzMenuInfoBodySite >> coordinatesPage [
	| coordinatePage |
	coordinatePage := KZPage name: self coordinatesName filename: self coordinatesFileName.
	self declarePage: coordinatePage withId: #coordinatesPage.
	coordinatePage addElement: self menu.
	coordinatePage addElementInMain: self block.
	coordinatePage addElementInMain: self coordinatesBody.
	^ coordinatePage
]

{ #category : #elements }
KzMenuInfoBodySite >> coordinatesText [

	^ 'Pay attention my snail mail address is not where my office is. If you want to 
	visit me <A href="http://rmod.lille.inria.fr/">check that page</a>.
	
	Pay attention that you really put INRIA in the address. 
	
	<p>Address: <br>
		INRIA - S. Ducasse, 40, avenue Halley, <br>
		Parc Scientifique de la Haute Borne, <br>
		Bat.A, Park Plaza <br
		Villeneuve d''Ascq  59650 <br>
		France <br>
		Tel:33 (0)3 20 43 42 56<br>
		Fax:33 (0)3 59 57 78 50<br>
    </p>'

]

{ #category : #accessing }
KzMenuInfoBodySite >> cssDirectoryName [
	^ cssDirectoryName
]

{ #category : #accessing }
KzMenuInfoBodySite >> cssDirectoryName: aString [
	cssDirectoryName := aString
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> cssFile [
	"I hardcoded the slash since it will be deployed on unix."
	^ self cssDirectoryName, '/' , self cssFilename
]

{ #category : #accessing }
KzMenuInfoBodySite >> cssFilename [

	^ cssFilename
]

{ #category : #accessing }
KzMenuInfoBodySite >> cssFilename: aString [
	cssFilename := aString
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> currentJobText [

	^ 'I''m ZZZ and I have a lot of fun doing KKK .' 
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> currentSectionTitle [
	^ 'Current Situation'
]

{ #category : #operations }
KzMenuInfoBodySite >> declarePage: aPage withId: aSymbol [

	super declarePage: aPage withId: aSymbol.
	self defineInformationOfPage: aPage.
	
]

{ #category : #elements }
KzMenuInfoBodySite >> defineInformationOfPage: welcomePage [
	welcomePage title: self title.
	welcomePage cssFile: self cssFile.
	welcomePage headerSiteTitle: self headerSiteTitle.
	
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> generate [
	"Generate the directory for the CSS and the default CSS."
	self installCSS.
	super generate.
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> headerSiteTitle [

	^ 'Ze great title'
	
]

{ #category : #menu }
KzMenuInfoBodySite >> homeMenuItem [
	^ KZMenuItem new
		name: 'Home';
		link: 'index.html';
		yourself
]

{ #category : #block }
KzMenuInfoBodySite >> imageItem [
	^ KZImage new
		image: self imageName;
		yourself
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> imageName [
	^ 'PictureToBeDisplayedIn128Pixels.jpg'
]

{ #category : #initialize }
KzMenuInfoBodySite >> initialize [
	super initialize.
	self cssFilename: 'CSS'.
	self cssDirectoryName: 'CSS.css'.
	
]

{ #category : #block }
KzMenuInfoBodySite >> inriaBlockItem [
	^ KZBlockItem new
		name: 'INRIA';
		link: 'http://www.inria.fr/';
		yourself
]

{ #category : #initialize }
KzMenuInfoBodySite >> installCSS [

	| wk |
	wk := FileSystem disk workingDirectory.
	(wk / self cssDirectoryName) ensureDirectory.
	(wk / self cssDirectoryName / self cssFilename) writeStreamDo: 
		[:st | st nextPutAll: self class defaultCSS ]
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> mailText [
	^ 'XXXX(@At@)YYYY.HHH'
]

{ #category : #mail }
KzMenuInfoBodySite >> mailToBlockItem [
	^ KZBlockItem new
		name: self mailText;
		link: self mailtoString;
		yourself
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> mailtoString [
	^ 'mailto:real.address@foo.bar'
]

{ #category : #accessing }
KzMenuInfoBodySite >> menu [
	| menu |
	menu := KZMenu new.
	self buildMenuBodyOn: menu.
	self declare: menu withId: #menu.
	^ menu
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> newsSectionTitle [
	^ 'News'
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> newsText [

	^ '<div class="itemizedlist"> 
      <ul type="disc"> 
		<li>I attended <a href="http://www.esug.org/wiki/pier/Conferences/2011"> ESUG 2011</a>. </li>
	 	<li><a href="http://www.pharo-project.org/">Pharo</a> is cool!</li>
	
	  </ul>
    </div>'
]

{ #category : #menu }
KzMenuInfoBodySite >> pharoMenuItem [
	^ KZMenuItem new
		name: 'Pharo';
		link: 'http://www.pharo-project.org';
		yourself
]

{ #category : #publications }
KzMenuInfoBodySite >> publicationBuilderClass [
	
	^ CZSingleAuthorDocBuilder
]

{ #category : #publications }
KzMenuInfoBodySite >> publicationPage [
	| publicationPage doc |
	publicationPage := KZPage  name: 'Publications' filename: 'Publications'.
	self declarePage: publicationPage withId: #publicationPage.
	publicationPage addElement: self menu.
	publicationPage addElementInMain: self block.
	
	doc := self publicationBuilderClass new
				english;
				bibset: bibSet;
				setFilteringOn.
	"here I should add the bibfile generation and link or it should be in the document
	tree. but somewhere as a side effect I should create the bib file."
	publicationPage addElementInMain: doc build document.
	^ publicationPage
]

{ #category : #block }
KzMenuInfoBodySite >> rmodBlockItem [
	^ KZBlockItem new
		name: 'RMOD';
		link: 'http://rmod.lille.inria.fr/';
		yourself
]

{ #category : #elements }
KzMenuInfoBodySite >> sectionCurrentJob [
	| section |
	section := KZSection new
		title: self currentSectionTitle;
		text: self currentJobText.
	self declare: section withId: #secCurrentJob.
	^ section
]

{ #category : #elements }
KzMenuInfoBodySite >> sectionNews [
	| section |
	section := KZSection new
		title: self newsSectionTitle;
		text: self newsText.
	self declare: section withId: #secNews.
	^ section
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> site [
	"self site"
	
	self welcomePage.
	self coordinatesPage.
	self buildOtherPages.
	self publicationPage. 
	^ self
	
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> title [ 

	^ 'Dr. St&eacute;phane Ducasse' 
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> welcomeName [
	^ 'Home'
]

{ #category : #elements }
KzMenuInfoBodySite >> welcomePage [
	| welcomePage |
	welcomePage := KZPage  name: self welcomeName filename: 'index'.
	self declarePage: welcomePage withId: #welcomePage.
	welcomePage addElement: self menu.
	welcomePage addElementInMain: self block.
	self buildWelcomePageSectionsOn: welcomePage.
	^ welcomePage
]
