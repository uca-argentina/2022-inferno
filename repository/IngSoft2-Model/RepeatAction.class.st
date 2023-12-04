"
I represent a repeat action made by a repeat card.
"
Class {
	#name : #RepeatAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RepeatAction >> on: aGameInstance by: aSpaceship to: aTargetedSpaceship with: aRepeatCard [

	aGameInstance
		repeatEffectCardPlayedBy: aSpaceship
		applyTo: aTargetedSpaceship
		with: aRepeatCard
]
