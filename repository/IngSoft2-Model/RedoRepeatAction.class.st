"
I represent a redo action made by a redo card when the last card played was a repeat card
"
Class {
	#name : #RedoRepeatAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoRepeatAction >> on: aGameInstance by: aSpaceship to: aTargetedSpaceship with: aRedoCard [

	aGameInstance
		redoRepeatCardPlayedBy: aSpaceship
		applyTo: aTargetedSpaceship
		with: aRedoCard
]
