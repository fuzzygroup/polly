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
      body: "# Defending the Constitution from Its Abusers
      
      Defending the Constitution from Its Abusers

      Delivered at The State House – May 2025

      Good afternoon, Indianapolis! 

      Thank you for coming out to protest with us!

      We stand here today out of fierce, unyielding devotion to this country. 

      We gather in protest because the Constitution—the very document that binds us together as a nation of laws and not of kings—is under attack. 

      And the threat comes directly from the executive office and those who continue to enable this destructive agenda. 

      I am here today to talk to you about Donald Trump’s executive orders and how they directly undermine the popular sovereignty of the constitution, while also violating Article VI, known as the Supremacy Clause. 

      Since May 14th, Trump has signed over 152 executive orders—each one chipping away at our rights and eroding the core of our constitutional order. Let’s call them what they are: assaults on liberty, on accountability, and on the rule of law.

      Consider Executive Order 14160—the so-called 

      **Protecting the Meaning and Value of American Citizenship order.** 

      With a single stroke of his pen, Trump attempted to gut the 14th Amendment, stripping citizenship from children born on U.S. soil if their parents are undocumented or here temporarily. 

      Let’s be clear, this is not a mere policy dispute—it’s a direct attack on a bedrock principle within our Constitution. Jus soli—the right of the soil – was settled by the Supreme Court in 1898 in United States v. Wong Kim Ark, affirming that every child born here, regardless of parentage, is an American. Yet Trump’s order spits in the face of that precedent—and of the Constitution itself.

      And what about the mass firings of Inspectors General—17 independent watchdogs were purged under the guise of **executive authority.**

      These inspectors serve to keep government honest, to shine the light of justice and prudence in dark corners. But with one wave of his hand, Trump gutted this vital check on presidential power—violating not just the spirit, but the letter of the Inspector General Act of 1978. 

      IGs investigate government misconduct: They expose fraud, waste, abuse, and corruption within federal agencies. Removing this independent regulatory body eliminated our independent oversight: Trump has weakened the very offices designed to hold his administration accountable. IGs uncover wrongdoing before it becomes public. Without them, Trump’s unfettered corruption can continue undetected. 

      Michael J. Missal, the former Inspector General of the U.S. Department of Veterans Affairs, was dismissed by Trump on January 24, 2025, as part of the mass firing. 
      In response to his dismissal, Missal stated 

      **Inspectors General are nonpartisan and independent, and ensure transparency from our federal government. We fight fraud, waste, and abuse every day. I am proud of the work we did to improve services and benefits for veterans and their families.**

      **With every firing, every silencing of oversight, Trump is not just asserting control—he’s denying us ours.**

      And it’s not just oversight that’s under attack. Trump’s executive actions are also striking at the very heart of due process—the fundamental right to fair treatment under the law.

      Take, for example, his invocation of the Alien Enemies Act to expedite deportations without hearings, stripping individuals of their right to a fair hearing. Consider the expansion of expedited removal policies that deny people the opportunity to defend themselves before being forced out of the country. And if this miscarriage of justice can happen to them, it can happen to any American. 

      These are not isolated incidents—they represent a calculated dismantling of the legal protections that safeguard every American. And make no mistake—when due process dies, dictatorship is alive.

      If that wasn’t bad enough, he’s gone a step further in his authoritarian power grab. Executive Order 14171, titled 

      **Restoring Accountability to Policy-Influencing Positions Within the Federal Workforce,**

      reintroduces and expands 
 
      **Schedule F,** 
 
      which allows him to fire tens of thousands of career civil servants. These nonpartisan experts serve the American people, not any one president. This is not reform. This is a hostile takeover of our government by political loyalists—a brazen assault on the separation of powers.

      With every purge, every silencing of oversight, Trump isn’t just tightening his grip—he’s choking our right to self-government. 

      Let’s talk about Executive Orders targeting independent regulatory agencies like the FTC and FCC—agencies designed to act as a check on political interference. Trump’s orders drag them under his personal control, gutting their independence and silencing dissent.

      Worse still, he’s used executive power to punish his critics directly. Remember his executive order targeting law firms—like Perkins Coie—that had the audacity to represent Americans opposing his administration? He ordered their federal contracts canceled and their security clearances revoked—an outrageous violation of the First Amendment, punishing people not for their actions, but for the mere act of dissent.
      What does the First Amendment guarantee? The right to free speech. The right to petition the government for redress of grievances. The right to stand here, today, and raise our voices without fear of retribution. But Trump’s America twists that promise into a threat: fall in line or face the consequences.

      We know that the Constitution is our nation’s shield against tyranny. But when an evil power holds the shield, it becomes a weapon – a battering ram against the legions of laws designed to protect our republic and democratic process. We must demand answers from our Supreme Court. 

      This same Court that claims to be **originalist**, demanding we interpret the Constitution in the purest, strictest sense of its words, flips their script when confronted with Trump’s orders—orders that eviscerate due process, checks and balances, and the fundamental rights of citizens—the Justices suddenly find room to maneuver, to equivocate, to allow these abuses to stand.

      It’s hypocrisy at its finest. They call themselves guardians of the Constitution, but in truth, they are enablers of its erosion. Their so-called fidelity to the framers is exposed as selective, weaponized to protect and enable a corrupt power grab. The people are left in the ruins of the war on the law itself.

      We, the people, are told that the Constitution is our shield. But what good is a shield if those sworn to hold it up instead use it to block justice?

      Friends, we know better. The Constitution is more than ink on parchment—it is a promise, a living covenant between the government and the governed. It is our task, and our sacred duty, to hold that promise alive.

      We must fight back against the betrayal of our rights. We must demand the restoration of independent oversight. We must insist that the 14th Amendment be honored, not hollowed out. And we must call out the Court’s hypocrisy—because silence in the face of injustice is complicity.

      As Frederick Douglass once said, 

      **The limits of tyrants are prescribed by the endurance of those whom they oppress.**

      Our endurance ends here.

      We will not sit by as our Constitution is shredded for political gain. We will not allow executive overreach to become the norm. And we will not let the highest court in the land excuse the inexcusable.

      Together, let’s rise—not just in protest, but in purpose. Not just with outrage—but with unshakable resolve.

      Because the Constitution does not defend itself—it relies on us.

      * It relies on teachers who refuse to teach lies.
      * On journalists who report truth in the face of propaganda.
      * On veterans who fought for a country they still believe in.
      * On activists who organize when others are silent.
      * On workers who know that democracy doesn’t clock out at 5 p.m.
      * On students who demand a future grounded in justice, not fear.
      * On immigrants who believe in this country more fiercely than many born into it.
      * It relies on parents raising children to question power, not worship it.
      * On artists who speak what cannot be silenced.
      * On whistleblowers who risk everything for transparency.
      * On judges, when they remember their oath is to the Constitution—not to a man.
      * It relies on farmers, nurses, scientists, neighbors, and voters—ordinary people doing extraordinary things simply by standing up and saying: **Enough.**
      * It relies on you.
      * On all of us.

      In this moment, we draw a line in the sand.

      Let today be the spark that lights the fire of accountability.

      Let it be the roar that reminds those in power that we are still here.

      We are the defenders of this democracy.

      We are the guardians of the Constitution.

      And we DO NOT yield.
      
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
      debugger
      status, speech = Speech.find_or_create(speech_struct)
    end
  end



  # be rake speaker:metrics
  task :metrics => :environment do
    klass = "Speech"
    puts "For object: #{klass.to_s}, there are #{klass.constantize.count} objects in the database"
  end
  
end

