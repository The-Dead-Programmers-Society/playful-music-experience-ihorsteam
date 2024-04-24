# Ihor

## Jaw Harp Sequencer

Name: Ihor Korovanenko

Student Number: C23716011

Class Group: TU984/1

## Description of the project

The idea was to create a sequencer that uses jaw harp sound, the user can control bpm(0-300), apply effects, create some kind of nice sounding sequence

## Instructions for use
![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/7b6548ca-1b59-4191-b7f6-0ecea9092ad6)

Start button that starts and stops the sequencer

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/662a7f96-c826-41bd-9aa7-60eb3ff6cfe3)

The clear button clears all the notes the user has put on a sequencer

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/90f4620c-9c27-425e-848e-4b2ccf6d088f)

BPM slider

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/6f1b1dac-f77a-4053-843b-7a2a5fac86d4)

Panel with effects that can be applied to all sounds in the sequencer. Which are distortion, reverb, chorus, and delay.

![image](https://github.com/The-Dead-Programmers-Society/playful-music-experience-ihorsteam/assets/105048323/e84b10a1-db4e-4295-ac0f-12046314e9c3)

Notes panel with buttons that play each note once 

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
This function changes the pitch of the sound to adjust it to a certain note





## List of classes/assets in the project and whether made yourself or modified or if its from a source, please give the reference

| Class/asset | Source |
|-----------|-----------|
| MyClass.cs | Self written |
| MyClass1.cs | Modified from [reference]() |
| MyClass2.cs | From [reference]() |

## References

## What I am most proud of in the assignment




