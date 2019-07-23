Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	^ super asElement
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1) ;
		when: BlClickEvent do: [ self startMashing ];
		yourself
]

{ #category : #accessing }
MashTun >> changeColor [
^ super asElement background: Color blue; yourself
]

{ #category : #accessing }
MashTun >> mash: grains with: water for: aDuration [
	| wort |
	wort := Wort new.
	self asElement background: Color blue.
	self inform: 'mash: with:'.
	^ wort
]

{ #category : #accessing }
MashTun >> startMashing [
	| grains water |
	grains := Grain new.
	water := Water new.
	self mash: grains with: water for: 5
]
