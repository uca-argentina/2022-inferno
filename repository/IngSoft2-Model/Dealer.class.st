"
I represent a Dealer

"
Class {
	#name : #Dealer,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #dealing }
Dealer >> dealInitialCards [

	| randomcard1 randomcard2 |
	randomcard1 := self dealOne.
	randomcard2 := self dealOne.
	^ Hand containing: {randomcard1. randomcard2}.

]

{ #category : #dealing }
Dealer >> dealOne [

	| array randomcard |
	array := { 
		         SpeedCard new.
		         OverloadCard new.
		         RedoCard new.
		         AccelerationCard new.
		         CancellationCard new.
		         RepeatCard new }.
	randomcard := array atRandom.
	^ randomcard
]
