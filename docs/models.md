# Data Modeling

## Events

rails g model Event name:string date_start:date date_end:date time_start:time time_end:time location:string permit_requested:boolean permit_received:boolean status:boolean user:references group:references musical_breaks:integer marching_breaks:integer chant_breaks:integer


"date_start: #{Date.new(2025,4,5)}|date_end: #{Date.new(2025,4,5)}|time_start:#{Time.new(2025,4,5,12)}|time_end:#{Time.new(2025,4,5,12)}|location:Indianapolis State House|permit_requested:#{True}|permit_received:#{True}|status:#{False}|user_id:#{User.scott.id}|group_id:#{Group.district7}|marching_breaks:1|musical_breaks:2|chant_breaks:1"


    splits << "name:4/5 Remove Reverse Reclaim Rally|date:#{Date.new(2025, 4, 5)}||location:Indianapolis State House|permit_requested:#{True}"
    splits << "name:4/5 Remove Reverse Reclaim Rally|date:#{Date.new(2025, 4, 5)}||location:Indianapolis State House|permit_requested:#{True}"

## Groups

rails g model Group name:string group_type:string
