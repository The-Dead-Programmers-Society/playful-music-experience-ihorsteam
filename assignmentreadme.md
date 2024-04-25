# Ihor

## Jaw Harp Sequencer

Name: Ihor Korovanenko

Student Number: C23716011

Class Group: TU984/1

## Description of the project

The idea was to create a sequencer that uses jaw harp sound, the user can control bpm(0-300), apply effects, create some kind of nice sounding sequence.

## Instructions for use
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/7b6548ca-1b59-4191-b7f6-0ecea9092ad6)

Start button that starts and stops the sequencer.

---

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/662a7f96-c826-41bd-9aa7-60eb3ff6cfe3)

The clear button clears all the notes the user has put on a sequencer.

---

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/90f4620c-9c27-425e-848e-4b2ccf6d088f)

BPM slider.

---

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/6f1b1dac-f77a-4053-843b-7a2a5fac86d4)

Panel with effects that can be applied to all sounds in the sequencer. Which are distortion, reverb, chorus, and delay.

---

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/e84b10a1-db4e-4295-ac0f-12046314e9c3)

Notes panel with buttons that play each note once.

---

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/c216af39-e781-40f6-9501-a1f5b2b20e7a)

In the sequencer panel itself, notes can be activated or deactivated and each row is assigned to the note to which it is adjacent.


## How it works
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/12dca506-7299-4796-9636-e1bf56b69ebf)

I created a scene with a column of the sequencer that contains 7 buttons

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/d01a6cb5-baeb-46e6-8656-7a96ab2b2e86)

Each button has AudioStreamPlayer2D attached to it, a particle effect(visual part), and a button script

Button script has a few main functions

```GDScript
func pitch_sound(note: float):
	var pitch = pow(2, note/12.0)
	audio.pitch_scale = pitch
```
This function changes the pitch of the audioStream to adjust it to a certain note.

```GDScript
func play():
	note.restart()
	audio.play()
	await get_tree().create_timer(0.2).timeout
	note.emitting = false
```
This is a basic behavior of the button.

```GDScript
func _on_toggled(toggled_on):
	can_play = toggled_on
	pass 
```
This is a signal from the button that tells whether sound can be played or not.

```GDScript
func toggleOff():
	button_pressed = false
```
This function resets the button to a deactivated state.

```GDScript
@export var buttons = []
@onready var c = $C
@onready var d = $D
@onready var e = $E
@onready var f = $F
@onready var g = $G
@onready var a = $A
@onready var b = $B

func _ready():
	buttons.append(c)
	buttons.append(d)
	buttons.append(e)
	buttons.append(f)
	buttons.append(g)
	buttons.append(a)
	buttons.append(b)
```
Then the column of buttons itself has a script with an array setup in it.

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/193bc0f9-bab3-4546-a2e4-1147c9d5efaf)

Note button is connected to a panel script that has:

```GDScript
func pitch_sound(note: float):
	var pitch = pow(2, note/12.0)
	main_sound.pitch_scale = pitch
	main_sound.play()
```
Same pitch function as used before, but it changes only one audio source in the scene. 

```GDScript
func _on_c_pressed():
	pitch_sound(0)
	pass
```
Each note button is connected like so and changes pitch to adjust to a certain note that button is supposed to be.

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/5f4e957d-515c-474c-b6d5-fced8ef13188)

The start button has a metronome script that has the main behavior of the whole project.

```GDScript
func _ready():
	array2D.append(panel_3.buttons)
	array2D.append(panel_4.buttons)
	array2D.append(panel_5.buttons)
	array2D.append(panel_6.buttons)
	array2D.append(panel_7.buttons)
	array2D.append(panel_8.buttons)
	array2D.append(panel_9.buttons)
```
First of all, I get all the references to columns and add each array from the column in a new array, creating a matrix this way.

```GDScript
func _process(delta):
	if(repeat):
		time +=delta
	
		if time >= bps:
			
			time -=bps
			array2D[current_column][0].panel_turnOn()
			for i in array2D[current_column]:
				if(i.can_play):
					i.play()
			array2D[current_column][0].panel_turnOff()
			current_column +=1
		if(current_column > array2D.size() - 1):
			current_column = 0

```

