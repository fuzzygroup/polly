# Opportunity Profile: polly -- Political Event Builder

## Overview

Creating a political event is a thousand odd discrete tasks wrapped into one messy furball.  Polly is a piece of software that aims to reduce creating a Political Event into a web app.

## Data Tables:

* events -- the actual events that people are creating
* users -- people who can log in to the system
* contributors -- people who do something for the event but may not be a user; think of these almost as named task executors
* groups -- a collection of users
* user_groups -- a way to bind all the people who work on the event into a whole
* speakers -- the people who speak at an event
* musicians -- the people who entertain us / make going to a protest worthshile
* speeches -- what they are speaking on 

## Development Approach

The development approach will be focused around Scott's data centric approach where:

* rake tasks build up data which represent core system level objects
* views render


# Name: ImgArr

## Domain: imgarr.com / ImgArr App

## Tag Lines: 

* Old School Paid Image Hosting for Bloggers and Other Online Folk
* Old School Image Hosting
* Old School Paid Image Hosting

## Product Names / Domains

* ImgArr
* imgarr.com

## Concept: 

Everyone has a camera at every moment of their lives but using those images in online contexts often isn't actually easy; this is particularly true when you bridge mobile and non mobile applications.  Let's consider someone who is an old school blogger and uses something like Jekyll or Bridgetown.  As a blogger myself, I generally like to put a picture at the top of my blog post.  Those pictures are located on my phone and here's my current workflow:

1. Find a picture
2. Use AirDrop to move it from my phone to my laptop
3. Open it in Acorn or Preview
4. Resize it
5. Export it since HEIC isn't usable by browsers afaik
6. Copy it from ~/Downloads where AirDrop places it to whatever crazy directory Jekyll / Bridgetown uses for assets
7. Deal with whatever crazy fuckery the asset path places on me
8. Write a blog post and reference the image (guessing what url the image will exist at)

That's 8 damn steps and, honestly, it sucks monkey balls.

What I, as a blogger really want, is the ability to just drop a url into my blog post and simply write.

ImgArr is "old school image hosting" which means:

1. You upload an image from your phone where it lives via an app (yes you can do this with Rails).
2. That image is automatically:

* converted to the right format
* hosted on the Internet
* accessible via a url
* has multiple sizing and presentation variants generated
* is short named just  like a TinyUrl

3. ImgArr will exist both as a mobile app and as a desktop website so an uploaded image automatically shows up on your ImgArr desktop (via a Turbo refresh) so you can just copy the url and go

## Initial Product

The initial product would be:

* A combination website and app (from Day 1 it needs to exist as an app)
* A paid product because any kind of hosting is automatically abused 
* A set of license terms which basically amount to "this costs $12 a year until you abuse it and then we kick you off or move you up a tier"
* The 1, 2, 3 upload and usability process above

### First Release

* Signup
* Email account confirmation
* A terms of service per the above
* Upload of images
* Using of images

#### Iteration 1

* Basic image uploading 

#### Iteration 2

* Image resizing 

#### Iteration 3

* TBD 

#### Iteration 4

* Support for user defined presentation options like "place this in a 25 pixel black frame" 
* Support for adding a watermark over the image 
* Support for adding a text line below / above the image

#### Iteration 5

* TBD 

#### Iteration 6

* A pro release with additional image conversion options per discussion with a potential user 

## Engineering Practices Notes

This needs to be a best of breed Rails app not the admittedly crappy proof of concept apps I generate.  This will be based on the Quotes Editor HotRails tutorial approach with HotWire / Turbo through out (any full screen redraws are deemed failures).

Additionally this needs 100% or close to 100% test coverage from Day 1.

## Marketing Approach

The marketing approach includes:

* Reaching out to forums where old school bloggers exist
* Reaching out to Bridgetown users
* Reaching out to Ghost users

## Features

See above.

## Open Questions

* How prevent abuse
* How measure profitability

## Platforms

* Web
* iOS App
* Google Play App  

## Uniqueness: 

Hosting exists but this niche used to be filled by imgur and imgur's marketing focus has led them to make it almost impossible to get the actual url of an image

## AI Technique:

None

## Requires User Account

Yes

## Feedback From Real World Market Research

1 user interview conducted that led to possible pro version concept.

## How Does It Make Money?

$12 / user / year

## Competition

Lots of image tools but I haven't seen this specific niche,.

## Dangers

Clear dangers include:

* Over engineering
* Second system syndrome
* Loss of focus

## Avoiding Previous Mistakes

There is an energy to building in public that launched Feedster with continuous feedback from users that generates momentum to carry me over the hump.  Almost of my post feedster efforts suffered from "second system syndrome" where I overbuilt based on engineering desires rather than customer feedback.

My user interface is rarely good enough; that needs to be a priority.

