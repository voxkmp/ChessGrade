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
	^grade -700 / 7.5.
]

{ #category : #access }
ChessGrade >> asElo [
^grade.
]

{ #category : #access }
ChessGrade >> ecf: aGrading [
grade := aGrading * 7.5 + 700.
]

{ #category : #access }
ChessGrade >> elo: aGrading [
grade := aGrading.

]

{ #category : #initialization }
ChessGrade >> initialize [
	super initialize.
	grade := 1000.
]
