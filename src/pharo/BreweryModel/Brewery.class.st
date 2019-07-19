Class {
	#name : #Brewery,
	#superclass : #Object,
	#instVars : [
		'equipments'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Brewery >> boilingStepExample [
	<gtExample>
	| brewery kettle wort hopes theBoil |
	
	brewery := self mashingStepExample at:1.
	wort := self mashingStepExample at:2. 
	
	hopes := Hope new type: 'Admiral'.
	kettle := Kettle new.
	brewery equipments add: kettle.
	
	theBoil := kettle boil: wort with: hopes ofQuantity: 10 ofType: 'Admiral' for: 60 atTemperature: 100.
	^ {brewery.theBoil}
]

{ #category : #accessing }
Brewery >> breweryCreationExample [
	<gtExample>
	| brewery |
	brewery := Brewery new.
	^ brewery
]

{ #category : #accessing }
Brewery >> dispenseStepExample [
<gtExample>
| beer storer |
beer := self filterationStepExample.
storer := Storer new.
^ storer dispense: beer

]

{ #category : #accessing }
Brewery >> equipments [
	^ equipments
]

{ #category : #accessing }
Brewery >> fermentationStepExample [
	<gtExample>
	| brewery fermenter theBoil yeast rawBeer |
	
	brewery := self boilingStepExample at:1.
	theBoil := self boilingStepExample at:2.
	
	fermenter := Fermenter new.
	brewery equipments add: fermenter.
	yeast := Yeast new type: 'Danster Diamond Lager'.
	rawBeer := fermenter add: yeast to: theBoil andWaitFor: 15.
	^ {brewery.rawBeer}
]

{ #category : #accessing }
Brewery >> filterationStepExample [
<gtExample>

| brewery rawBeer filter beer |

brewery := self fermentationStepExample at:1.
rawBeer := self fermentationStepExample at:2.

filter := Filter new.
brewery equipments add: filter.
beer := filter filter: rawBeer for: 1.
^ {brewery.beer}
]

{ #category : #accessing }
Brewery >> initialize [ super initialize.
equipments := OrderedCollection new.
]

{ #category : #accessing }
Brewery >> mashingStepExample [
	<gtExample>
	| brewery mashTun grains water wort |
	brewery := self breweryCreationExample.
	mashTun := MashTun new.
	brewery equipments add: mashTun.
	grains := Grain new
		color: Color brown;
		type: 'Aromatic Malt- US'.
	water := Water new density: 0.5.
	wort := Wort new.
	wort := mashTun mash: grains ofQuantity: 5 with: water ofQuantity: 20 for: 60 atTemperature: 100.
	^ {brewery.mashTun.wort}
]

{ #category : #accessing }
Brewery >> spawnBrewery [
	| brewery mashTun kettle fermenter filter storer |
	
	brewery := Brewery new.
	mashTun := MashTun new.
	kettle := Kettle new.
	fermenter := Fermenter new.
	filter := Filter new.
	storer := Storer new.
	brewery equipments
		addAll:
			{mashTun.
			kettle.
			fermenter.
			filter.
			storer}.
	
	^ brewery
]
