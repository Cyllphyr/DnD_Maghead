class Scene
  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit (1)
  end
end

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end
  end
end

class IntroScene < Scene
  def enter()
    puts "\n\tMaghead was founded on a mythical or magical event,"
    puts "and is known for having tough warriors. The ruler is on their deathbed,"
    puts "with claimants competing for power. The ruler’s deputy, Jasminia Deephollow,"
    puts "has requested that you investigate the old military outpost about half a"
    puts "day’s journey from the town of Maghead."
    puts "\n\tJasminia has heard whispers from the townsfolk that there has"
    puts "been some nefarious goings on ever since the ruler fell ill."
    puts "In an effort to alleviate their troubles, you have been petitioned"
    puts "to investigate and purge the military outpost of whatever dark"
    puts "magic may have occurred there."
    puts "\n\tYou have accepted this noble calling and have pledged your"
    puts "services to the townsfolk of Maghead; swearing that you will"
    puts "exterminate the foul magic with extreme prejudice to bring back"
    puts "the peace and prosperity to Maghead."
    puts "\n\tAfter making the short journey to the military outpost you see"
    puts "something of a worn down fortification. Pikes of lumber that used"
    puts "to form a wall have fallen and rotted away in most places."
    puts "However, not everything is as it seems. With such haphazard"
    puts "fortifications being in place, you find it curious that there be"
    puts "a metal hatch in the southwest corner of what was this outpost’s"
    puts "courtyard."
    puts "\n\tBeing the brave and upstart adventurer that you are, you pry"
    puts "the old rusty hatch from the dirt at your feet. Upon its release"
    puts "you feel the rush of cool, musty, dank air rushing out of the hole"
    puts "in the ground. Your quest has begun brave adventurer. What awaits"
    puts "you beneath the military outpost of Maghead?"

    print "\nPress Enter to start!"
    start = $stdin.gets

    if start == "\n"
      return 'entry_corridor'
    else
      return 'intro_scene'
    end
  end
end

class EntryCorridor < Scene
  def enter()
    puts "\n\tAs you climb down the rusted, delipidated metal ladder leading"
    puts "from the metal hatch above, your feet touch down on stone. As soon"
    puts "as your full weight is placed from the ladder to the floor, you"
    puts "feel the stone sink beneath your feet with a click. A moment"
    puts "passes only to see a series of torches come to life and dance"
    puts "with flame all the way down the corridor to the east."
    puts "\n\tFrom the most southwestern corner of the ladder, where the"
    puts "ladder is located, you see two corridors to the east. The first"
    puts "inlet sits about 40 feet away from you and the second, a total of"
    puts "70 feet down the hall."
    puts "\n\tThe floor is paved with what feels like old cobbled stone and"
    puts "the walls and ceiling appear to be the same. Along the wall there"
    puts "is a torch every 10 feet or so, providing plenty of light to show"
    puts "you your way."

    print "\n\nDo you choose the closest door or the farthest door?"
    print "\n\tA] Closest Door\n\tB] Farthest Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      puts "You open the door!"
      return 'foyer'
    elsif action == "b" || action == "B"
      puts "You open the door!"
      return 'store_room'
    else
      puts "Please choose a door!"
      return 'entry_corridor'
    end
  end
end

class Foyer < Scene
  def enter()
    puts "\n\tYou enter a large, 20 by 40 foot room. With broken chairs littered"
    puts "along the walls and a table snapped and rotted away you can only"
    puts "assume this to be a welcoming room for guests to arrive and prepare"
    puts "for the rest of the accomodations."
    puts "\n\tYou see one door to the west, one door leading to the south,"
    puts "and a pair of doors on the eastern wall; one on north and one on"
    puts "the south portion of the east wall. Choose wisely adventurer,"
    puts "which door do you go through?"
    print "\n\tA] West Door\n\tB] South Door\n\tC] Northern East Door\n\tD] Southern East Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'corridor_1'
    elsif action == "b" || action == "B"
      return 'entry_corridor'
    elsif action == "c" || action == "C"
      return 'delivery_hall'
    elsif action == "d" || action == "D"
      return 'corridor_2'
    else
      puts "Please choose a door!"
      return 'foyer'
    end
  end