In the process function, I check if the button is activated, if it is it adds delta time to the time variable and checks if it is bigger than the bps time ( beats per second).
Then it goes through the current column and checks if the button can play and play it if it is true.
After that, it adds +1 to current_column so that on the next beat it will check the next column.
Finally, it checks if it went through the whole array and resets the value of current_column to zero, which resets the loop.

```GDScript
func _on_clear_pressed():
	for i in array2D.size():
		for j in array2D[i].size():
			array2D[i][j].toggleOff()
	pass
```
The behavior of the clear button. It goes through each element in the matrix and resets it.

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/08d9ea38-74b2-4c8e-b3b9-e52bdd647eaf)

The effects panel works pretty easily

```GDScript
@onready var index = AudioServer.get_bus_index("Recorder")

func _on_distortion_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(index,2,toggled_on)
	pass # Replace with function body.
```
I get the index of the desired bus that each sound is switched to. And on each signal from the button change the enabled value to the current state of the button.

## List of classes/assets in the project and whether made yourself or modified or if its from a source, please give the reference

| Class/asset | Source |
|-----------|-----------|
| effects_switcher.gd | Self-written |
| Metronome.gd | Mostly self-written, sequencer was modified from [reference](https://www.reddit.com/r/godot/comments/15jqlqh/how_do_i_make_a_metronome_that_activates_triggers/) |
| mouseFollow.gd | Self-written |
| Panel.gd | Modified from [reference](https://godotforums.org/d/28197-what-s-the-formula-to-change-audioeffectpitchshift-in-order-to-have-all-the-notes) |
| column.gd | Self-written |
| button.gd | Self-written, pitch sound was modified from [reference](https://godotforums.org/d/28197-what-s-the-formula-to-change-audioeffectpitchshift-in-order-to-have-all-the-notes) |
|jewish-harp-jaw-harp-mouth-harp-doodle-icon-isolated-white-background_658737-352-removebg-preview.png | [reference](https://www.freepik.com/premium-vector/jewish-harp-jaw-harp-mouth-harp-doodle-icon-isolated-white-background_32707512.htm) |
| image(1).png | [reference](https://freepngimg.com/png/15277-musical-notes-free-download-png) |
| C.mp3 | Modifed from [reference](https://www.oberton.pro/en/shop/zhestkaya-iz-latuni.html) |



## Video

[![](https://markdown-videos-api.jorgenkh.no/youtube/-8CVEyWwIF8)](https://youtu.be/-8CVEyWwIF8)

## What I am most proud of in the assignment

This was the first time I had used a matrix in any of my code. The experience gave me a better understanding of working with arrays and will eventually help to write shorter and more efficient code in the future 

# Marko
## Piano + Sampler

Name:Marko Prijic

Student Number: C23431692

Class Group:TU984/1

## Description of the project

A short-scale playable piano/synth with selective percussion sounds.

## Instructions for use

On the left-hand side of the screen is located the "piano".

<img width="178" alt="pianogodot" src="https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145371011/b8204d29-6521-4bc8-84c6-ed46e48a7d83">

 
The user can either click buttons using the mouse left click, or use the keyboard to play the sounds.
The keyboard input is as follows: 1Q2W34R5T6Y78 
For white buttons use noumbers, and for black buttons use letters below them.

On the right-hand side is the sampler with other sounds.

<img width="122" alt="Screenshot 2024-04-25 015850" src="https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145371011/b6fb8be2-e3ca-45fa-9692-54947f11b423">

Like the piano, the user can either click the buttons or use the keyboard
The keyboard input for buttons is: ZXCVBN
Z = Bass drum
X = Snare drum
C = HiHat
V = Crash cymbal
B = Bark sound
N = Cowbell



## How it works

## List of classes/assets in the project and whether made yourself or modified or if its from a source, please give the reference

| Class/asset | Source |
|-----------|-----------|
| MyClass.cs | Self written |
| MyClass1.cs | Modified from [reference]() |
| MyClass2.cs | From [reference]() |

## References

## What I am most proud of in the assignment

# Oleksandra 
## Crazy Hand Drum

Name: Oleksandra Kochkina

Student Number: D22124392

Class Group: TU984/1

Group:  Ihor, Oleksandra, Marko, Maciej (playful-music-experience-ihorsteam)

## Description of the project
I wanted to create something interactive for a user and I decided to create a hung drum with buttons to "play" it with user's mouse. I also added buttons with effects and a slider to it more fun and interesting to play. 
## Instructions for use
User can press buttons which are located on the drum to make sounds. They also can record them, use the BPM slider, and use buttons with special effects which are located on the sides of the instrument to create their own music.
## How it works
I started with creating the hand drum and adding transparent buttons with marcked notes on it 
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/9a2639ce-f29d-4893-b443-e6aa3d086e41)

I used AudioStreamPlayer2D and scripts for buttons

Functions in scripts:

This function adjusts the sound based on a current note when the game/scene starts

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/0e2bf77f-eb84-4f31-9826-cfea048f7ad2)


Next function adjusts the sound to a certain note by pitch

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/1fe24340-fe85-4b1e-baea-3d53a595c4c0)


and the final function checks if the recorder is running and adds the current note to the list of recorded actions

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/5e893572-ca66-43c9-8854-bf0b1315fc5a)


For UI I created panels with buttons and BPM slider

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/b3f5406b-ed31-40c2-8cb1-ece7d27a3e90)

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/7e158025-f510-4ff3-845b-f1273834e20a)

Script for buttons with effects

Those functions apply chosen effects on pressed buttons with notes

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/f7a59db0-cb12-4d04-ab11-849d23e0406e)

BPM slider

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/f0d48f11-c395-44d3-ac17-5bd4469b10a6)

