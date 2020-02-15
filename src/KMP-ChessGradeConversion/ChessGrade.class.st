"
I represent a chess grade. I can return the grade as ECF - English Chess Federation - or as an ELO grade used by FIDE
"
Class {
	#name : #ChessGrade,
	#superclass : #Object,
	#instVars : [
		'grade'
	],
	#category : #'KMP-ChessGradeConversion'
}

{ #category : #access }
ChessGrade >> asEcf [
	"Convert my stores ELO grade into ECF"
	^grade - 700 / 7.5.
]

{ #category : #access }
ChessGrade >> asElo [
	"I store the grade as ELo so no conversion is necessary"
	^grade.
]

{ #category : #access }
ChessGrade >> ecf: aGrading [
	"Pass me an integer as an ECF grade and I wil store it as ELO"
	grade := aGrading * 7.5 + 700.
]

{ #category : #access }
ChessGrade >> elo: aGrading [
	"Pass me an integer as an ELO grade and I will store it as my master representation of the grade"
	grade := aGrading.

]

{ #category : #initialization }
ChessGrade >> initialize [
	super initialize.
	grade := 1000.
]
