Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	| anElement |
	anElement := super asElement
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1);
		when: BlClickEvent do: [self changeColor:anElement.].
		^ anElement
]

{ #category : #accessing }
MashTun >> changeColor: anElement [
	anElement background: Color blue.
	self inform: 'Mashing done!'
]

{ #category : #accessing }
MashTun >> mash: grains with: water for: aDuration [
	| wort |
	wort := Wort new.
	wort checkConsistency: aDuration
	wort consistency == 5
		ifTrue: [ self inform: 'consistency fine' ].
	^ wort
]

{ #category : #accessing }
MashTun >> mashTunOperationExample [
<gtExample>
|mashTun grains water wort|

mashTun := MashTun new.
grains := Grain new.
water := Water new.

wort := mashTun mash: grains with: water for: 10.
^ mashTun

]

{ #category : #accessing }
MashTun >> pickIngredients [
	<gtExample>
	| grains water |
	grains := Grain new type: 'American Barley'.
	water := Water new.
	^ {grains.
	water}
]
