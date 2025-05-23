namespace :speeches do 
  
  #rails g scaffold Speech name:string tags:string organization:references speaker:references user:references event:references body:text 
  
  # be rake speeches:init --trace
  task :init => :environment do
    Rake::Task["speeches:seed"].invoke
    Rake::Task["speeches:metrics"].invoke
  end
  
  # be rake user:seed --trace
  task :seed => :environment do
    
    speech_structs = []

    speech_structs << 
    OpenStruct.new(
      name: "The World has Changed and Democrats Need to Change",
      organization_id: Organization.indiana50501.id, 
      user_id: User.scott.id,
      speaker_id: Speaker.scott.id,
      event_id: Event.where(fid: '525_nk').first.id,
      body: "
      # The World has Changed and Democrats Need to Change

      I'm going to start with a thesis:

      * Trump 2.0 isn't Trump 1.0.  
      * Trump 2.0 isn't GW
      * Trump 2.0 isn't a President.  
      * Trump 2.0 is a Fascist King

      And now I'm going to hit you with some comments that I keep being given:

      * You shouldn't swear

      And then there was this bit of pushback:

      * You can't be friends with him
      * He shouldn't speak at your events
      * You need to hire a Professional Strategist

      And

      * You can't use that word 
      * You can't say that 
      * That word will keep scare people
      * That word will cost us the 2026 elections

      Really people ?

      Have you not realized that we are goddamn losing? 

      I keep being told that I shouldn't say certain words 

      I shouldn't be friends with certain people

      I keep being told **wait for the 2026 elections**

      I keep being told that my being offensive will turn people off.

      I keep being told The decorum is important.

      I keep being told that we can't look like we're crazy 

      That we can't look like we're angry 

      And then the VERY SAME people will tell me that if we don't get Trump out, we'll be in open revolution by July 

      THIS WAS AN ACTUAL CONVERSATION I HAD -- IN PERSON -- at the Micah Beckwith protest in Elletsville this past Monday.

      You can't have it both ways people 

      Either Trump is an existential threat, which will lead to the next American Revolution 

      Or he's politics as usual 

      Now if Trump is politics as usual, no big deal --- Y'all are right and I need to shut my face hole -- and play by the rules

      But what if I'm right?

      Quick audience poll:

      Who thinks Trump is politics as usual?

      -or- 

      Who thinks Trump is a fascist who is trying to wreck the country and the 2026 elections MAY NOT MATTER AT ALL

      So I'm gonna tell you something about 50501 that people seem to get wrong

      We aren't politics as usual

      I mean come on -- you folks do realize that we're different right -- we pull off LARGE SCALE events every two weeks on the regular.  

      I don't think that's normal for Indiana Democratic politics.  

      I don't think that's normal for Democratic politics in America

      Now please understand this

      We are not right

      We are not left

      We are right versus wrong

      We say we are the damn resistance 

      So let's resist 

      These beliefs:

      That we can't look angry 

      That we must police our speech

      That we must play by the rules

      These are why we lose 

      THE RIGHT ISN'T PLAYING BY THE RULES

      WHY SHOULD WE?

      Now let's talk about me.

      I'm 57 which means I'm old enough to join the AARP but I have yet to order off the early bird menu.

      Come on folks -- that's a joke.
      
      Old isn't an number.  
      
      Old is a mindset.
      
      Old is nothing more than an inability to accept change.
      
      I'm not old.
      
      And if you're here, I would contend that you aren't old either.

      However, I am the resistance

      Heck I'm the State Organizer and 

      I like my invective

      I like my dirty words 

      And yet y'all keep telling me not to use them 

      So here's the thing about the dirty words 

      They have power

      They stand out

      They motivate 

      And you know who they motivate ?

      They motivate the young 

      Speech patterns change every damn generation.  

      I remember when my parents shook their heads at my language

      And I'll admit that I don't always enjoy it when my sons use some of the spicier words

      And yes I'm a damn proud father, two boys, 18 and 23

      Now today's young have incorporated cursing into their lifestyle as a damn art form 
      
      They do this from a position of media literacy, internet savvy, rap music and more 

      And we need the young to come out and join us here

      So tell me who's more likely to get young people out here?

      An established Democrat politician like Chuck Schumer with his careful attention to detail ?

      Or a fire brand who uses dirty words ? 

      How's that working for democrats? 

      Where is Chuck Schumer?  

      Anyone seen him lately?
      
      How are his numbers?

      Let's be honest people -- the U.S. is the ONLY industrialized nation that doesn't have national health care.
      
      Can anyone tell me honestly ON THAT BASIS ALONE we don't need change?

      Change is necessary and it is here. 
      
      It is now. 

      We are the resistance!

      And may I have a chorus please?

      FUCK TRUMP
      
      "
    )
    
    speech_structs << 
    OpenStruct.new(
      name: "Defending the Constitution from Its Abusers",
      organization_id: Organization.indiana50501.id, 
      user_id: User.resisting_oracle.id,
      speaker_id: Speaker.resisting_oracle.id,
      event_id: Event.where(fid: '525_nk').first.id,
      #slug: ,
      body: "
      **Defending the Constitution from Its Abusers**

      Delivered at The State House – May 2025

      Good afternoon, Indianapolis! Thank you for showing up for our democracy!

      We are here today out of a fierce, unshakable love for our country. We are here because the Constitution—the foundation of our republic, our freedoms, our national identity—is under direct attack. And that attack is coming from the executive branch itself, led by a president who treats the rule of law like an obstacle to be bulldozed.

      I’m here to directly speak about Donald Trump’s recent executive orders, all 152 of them. They are not just bad policy—they are constitutional violations. They undermine the principle of popular sovereignty and directly conflict with Article 6.
      Each order is an erosion of our rights, each one a blow to the structure of the American government.

      Take Executive Order 14160 -- with one stroke of a pen, Trump attempted to strip citizenship from U.S.-born children of undocumented or temporary immigrants—gutting the 14th Amendment and dismissing over a century of legal precedent.

      Don’t let anyone tell you that this is a policy disagreement. It’s a direct assault on —the right of the soil—a principle upheld by the Supreme Court in 1898 when it ruled on the case: United States v. Wong Kim Ark. 

      The Constitution could not be clearer, and Trump could not be more defiant.

      And he doesn’t stop there. That was just the beginning.

      Seventeen Inspectors General—independent watchdogs whose job is to expose government misconduct—have been fired under the guise of **executive authority.** 

      These aren’t figureheads. They are the people who uncover fraud, waste, abuse, and corruption inside our government. Removing them isn’t just a bureaucratic reshuffle—it’s a purge. A purge that guts accountability and opens the door to unchecked power.

      Michael J. Missal, the Inspector General of Veterans Affairs, was among those dismissed. He said it best: 

      **Inspectors General are nonpartisan and independent, and ensure transparency from our federal government. We fight fraud, waste, and abuse every day.**

      Every firing sends a chilling message: oversight is unwelcome. Transparency is a threat. And truth is optional. Trump is not just asserting control—he’s denying us ours.**

      And it’s not just oversight under attack—Trump is coming for due process itself. The right to fair treatment under the law—the backbone of American justice—is being systematically dismantled.

      He invoked the Alien Enemies Act to fast-track deportations—no hearings, no appeals, no justice. His expanded, expedited removal policies strip people of the right to defend themselves before being forced out of the country.

      Let’s be clear: if the government can deny them a hearing today, it can deny you one tomorrow. That’s not immigration policy. That’s authoritarianism.

      These aren’t isolated abuses—they’re part of a strategy to destroy the legal safeguards that protect all of us. Make no mistake: when due process dies, dictatorship is born.

      Executive Order 14171—ironically titled **Restoring Accountability**

      —esurrects Schedule F, giving Trump power to fire tens of thousands of nonpartisan civil servants. These are career experts who serve the American people, not any one president. This isn’t reform. It’s a political purge—a hostile takeover of our government by loyalists.

      With every firing, every silenced critic, Trump isn't just tightening his grip—he's choking the voice of the people.

      He’s also targeting independent regulatory agencies—like the FTC and FCC— these bodies were designed to operate free from political interference. Trump’s orders drag them under direct presidential control, gutting their independence and clearing the path for unchecked power.

      Worse still, he’s using that unchecked power to go after his critics.

      Remember the executive order canceling federal contracts for law firms like Perkins Coie—simply because they dared to represent Americans challenging his agenda? He’s evoked their security clearances.

      These are outrageous violations of the First Amendment, punishing people not for crimes, but for the mere act of dissent. That’s not governance—it’s retaliation. And it’s wrong. And it’s illegal. It’s not American.

      Our First Amendment guarantees the right to free speech. The right to petition the government for redress of grievances. The right to stand here, today, and raise our voices without fear of retribution. 

      But in Trump’s America, that promise becomes a threat:

      Fall in line or face the consequences.

      The Constitution was meant to be our shield against tyranny.

      But when an evil power holds that shield, it becomes a weapon – a battering ram against the laws designed to protect our republic and our democratic process. 
      And here’s a question that weighs on me daily. Where is the Supreme Court?

      This same Court that calls itself **originalist**—that claims to purport the purest, most strict interpretations of the Constitution—suddenly loses its convictions when faced with Trump’s abuses. Why do these justices suddenly find room to maneuver, to equivocate, to allow orders that eviscerate due process, checks and balances, and the fundamental rights of citizens? 

      It’s hypocrisy—these Justices aren’t guarding the Constitution—they’re guarding corruption.

      Their **fidelity to the framers** is selective, weaponized, and hollow. And the people? We’re left in the rubble of their betrayal - left in the ruins of the war on the law itself.

      We, the people, are told that the Constitution is our shield. But what good is a shield if those sworn to hold it up instead lay down their arms and surrender justice?
      Frederick Douglass warned us that **The limits of tyrants are prescribed by the endurance of those whom they oppress.** Well, our endurance ends here.
      We know better. The Constitution is much more than ink empty words on old parchment paper.

      * It’s a promise—it’s a living covenant between the governed and the government.

      * It is our task, and our sacred duty, to hold that promise alive.

      * We must fight back. And we must fight hard.

      * We demand independent oversight.

      * We defend the 14th Amendment.

      * We call out the Court’s cowardice—because silence in the face of injustice is complicity.

      * We will not stand by while the Constitution is shredded for political gain. We will not let executive overreach become the norm. And we will not let the highest court excuse the inexcusable.

      * We protest with resolution - not just with outrage—but with unshakable tenacity.

      Because the Constitution doesn’t defend itself. 

      * It relies on us.

      * It relies on teachers who refuse to teach lies.

      * On journalists who tell the truth under threat.

      * It relies on veterans who still believe in the nation they served and on activists who organize when others go silent.

      * The Constitution counts on workers who know democracy doesn’t clock out at 5 pm, and on students who demand a future built on freedom and not fear.

      * It relies on immigrants who believe in America more fiercely than many born into it.

      * It depends upon parents raising children who question power—not worship it, and on artists who speak what will not be silenced.

      * Our freedom and way of life depends on the whistleblowers who risk everything for truth, and on judges—that remember their oath is to the Constitution, not to a man.
      It relies on farmers, nurses, scientists, neighbors, and voters—

      * Ordinary people doing extraordinary things simply by standing up and saying: **Enough.**

      * It relies on you. It relies on me. It relies on all of us.

      So today—we draw the line. We hold the wall.

      This moment is the spark that ignites a fire for justice.

      Let us be the roar that reminds those in power that we are still here.
      Do you hear me? We are still here.

      We are the defenders of democracy.

      We are the guardians of the Constitution. We wield the shield and the sword. Our fury will not be quelled, and we DO NOT yield.

      **And we now use the Smash-A-Tron 5000 to put copies of the executive orders into Trump's crown and smash them while he sits next to us in HIS El Salvadoran prison garb** 
      "
    )
    
    add_speeches(speech_structs)
  end
  
  def add_speeches(speech_structs) 
    speech_structs.each do |speech_struct|
      puts "Processing Speaker:\n   #{speech_struct.name}"

      # BCG -- can't make this work at the model layer so fuck around and find out 
      # to fix it here.  **facepalm**
      
      sc_struct = OpenStruct.new(user_id: speech_struct.user_id, organization_id: speech_struct.organization_id)
      
      status, sc = ShareCode.find_or_create(sc_struct)
      
      speech_struct.slug = sc.share_code
      #debugger
      status, speech = Speech.find_or_create(speech_struct)
    end
  end



  # be rake speaker:metrics
  task :metrics => :environment do
    klass = "Speech"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

