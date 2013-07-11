$("#link_genre").show();
$("#new_genre").remove();
$("#start_genre").prepend("<%= j render(:partial => 'albums/genre', :object => @genre) %>");