"
i represent a type of effect: hyperjump
"
Class {
	#name : #Hyperjump,
	#superclass : #Object,
	#instVars : [
		'jumpsArray'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #assertions }
Hyperjump class >> assertValid: aJumpsArray [ 
	aJumpsArray do: [ :distance | (distance distance) >= 0 ifFalse: [ 
			Error signal: 'Values of the collection cannot be a negative number' ] ].
]

{ #category : #'class initialization' }
Hyperjump class >> createWith: aJumpsArray [ 
	self assertValid: aJumpsArray.
	^self new initializeWith: aJumpsArray.
]

{ #category : #getters }
Hyperjump >> applyHyperJumpIn: aBoard to: aSpaceship [

	| hyperJumpValues parsecsForThisJump |
	hyperJumpValues := jumpsArray.
	parsecsForThisJump := hyperJumpValues removeFirst.
	hyperJumpValues addLast: parsecsForThisJump.
	aBoard executeAnHyperJumpTo: aSpaceship of: parsecsForThisJump.
]

{ #category : #applying }
Hyperjump >> applyTo: aBoard by: aSpaceship [
	 self applyHyperJumpIn: aBoard to: aSpaceship.
]

{ #category : #initialization }
Hyperjump >> initializeWith: aJumpsArray [

	jumpsArray := aJumpsArray sorted reversed
]

{ #category : #getters }
Hyperjump >> jumpValues [

	^ jumpsArray
]