end

class StoreRoom < Scene
  def enter()
    puts "\n\tUpon entering this cold, musty room, you can only assume that"
    puts "this was a storeroom of sorts. With barrels and crates lining the"
    puts "walls, sacks of goods strewn about the room, you can safely assume"
    puts "that it has long been abandoned and left for time to consume."
    puts "\n\tOn the west wall, there are two doors. One on the northern part"
    puts "of the west wall and one on the southern part of the west wall."
    puts "You can also see that there is a large double door on the western"
    puts "part of the north wall and an archway on the eastern part of the"
    puts "north wall."
    puts "\n\nWhich passage will you choose?"
    print "\n\tA] Southern West Wall door\n\tB] Northern West Wall Door\n\tC] Western North Wall Door\n\tD] Archway"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'entry_corridor'
    elsif action == "b" || action == "B"
      return 'corridor_2'
    elsif action == "c" || action == "C"
      return 'delivery_hall'
    elsif action == "d" || action == "D"
      return 'arch_way_store_room'
    else
      puts "Please choose a door!"
      return 'store_room'
    end
  end
end

class Corridor2 < Scene
  def enter()
    puts "\n\tYou enter a small, 20 foot long corridor. There is nothing of"
    puts "interest here save a singular, lone torch illuminating your room"
    puts "on the north wall."
    puts "\n\tThere are only two doors here, one to the west and one to"
    puts "the east. Which way would you like to head next?"
    print "\n\tA] West Door\n\tB] East Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'foyer'
    elsif action == "b" || action == "B"
      return 'store_room'
    else
      puts "Please choose a door!"
      return 'corridor_2'
    end
  end
end

class DeliveryHall < Scene
  def enter()
    puts "\n\tYou enter a wide corridor that appears to have once been very"
    puts "heavily used. You notice that the stones on the floor are worn to"
    puts "an almost refined smoothness."
    puts "\n\tTo the west lies a set of large double doors and to the"
    puts "south east, a singular, wide great door. Which door shall your"
    puts "adventure continue?"
    print "\n\tA] West Door\n\tB] South East Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'foyer'
    elsif action == "b" || action == "B"
      return 'store_room'
    else
      puts "Please choose a door!"
      return 'delivery_hall'
    end
  end
end

class ArchWayStoreRoom < Scene
  def enter()
    puts "\n\tYou approach a large, black, archway, that appears to simply"
    puts "be a hole in the wall. As you peer in, you see a faint, dim, glow"
    puts "at the bottom of the pit. Brave adventure, would you climb in to"
    puts "the pit or choose a different direction?"
    print "\n\tA] Climb in\n\tB] Back Away"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'dumbwaiter_death'
    elsif action == "b" || action == "B"
      return 'store_room'
    else
      puts "Please make a valid selection!"
      return 'arch_way_store_room'
    end
  end
end

class ArchWayKitchen < Scene
end

class Corridor1 < Scene
  def enter()
    puts "\n\tYou enter a small corridor oriented on a diagonally from"
    puts "northwest to southeast. With the torches lighting your way, you"
    puts "can see that to the northwest end of the corridor is the"
    puts "beginning of a staircase. With only a doorway to the southeast"
    puts "of the corridor you only have two options from here."
    print "\n\tA] Stairs\n\tB] Southeast Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'trap_stairs'
    elsif action == "b" || action == "B"
      return 'foyer'
    else
      puts "Please choose a direction that exists."
      return 'corridor_1'
    end
  end
end

class TrapStairs < Scene
  def enter()
    puts "\n\tAs you make your way to the stairs, you see that they are very"
    puts "slightly angled down, leading you deeper through this"
    puts "nefarious maze. As you make your way down the stairs you hear"
    puts "an audible click. Uh-oh adventurer, it seems as though this place"
    puts "is not as it may have seemed. What do you do?"
    print "\n\tA] Continue down the stairs\n\tB] Jump the railing!\n\tC] Jump backwards!\n\tD] Duck!"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'stairs_death_a'
    elsif action == "b" || action == "B"
      return 'stairs_death_b'
    elsif action == "c" || action == "C"
      return 'trap_success'
    elsif action == "d" || action == "D"
      return 'stairs_death_c'
    else
      puts "Don't just stand there! Do SOMETHING!!!"
      return 'trap_stairs'
    end
  end
