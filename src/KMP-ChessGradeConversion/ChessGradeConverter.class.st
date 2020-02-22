"
I present a window where a user can enter an English Chess Grad (ecf) and see the corresponding grade as a FIDE Elo rating.

My model is a ChessGrade object. 

"
Class {
	#name : #ChessGradeConverter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'lblElo',
		'lblEcf',
		'txtElo',
		'txtEcf',
		'imgChess',
		'toolbarGradingButtons'
	],
	#category : #'KMP-ChessGradeConversion-Ui'
}

{ #category : #specs }
ChessGradeConverter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		borderWidth: 10;
		spacing: 10;
		add: #imgChess expand: false;
		add:
			(SpGridLayout new
				beColumnNotHomogeneous;
				beRowHomogeneous;
				column: 1 withConstraints: [ :c | c beExpand ];
				column: 2 withConstraints: [ :c | c beNotExpand ];
				add: #lblEcf at: 1 @ 1;
				add: #txtEcf at: 2 @ 1;
				add: #lblElo at: 1 @ 2;
				add: #txtElo at: 2 @ 2;
				add: #toolbarGradingButtons at: 1 @ 3 span: 2 @ 3;
				yourself);
		yourself
]

{ #category : #initialization }
ChessGradeConverter >> connectPresenters [
	self txtEcf
		whenTextChangedDo: [ self model ecf: self txtEcf text asInteger.
			self announcingObject valueChanged ]
]

{ #category : #'model - updating' }
ChessGradeConverter >> fillFormWithWorkingModel [
	self txtEcf text: self model asEcf asInteger printString.
	self txtElo text: self model asElo asInteger printString
]

{ #category : #accessing }
ChessGradeConverter >> imgChess [
	^ imgChess
]

{ #category : #initialization }
ChessGradeConverter >> initialize [
	self model: ChessGrade new.
	super initialize
]

{ #category : #initialization }
ChessGradeConverter >> initializePresenters [
	lblEcf := self newLabel label: 'ECf grade'.
	lblElo := self newLabel label: 'Elo grade'.
	txtEcf := self newTextInput.
	txtElo := self newTextInput.
	toolbarGradingButtons := self newToolBar
	   beText;
		addItem:
			(SpToolBarButton new
				label: '<<';
				icon: (self iconNamed: #back);
				help: 'Back 10 points';
				action: [ self inform: 'back 10 points']; 
				yourself);
		addItem:
			(SpToolBarButton new
				label: '<';
				icon: (self iconNamed: #back);
				help: 'Back one point';
				action: [ self inform: 'back one point' ];
				yourself);
				addItem:
			(SpToolBarButton new
				label: '>';
				icon: (self iconNamed: #forward);
				help: 'Forward one point';
				action: [ self inform: 'forward one point']; 
				yourself);
		addItem:
			(SpToolBarButton new
				label: '>>';
				icon: (self iconNamed: #forward);
				help: 'Forward 10 points';
				action: [ self inform: 'forward 10 points' ];
				yourself);
		yourself.
	imgChess := self newImage.
	imgChess image: (ImageReadWriter formFromFileNamed: 'chess.jpeg')
]

{ #category : #initialization }
ChessGradeConverter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Converter for Chess Grades';
		initialExtent: 420@280;
		windowIcon: self windowIcon;
		askOkToClose: false;
		aboutText: 'Small tool to convert chess grades from ELO to ECF and vice versa'
]

{ #category : #accessing }
ChessGradeConverter >> lblEcf [
	^ lblEcf
]

{ #category : #accessing }
ChessGradeConverter >> lblElo [
	^ lblElo
]

{ #category : #'model - updating' }
ChessGradeConverter >> modelChanged [
	self fillFormWithWorkingModel
]

{ #category : #accessing }
ChessGradeConverter >> toolbarGradingButtons [
	^ toolbarGradingButtons
]

{ #category : #accessing }
ChessGradeConverter >> txtEcf [
	^ txtEcf
]

{ #category : #accessing }
ChessGradeConverter >> txtEcf: anObject [
	txtEcf := anObject
]

{ #category : #accessing }
ChessGradeConverter >> txtElo [
	^ txtElo
]

{ #category : #accessing }
ChessGradeConverter >> txtElo: anObject [
	txtElo := anObject
]
