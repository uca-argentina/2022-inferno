"
I represent a redo action made by a redo card when the last card played was a speed card
"
Class {
	#name : #RedoSpeedOrOverloadAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoSpeedOrOverloadAction >> on: aGameInstance by: aSpaceship to: aTargetedSpaceship with: aRedoCard [

	aGameInstance
		redoLastCardPlayedBy: aSpaceship
		applyTo: aTargetedSpaceship
		with: aRedoCard
]
