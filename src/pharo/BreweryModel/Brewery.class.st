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
	| kettle wort hopes theBoil |
	
	wort := self mashingStepExample.

	hopes := Hope new type: 'Admiral'.
	kettle := Kettle new.
	
	theBoil := kettle boil: wort with: hopes ofQuantity: 10 ofType: 'Admiral' for: 60 atTemperature: 100.
	^ theBoil
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
	| fermenter theBoil yeast rawBeer |
	theBoil := self boilingStepExample.
	
	fermenter := Fermenter new.
	yeast := Yeast new type: 'Danster Diamond Lager'.
	rawBeer := fermenter add: yeast to: theBoil andWaitFor: 15.
	^ rawBeer
]

{ #category : #accessing }
Brewery >> filterationStepExample [
<gtExample>

| rawBeer filter beer |

rawBeer := self fermentationStepExample.

filter := Filter new.
beer := filter filter: rawBeer for: 1.
^ beer
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
	^ wort
]
