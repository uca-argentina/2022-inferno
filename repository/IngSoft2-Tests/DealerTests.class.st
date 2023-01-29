Class {
	#name : #DealerTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DealerTests >> test01ACardDealerCanBeCreatedPassingAnArrayOfTypesToBeInDeck [
	| types  cardDealer |
	types := { 
		         SpeedCard new.
		         OverloadCard new.
		         RedoCard new.
		         AccelerationCard new.
		         CancellationCard new.
		         RepeatCard new }. 
		cardDealer := Dealer ofCards: types.
		self assert: (cardDealer dealOne) assertThatIsACard  
		
]

{ #category : #tests }
DealerTests >> test02ACardDealerCanBeCreatedPassingAnArrayOfOnlyOneTypeOfCard [
	| types  cardDealer |
	types := { 
		         SpeedCard new.
				 }. 
		cardDealer := Dealer ofCards: types.
		self assert: (cardDealer dealOne) assertThatIsACard  
		
]
