"
I represent an action or play made by an aredo card when the last card played was a cancelattion card.
"
Class {
	#name : #RedoCancellationAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoCancellationAction class >> on: aGameInstance by: aSpaceship to: affected with: aRedoCard [
	aGameInstance redoCancelationCard: (affected at: 2)
			from: (affected at: 1)
			PlayedBy: aSpaceship
			with: aRedoCard
]
