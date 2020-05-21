Class {
	#name : #ChessGradeTest,
	#superclass : #TestCase,
	#category : #'KMP-ChessGradeConversion-Tests'
}

{ #category : #tests }
ChessGradeTest >> testEcfToElo [
	| g |
	g := ChessGrade new.
	g ecf: 100.
	self assert: g asElo equals: 1450
]

{ #category : #tests }
ChessGradeTest >> testEloToEcf [
	|g|
	g:= ChessGrade new.
	g elo:1450.
	self assert: g asEcf equals: 100.
]
