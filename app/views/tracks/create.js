$("#link_track").show();
$("#new_track").remove();
$("#start_track").prepend("<%= j render(:partial => 'album_steps/track', :object => @track) %>");