It pitches the sound of pressed notes

Script:

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/95f8018e-0fe8-473e-9756-fc9aaa09b234)


Recording button

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/d61b1045-f10c-4981-a430-9066cf947ab7)

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/334019b4-479a-48f8-8fd4-319ae7ab0601)

Scrip:

After enough time passes (based on a beat per second rate), this function plays a recorded audio.

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/bca9b32b-6df2-4a0c-ad97-2eab45af609d)

This function clears recorded audio as you press the button again.

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/22d3509e-97f1-4bea-aa3c-eadf35f2e228)

This function checks for existing recording so the button can not be pressed if nothing was recorded yet

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/e3532b24-f7bd-4ee7-ac09-6b68f8a6e56b)

Play button

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/d703c70a-f4a6-4303-9ab2-024e52eeb34c)

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/aba95257-be27-42f8-9801-a30022f38a5b)


## List of classes/assets in the project and whether made yourself or modified or if its from a source, please give the reference

| Class/asset | Source |
|-----------|-----------|
| effects_switcher.gd | Self written |
| Panel.gd | Modified from [reference](https://godotforums.org/d/28197-what-s-the-formula-to-change-audioeffectpitchshift-in-order-to-have-all-the-notes) |
| button.gd  | From [reference](https://godotforums.org/d/28197-what-s-the-formula-to-change-audioeffectpitchshift-in-order-to-have-all-the-notes) |
| hangdrum.png | Self drawn |
| JHP C --.wav | From [reference](https://forums.synthstrom.com/discussion/392/handpan-hang-drum-samples) |

## Video

![mqdefault](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/148790425/cbc82443-1346-4017-b617-5ed733e83296)


## What I am most proud of in the assignment

I am mostly proud of understanding the code and what it does even when it is not as good as it should be, but this experience will help me in my future projects.

# Maciej
## Project Title

Name: Alien Bass Guitar

Student Number: C23513423

Class Group: Ihor, Oleksandra, Marko, Maciej (playful-music-experience-ihorsteam)

## Description of the project
For this project I wanted to create a bass guitar with a unique visual design reminiscent of an organ. I wanted it to be functional when using a computer keyboard, but other input devices are applicable if they were to be correctly assigned in the Godot Input Map.
## Instructions for use
The Alien Bass Guitar has a full scale of notes from E1 to E2, including the sharp notes. To play the notes press the corresponding numbers on a keyboard from "1" to "0" and then from "Q" to "E". (ex. "1" corresponds to E note and "Q" corresopnds to the D note)
## How it works
The project`s code takes input from the keyboard through the input map.
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145370257/d466f221-ba91-4b13-89a0-df043607dd11)

It tells the program what to do on a specific input.
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145370257/d4f735d5-120f-4fc0-b09c-bda9f4af2cb0)

The node hierarchy contains 2D sprites for images, as well as separate audio sources for the different musical notes. 
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145370257/6a0ef842-db16-4c10-8e0d-2e47ca82f593)

The code gains access to these audio sources and triggers them when an input from the person playing is detected. 
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145370257/4eff7d3b-5a3f-4404-a7eb-0771c24926a1)

The inputs also trigger colourful flashes of light for each note played.
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145370257/d8192b87-e89c-4f7c-9d79-b573b4086280)
This is also triggered by the input, which gains access to specific 2D sprites in the hierarchy and sets them as "visible" when played and "invisible" when the played button is released.

## List of classes/assets in the project and whether made yourself or modified or if its from a source, please give the reference

| Class/asset | Source |
|-----------|-----------|
| Bass.gd | Self written |
| E.wav   | Self recorded|
| F.wav   | Self recorded|
| Fsharp.wav   | Self recorded|
| G.wav   | Self recorded|
| Gsharp.wav   | Self recorded|
| A.wav   | Self recorded|
| Asharp.wav   | Self recorded|
| B.wav   | Self recorded|
| C.wav   | Self recorded|
| Csharp.wav   | Self recorded|
| D.wav   | Self recorded|
| Dsharp.wav   | Self recorded|
| E2.wav   | Self recorded|
| bass+body.PNG   | Self drawn|
| bass_string.PNG   | Self drawn|
| Radar_Ping.PNG   | Self drawn|
| Radar_Ping_Grey.PNG   | Self drawn|
| Bass_Background.psd.PNG   | Self drawn|
| Radar_Sweep.PNG   | Self drawn|




## References

## What I am most proud of in the assignment
I am proud of coming up withand creating an interesting visual design for the virtual instrument.
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/145370257/c3ef694a-8e7d-47f5-86db-bc1e487caa45)


# Putting work together

## Team members

Ihor Korovanenko, Marko Prijic, Oleksandra Kochkina, Maciej Czajowski 

## Instructions for use

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/0596d1bb-5c47-4a11-aaa8-8997a33afd60)

Use tabs to switch between different virtual instruments 

## How it works

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/68aa6a5b-080a-426a-b491-8458cb10baaa)

All the scenes were put in one scene and hidden except for one

---

```GDScript
func _ready():
	piano.process_mode = 4
	bass_scene.process_mode = 4
```
Since Marko's and Maciej scenes were using the same keys, we turned off the process in the scenes, so they don't make sounds at the same time.

---

```GDScript
func _on_hand_drum_toggled(toggled_on):
	alex_scene.visible = toggled_on
	pass # Replace with function body.
#

func _on_piano_toggled(toggled_on):
	piano.visible = toggled_on
	var process
	if(toggled_on):
		process = 0
	else:
		process = 4
	piano.process_mode = process
	pass # Replace with function body.


func _on_bass_toggled(toggled_on):
	bass_scene.visible = toggled_on
	var process
	if(toggled_on):
		process = 0
	else:
		process = 4
	bass_scene.process_mode = process
	pass 
```
Each button turns on and off scene depending on whether the button is toggled on or not.

## List of classes/assets in the project and whether made yourself or modified or if its from a source, please give the reference

| Class/asset | Source |
|-----------|-----------|
| menu.gd | Self-written |

## Video

[![](https://markdown-videos-api.jorgenkh.no/youtube/jt-obivRXQw)](https://youtu.be/jt-obivRXQw)







