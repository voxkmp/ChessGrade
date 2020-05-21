Class {
	#name : #ChessGradeApplication,
	#superclass : #SpApplication,
	#instVars : [
		'chessGradeConverter'
	],
	#category : #'KMP-ChessGradeConversion-Ui'
}

{ #category : #'instance creation' }
ChessGradeApplication class >> open [ 
self new run.
]

{ #category : #initialization }
ChessGradeApplication >> initializeChessGradeConverter [
	chessGradeConverter := ChessGradeConverter new.
	chessGradeConverter application: self.
]

{ #category : #running }
ChessGradeApplication >> run [
	self initializeChessGradeConverter.
	self
		open: chessGradeConverter
		withSpecLayout: chessGradeConverter defaultSpec
		using: ChessGradeWorldPresenter 
]
