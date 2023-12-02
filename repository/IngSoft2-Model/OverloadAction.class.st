"
I represent an action or play made by an overload card.
"
Class {
	#name : #OverloadAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
OverloadAction >> on: aGameInstance by: aSpaceship to: aTargetedSpaceship with: anOverloadCard [ 
	 
	aGameInstance
			currentSpaceshipPlaysCard: anOverloadCard
			applyTo: aTargetedSpaceship
			playedBy: aSpaceship .
]