end

class GreatHall < Scene
  def enter()
    puts "\n\tYou enter a massive room with vaulted ceilings, old, dusty,"
    puts "ornate fixtures, and a great many chairs and long tables"
    puts "splintered and broken all about the room. Somehow the candle"
    puts "chandeliers and floor candelabras are still lit as bright as"
    puts "you would assume them to be as if they were new. The candles show"
    puts "no signs of wax pouring over as you would expect but still have"
    puts "the same amount of dust and cobwebs as the rest of the room."
    puts "\tTo the east lies a single, almost dwarfed sized door when"
    puts "compared to the rest of the room, that lies to the east."
    puts "To the west, there are two doors. One on the south end of the"
    puts "west wall that appears to be about the same size as the door on"
    puts "the east wall. The door on the north side of the west wall appears"
    puts "to be slightly larger in size. Which door will your adventure"
    puts "continue through?"
    print "\n\tA] East Door\n\tB] Northen West Door\n\tC] Southern West Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'serving_corridor'
    elsif action == "b" || action == "B"
      return 'armory'
    elsif action == "c" || action == "C"
      return 'trap_stairs'
    else
      puts "Just pick one!"
      return 'great_hall'
    end
  end
end

class Kitchen < Scene
  def enter()
    puts "\n\tYou enter what appears to be an old, clearly shunned, kitchen"
    puts "left to rot for time to consume. The smell coming from this room"
    puts "assails your nose and you fight off gags and dry heaving for the"
    puts "duration that you spend in this room."
    puts "\n\tOn the east wall, towards the north, lies a door. The rest of"
    puts "the room is littered with old, rotted, decaying food. To the south,"
    puts "you see a dark alcove that appears to house nothing inside. Where"
    puts "to adventurer?"
    print "\n\tA] West Door\n\tB] Dark Alcove"
    print "\n"

    action == $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'serving_corridor'
    elsif action == "b" || action == "B"
      return 'arch_way_kitchen'
    else
      puts "Would you just leave the kitchen already?!"
      return 'kitchen'
    end
  end
end

class ServingCorridor < Scene
  def enter()
    puts "\n\tYou enter a short, narrow corridor. The floow has been gently"
    puts "worn with what you can assume to be only footsteps. There are two"
    puts "torches lit in this room, buring proud and illuminating"
    puts "every stone here."
    puts "\n\tThere are only two doors here. One leading to the east and"
    puts "the other, directly opposite, leading to the west."
    puts "Onwards adventurer! Where does your journey take you?"
    print "\n\tA] East Door\n\tB] West Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'kitchen'
    elsif action == "b" || action == "B"
      return 'great_hall'
    else
      puts "Torch light is burning adventurer! Choose a door!"
      return 'serving_corridor'
    end
  end
end

class Armory < Scene
  def enter()
    puts "\n\tAs you enter the room, you are besieged by a meticulously"
    puts "organized room as it doesn’t appear as though anything here has"
    puts "moved for all the years it has stood. Every inch of this room holds"
    puts "some form of arms or armor. Where the is no armament, a light source"
    puts "illuminates its surroundings with a stunning radiance that you"
    puts "haven’t seen in any of the other rooms so far."
    puts "\n\tTo the north lies another set of stairs that lie on a southwest"
    puts "to northeast direction. On the eastern wall sits a lone door."
    puts "Do you take to the stairs or make your way to the door?"
    print "\n\tA] Stairs \n\tB] East Door"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'battlement'
    elsif action == "b" || action == "B"
      return 'great_hall'
    else
      puts "Yes all the weapons are pretty. No you can't have one."
      return 'armory'
    end
  end
end

