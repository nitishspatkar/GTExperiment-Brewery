Class {
	#name : #Brewery,
	#superclass : #Object,
	#instVars : [
		'equipments',
		'processes'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Brewery >> boilingStepExample [
<gtExample>

| brewery boilingStep kettle grains water |

brewery := self breweryCreationExample.

kettle := Kettle new.
grains := Grain new type: 'Abbay Malt- US'; color: Color brown veryMuchLighter; quantity: 10.
water := Water new density: 0.5.

boilingStep:= Boiling new equipments addAll: {kettle}.

brewery processes addAll: {boilingStep}.

^ brewery

]

{ #category : #accessing }
Brewery >> breweryCreationExample [
<gtExample>
| brewery|

brewery := Brewery new.

^ brewery

]

{ #category : #accessing }
Brewery >> equipments [
^ equipments
]

{ #category : #accessing }
Brewery >> initialize [ super initialize.

equipments := OrderedCollection new.
processes := OrderedCollection new.


]

{ #category : #accessing }
Brewery >> processes [
^ processes
]
