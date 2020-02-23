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
		'toolbarGradingButtons',
		'btnIncreaseSmall',
		'btnIncreaseLarge',
		'btnDecreaseSmall',
		'btnDecreaseLarge'
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
				beRowNotHomogeneous;
				rowSpacing:40;
				column: 1 withConstraints: [ :c | c beExpand ];
				column: 2 withConstraints: [ :c | c beNotExpand ];
				row:3 withConstraints: [ :constraint | constraint expand: false];
				add: #lblEcf at: 1 @ 1;
				add: #txtEcf at: 2 @ 1;
				add: #lblElo at: 1 @ 2;
				add: #txtElo at: 2 @ 2;
				add: #toolbarGradingButtons at: 1 @ 3 span: 2 @ 3;
				yourself);
		yourself
]

{ #category : #accessing }
ChessGradeConverter >> btnDecreaseLarge [
	^ btnDecreaseLarge
]

{ #category : #accessing }
ChessGradeConverter >> btnDecreaseSmall [
	^ btnDecreaseSmall
]

{ #category : #accessing }
ChessGradeConverter >> btnIncreaseLarge [
	^ btnIncreaseLarge
]

{ #category : #accessing }
ChessGradeConverter >> btnIncreaseSmall [
	^ btnIncreaseSmall
]

{ #category : #initialization }
ChessGradeConverter >> connectPresenters [
	self txtEcf
		whenTextChangedDo: [ self setGradeEcf: txtEcf text asInteger ].
	self btnDecreaseLarge action:[self decreaseGradeLarge].
	self btnDecreaseSmall action:[self decreaseGradeSmall].
	self btnIncreaseLarge action:[self increaseGradeLarge].
	self btnIncreaseSmall action:[self increaseGradeSmall].
]

{ #category : #'model - updating' }
ChessGradeConverter >> decreaseGradeLarge [
	self model ecf: self model asEcf - 10.
	self announcingObject valueChanged
]

{ #category : #'model - updating' }
ChessGradeConverter >> decreaseGradeSmall [
	self model ecf: self model asEcf - 1.
	self announcingObject valueChanged
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

{ #category : #'model - updating' }
ChessGradeConverter >> increaseGradeLarge [
	self model ecf: self model asEcf + 10.
	self announcingObject valueChanged
]

{ #category : #'model - updating' }
ChessGradeConverter >> increaseGradeSmall [
	self model ecf: self model asEcf + 1.
	self announcingObject valueChanged

]

{ #category : #initialization }
ChessGradeConverter >> initialize [
	self model: ChessGrade new.
	super initialize
]

{ #category : #initialization }
ChessGradeConverter >> initializeButtons [
	btnDecreaseLarge := SpToolBarButton new
		label: '<<';
		help: 'Down 10 points'.
	btnDecreaseSmall := SpToolBarButton new
		label: '<';
		help: 'Down one point'.
	btnIncreaseSmall := SpToolBarButton new
		label: '>';
		help: 'Up one point'.
	btnIncreaseLarge := SpToolBarButton new
		label: '>>';
		help: 'Up 10 points'
]

{ #category : #initialization }
ChessGradeConverter >> initializeImage [
	imgChess := self newImage.
	imgChess image: (ImageReadWriter formFromFileNamed: 'chess.jpeg')


]

{ #category : #initialization }
ChessGradeConverter >> initializeLabels [
	lblEcf := self newLabel label: 'ECf grade'.
	lblElo := self newLabel label: 'Elo grade'
]

{ #category : #initialization }
ChessGradeConverter >> initializePresenters [
	self initializeLabels.
	self initializeTextInputs.
	self initializeButtons.
	self initializeToolbar.
	self initializeImage.
	
]

{ #category : #initialization }
ChessGradeConverter >> initializeTextInputs [
	txtEcf := self newTextInput.
	txtElo := self newTextInput.
]

{ #category : #initialization }
ChessGradeConverter >> initializeToolbar [
	toolbarGradingButtons := self newToolBar
		beText;
		addItem: btnDecreaseLarge;
		addItem: btnDecreaseSmall;
		addItem: btnIncreaseSmall;
		addItem: btnIncreaseLarge;
		yourself.
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

{ #category : #'model - updating' }
ChessGradeConverter >> setGradeEcf: newGrade [
	self model ecf: newGrade.
	self announcingObject valueChanged
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