class Battlement < Scene
  def enter()
    puts "\n\tOf all the rooms that you have explored so far, this is the"
    puts "most dimly lit by far. Startled for a brief moment by humanoid"
    puts "figures along the walls of this room, you realize that the figures"
    puts "are simply training dummies. Likely once used by the soldiers and"
    puts "warriors of the fort when it was once filled with occupants."
    puts "\n\tLeading to the west are a set of stairs and to the east stands"
    puts "a corridor with no door; much unlike the others here. Does your"
    puts "adventure take you to the stairs or through the corridor?"
    print "\n\tA] Corridor\n\tB] Stairs"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'chutes'
    elsif action == "b" || action == "B"
      return 'armory'
    else
      puts "Stop hitting the training dummies. Go somewhere."
      return 'battlement'
    end
  end
end

class Chutes < Scene
  def enter()
    puts "In this corridor, the torches are just as dim as the training room,"
    puts "if not just a little bit brighter. Both thresholds to the east and"
    puts "west have no door and appear to only lead to more dimly lit rooms."
    puts "West or East adventurer? Where does your curiosity take you?"
    print "\n\tA] East\n\tB] West"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'lair_room'
    elsif action == "b" || action == "B"
      return 'battlement'
    else
      puts "Well, it's dark and cramped. Nice corridor eh? Move on."
      return 'chutes'
    end
  end
end

class LairRoom < Scene
  def enter()
    puts "\n\tAs you enter the dimly lit, cold room you begin to hear a"
    puts "slight hum. To the southeast you see a light gently oscillating"
    puts "and glowing. Its source appears to be blocked as you watch the light"
    puts "gracefully dance around the figure. What next?"
    print "\n\tA] Move forward towards the light source\n\tB] Leave the room"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'lair_room_forward'
    elsif action == "b" || action == "B"
      return 'chutes'
    else
      puts "Look, I get it. It's ominous. Apathy is death, do something."
      return 'lair_room'
    end
  end
end

class LairRoomForward < Scene
  def enter()
    puts "\n\tYou cautiously, carefully inch your way forward for a closer"
    puts "look to identify what exactly is going on. The closer you get, you"
    puts "start to hear a low hum. Louder and louder the humming grows for"
    puts "every inch that you get closer to the light source."
    puts "\n\tNow within feet of the light source you hear a deep, ominous"
    puts "voice that hisses at you, ‘I am Zurgenger! Harbinger of death,"
    puts "decimator of empires! You are too late! The great purge has begun!’"
    puts "\n\tWithout a sound, the figure raises his hands towards the ceiling."
    puts "Simultaneously, every possible vessel of fire erupts in a bright"
    puts "and brilliant conflagration of destruction. Licking the walls and"
    puts "making its way to the ceiling the flames turn from a bright orange"
    puts "and red to a deep, foreboding, vibrant purple."
    puts "\n\tAbsolutely stunned with fear and awe, you have a choice to make"
    puts "adventurer. Fight or give up this adventure?"
    print "\n\tA] To the death!\n\tB] To hell with this! Maghead is on its own!"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'lair_room_fight'
    elsif action == "b" || action == "B"
      return 'lair_room_flee'
    else
      puts "Quit being a ninny. Do something!"
    end
  end
end

