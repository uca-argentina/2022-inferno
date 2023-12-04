"
I represent an action or play made on a game, by a redocard
"
Class {
	#name : #RedoAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoAction >> on: aGameInstance by: aSpaceship to: affected with: aRedoCard [

	| lastCardPlayed actionRedo |
	lastCardPlayed := aGameInstance lastCardPlayed.
	actionRedo := lastCardPlayed createOwnRedoAction.
	actionRedo
		on: aGameInstance
		by: aSpaceship
		to: affected
		with: aRedoCard
]
