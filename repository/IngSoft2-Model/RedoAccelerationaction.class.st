"
I represent an action or play made by an redo card, when the last card played was an acceleration card
"
Class {
	#name : #RedoAccelerationaction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
RedoAccelerationaction class >> on: aGameInstance by: aSpaceship to: affected with: aRedoCard [ 
	aGameInstance redoLastCardPlayedBy: aSpaceship with: aRedoCard
]