class LairRoomFight < Scene
  def enter()
    puts "\n\tFighting every urge in your body telling you to flee, you lunge"
    puts "forwards the back of the 8 foot tall man. As if the man knew what"
    puts "you were going to do before you acted, he turns to face you and"
    puts "meet with glorious combat!"
    puts "\n\tHowever, what you see meeting your blade is not a man at all!"
    puts "Instead, this humanoid figure has a deep purple skin tone with an"
    puts "almost wet sheen to it. His face has octopus like tentacles,"
    puts "constantly squirming and writhing almost as if they’re looking for"
    puts "something and occasionally reach out towards you. His eyes are"
    puts "blacker than the darkest night and seem to have no way to focus."
    puts "Despite this, you can see and feel his hate and rage directed"
    puts "solely to you."
    puts "\n\tAs you push to make your blade meet his flesh you realize that"
    puts "this creature is slowly letting you towards him as his tentacles"
    puts "fanatically reach out to embrace you!"
    puts "\n\tYou let up and quickly hop backwards, away from the beast and"
    puts "you start to notice that the orb emitting the light from earlier"
    puts "almost starts to vibrate and pulsate with more light."
    print "\n\tA] Keep fighting the creature!\n\tB] Make a break for the orb, it must be the source!"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      puts "\n\tFocusing back to the fight with the foul humanoid before you,"
      puts "you lunge back towards him; driven with righteous fury you plunge"
      puts "your weapon deep in to the chest of him."
      puts "\n\tWith a gurgle and sputter, warm, black ichor sprays everywhere"
      puts "and covers your face. You start to feel the tentacles squirm,"
      puts "reach out for you, and start to wrap around your hands. As if by"
      puts "lightning instinct, you tear out your blade with a squelch and"
      puts "repeatedly being to decimate the creature’s head until it  is"
      puts "perforated to mush and begins a deluge of ichor to cover its"
      puts "entire being."
      return 'treasury_room'
    elsif action == "b" || action == "B"
      puts "\n\tYou ignore the large foreboding creature and focus your"
      puts "attention to the brilliant orb across the room. You charge towards"
      puts "the imposing figure and instead of using your blade, you ram your"
      puts "shoulder through him."
      puts "\n\tYou connect and push Zurgenger to the side; your path to the"
      puts "orb is free and clear! Motivated and driven by adrenaline you"
      puts "reach the orb with an impressive speed. Resting on its pedestal"
      puts "you grab the orb and lift it high above your head."
      puts "\n\tYou hear the most ear bleeding schreach erupt from Zurgenger"
      puts "as he sees you holding the orb above your head. Just as you are"
      puts "about to throw the sphere towards the stone floor you feel a rush"
      puts "of air erupt behind you as a portal opens and begins to consume"
      puts "the flames around you."
      puts "\n\tWithout a moment to lose, you heave the orb towards to floor"
      puts "with all your might and it shatters with a brilliant explosion of"
      puts "light. The portal closes with force unlike any that you have felt"
      puts "before and Zurgenger begins to shudder and whither on the floor in"
      puts "front of you."
      puts "\n\tWith excruciating pain, you watch as Zurgenger dies and"
      puts "crumples into a pile of flesh on the floor."
      return 'treasury_room'
    else
      puts "You feel a warm, firm grip wrap around your"
      puts "entire torso. You look down and see nothing there to hold you."
      puts "\n\tSlowly you start to be pulled towards the large,"
      puts "tentacle ridden man. You struggle and fight with all your"
      puts "might against this unseen force as you are being pulled"
      puts "towards this vile, imposing figure; tencales spastically"
      puts "flailing with excitment and anticipation."
      puts "\n\tFinally you are within the grasp of Zurgenger's tentacles and"
      puts "they start to wrap slowly around your neck and shoulders. As if"
      puts "to laugh, you see his eyes look up and you hear a deep, abyssal"
      puts "sound eminate from his face. It is now that the tentacles wrap"
      puts "around your entire head and begin to firmly squeeze."
      puts "\n\tYou feel the life begin to leave your body, almost like slipping"
      puts "in to a small bath. Your lungs feel as though you begin to burst as"
      puts "you fight even harder to escape but to no avail. Slowly your body"
      puts "begins to feel numb until there is nothing."
      return 'game_over'
    end
  end
end

class LairRoomFlee < Scene
  def enter()
    puts "\n\tOvercome with absolute terror, you quickly turn on your heel to"
    puts "run as fast as you can out of the room and leave this horrid place."
    puts "Not three paces in you feel a warm, firm grip wrap around your"
    puts "entire torso. You look down and see nothing there to hold you."
    puts "\n\tSlowly you start to be drug backwards, away from the exit!"
    puts "You struggle and fight with all your might against this unseen force"
    puts "as you are being pulled away from your attempted freedom."
    puts "\n\tThe movement slows and you rise up off the ground. Moments later"
    puts "you feel the pressure of something cold and firm start to coil"
    puts "around your shoulders; then up the back of your head until finally"
    puts "you see something that resembles tentacles cover your eyes."
    puts "\n\tYou feel the life begin to leave your body, almost like slipping"
    puts "in to a small bath. Your lungs feel as though you begin to burst as"
    puts "you fight even harder to escape but to no avail. Slowly your body"
    puts "begins to feel numb until there is nothing."
    print "\n"
    return 'game_over'
  end
