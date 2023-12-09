"
i represent an effect creator
"
Class {
	#name : #EffectCreator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #randomCreation }
EffectCreator >> arrayOfJumpsCreator [

	| arrayOfJumps arraySize |
	arraySize := 10 atRandom.
	arrayOfJumps := OrderedCollection new.
	arraySize timesRepeat: [ 
		arrayOfJumps add: (Parsec distanceOf: 15 atRandom) ].
	^ arrayOfJumps
]

{ #category : #assertions }
EffectCreator >> assertAmountOfSpotsIsMoreThanZero: anAmountOfSpots [

	anAmountOfSpots > 0 ifFalse: [ 
		Error signal: 'Cannot create a layout with size zero or lower.' ]
]

{ #category : #layoutCreation }
EffectCreator >> assertCorrectProbabilities: aDictionaryWithEffectsAndItsProbabilities [

	(aDictionaryWithEffectsAndItsProbabilities values anySatisfy: [ :prob |
		 prob < 0 or: [ prob > 100 ] ]) ifTrue: [
		self error:
			'Invalid probabilities. Probabilities must be between 0 and 100.' ]
]

{ #category : #assertions }
EffectCreator >> assertEffectProbabilityIsPositive: eachProbability [

	eachProbability > 0 ifFalse: [ 
		Error signal: 'Effect probability cannot be zero or lower.' ]
]

{ #category : #assertions }
EffectCreator >> assertSumOfProbabilitiesIsOneHundredOrLess: sumOfProbabilities [

	sumOfProbabilities <= 100 ifFalse: [ 
		Error signal: 'Sum of probabilities exceeds 100 percent.' ]
]

{ #category : #layoutCreation }
EffectCreator >> createLayoutFor: anAmountOfSpots using: aDictionaryWithEffectsAndItsProbabilities [

	| layout remainingProbability noEffect |
	layout := OrderedCollection new.
	remainingProbability := 100.
	self assertCorrectProbabilities:
		aDictionaryWithEffectsAndItsProbabilities.
	aDictionaryWithEffectsAndItsProbabilities associationsDo: [
		:association |
		| effect probability numberOfSpots |
		effect := association key.
		probability := association value.

		probability := probability min: remainingProbability.

		numberOfSpots := probability * anAmountOfSpots / 100 rounded.

        numberOfSpots timesRepeat: [
            | spotEffect |
            spotEffect := (effect respondsTo: #createWith:)
                ifTrue: [effect createWith: (self specialCreatorFor: effect)]
                ifFalse: [effect new].

            layout addLast: (Spot createWith: spotEffect).
        ].

		remainingProbability := remainingProbability - probability ].
	noEffect := NoEffect new.
	remainingProbability timesRepeat: [ layout addLast: (Spot createWith: noEffect) ].
	layout shuffle.

	^ layout
]

{ #category : #layoutCreation }
EffectCreator >> for: anAmountOfSpots with: aDictionaryWithEffectAndItsProbabilities [

	| sumOfProbabilities |
	sumOfProbabilities := 0.
	self assertAmountOfSpotsIsMoreThanZero: anAmountOfSpots.
	aDictionaryWithEffectAndItsProbabilities valuesDo: [ :eachProbability | 
		self assertEffectProbabilityIsPositive: eachProbability.
		sumOfProbabilities := sumOfProbabilities + eachProbability ].
	self assertSumOfProbabilitiesIsOneHundredOrLess: sumOfProbabilities.
	^ self
		  createLayoutFor: anAmountOfSpots
		  using: aDictionaryWithEffectAndItsProbabilities
]

{ #category : #randomCreation }
EffectCreator >> moonwalkNumberCreator [

	^ 10 atRandom
]

{ #category : #creation }
EffectCreator >> specialCreatorFor: anEffect [
    (anEffect class = Moonwalk class )ifTrue: [ 
		^ (self moonwalkNumberCreator)
	 ].
	(anEffect class = Hyperjump class )ifTrue: [ 
		^ (self arrayOfJumpsCreator)  ]
	
	


]
