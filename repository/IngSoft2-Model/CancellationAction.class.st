"
I represent an action or play made by an cancellation card.
"
Class {
	#name : #CancellationAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
CancellationAction >> on: aGameInstance by: aSpaceship to: affected with: aCancellationCard [

	aGameInstance
		cancelCard: (affected at: 2)
		from: (affected at: 1)
		playedBy: aSpaceship
		with: aCancellationCard
]