end

class TreasuryRoom < Scene
  def enter()
    puts "\n\tYou have finally completed your near death trial and believe that the threat to Maghead is finally at an end. You enter a large room that appears to be some sort of staging area with large pools of water organized and established in a neat, deliberate manner."
    puts "\n\tWhat these pools are for, you are unsure  but you do see a tunnel leading out towards some form of light source. As you peer deeper in to the tunnel you feel a slight draft; a way out of this hellish hole!"
    puts "\n\tWhat do you say, is it time to conclude our adventure?"
    print "\n\tA] Leave\n\tB] Go back"
    print "\n\t"

    action = $stdin.gets.chomp

    if action == "a" || action == "A"
      return 'finished'
    elsif aciton == "b" || action == "B"
      puts "What do you want to go back for? You're done!"
      return 'treasury_room'
    else
      puts "Adventurer, stop starting at your shoes. Do something."
      return 'treasury_room'
    end
  end
end

class TrapSuccess < Scene
  def enter()
    puts "\n\tNow that the devious trap has been avoided, you think it"
    puts "safe enough to continue. Do you continue your trek down the"
    puts "stairs or turn back?"
    print "\n\tA] Down the stairs\n\tB] Turn back, I'll try to find another way"
    print "\n"

    action = $stdin.gets.chomp

    if action == "a"
      return 'great_hall'
    elsif action == "b"
      return 'corridor_1'
    else
      puts "Don't just stand there! Move!"
      return 'trap_success'
    end
  end
end

class StairsDeathA < Scene
  def enter ()
    puts "\n\tYou ignore the clicking noise and decide to continue down the"
    puts "stairs and take a single step forward."
    puts "\n\tBefore you can even lift your other foot to move forward you"
    puts "feel a series of impacts to your chest and suddenly you"
    puts "can’t breathe. Following that, you see what appears to be a large"
    puts "meat tenderizer hurtling towards your face and then, nothing."
    puts "\n\tYou died."
    print "\n"

    return 'game_over'
  end
end

class StairsDeathB < Scene
end

class StairsDeathC < Scene
end

class DumbwaiterDeath < Scene
end

class DumbwaiterKitchen < Scene
end

class Loo < Scene
end 

class GameOver < Scene
end

class Finished < Scene
end

class Map
  @@scenes = {
    'intro_scene' => IntroScene.new(),
    'entry_corridor' => EntryCorridor.new(),
    'foyer' => Foyer.new(),
    'store_room' => StoreRoom.new(),
    'corridor_2' => Corridor2.new(),
    'delivery_hall' => DeliveryHall.new(),
    'arch_way_store_room' => ArchWayStoreRoom.new(),
    'arch_way_kitchen' => ArchWayKitchen.new(),
    'corridor_1' => Corridor1.new(),
    'trap_stairs' => TrapStairs.new(),
    'great_hall' => GreatHall.new(),
    'kitchen' => Kitchen.new(),
    'serving_corridor' => ServingCorridor.new(),
    'armory' => Armory.new(),
    'battlement' => Battlement.new(),
    'chutes' => Chutes.new(),
    'lair_room' => LairRoom.new(),
    'lair_room_forward' => LairRoomForward.new(),
    'lair_room_fight' => LairRoomFight.new(),
    'lair_room_flee' => LairRoomFlee.new(),
    'treasury_room' => TreasuryRoom.new(),
    'trap_success' => TrapSuccess.new(),
    'stairs_death_a' => StairsDeathA.new(),
    'stairs_death_b' => StairsDeathB.new(),
    'stairs_death_c' => StairsDeathC.new(),
    'dumbwaiter_death' => DumbwaiterDeath.new(),
    'dumbwaiter_kitchen' => DumbwaiterKitchen.new(),
    'loo' => Loo.new(),
    'game_over' => GameOver.new(),
    'finished' => Finished.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end


  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('intro_scene')
a_game = Engine.new(a_map)
a_game.play()
